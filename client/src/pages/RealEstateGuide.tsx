import { useState, useEffect, useMemo, useRef, useCallback } from "react";
import { Link, useLocation } from "wouter";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import "leaflet.markercluster";
import "leaflet.markercluster/dist/MarkerCluster.css";
import "leaflet.markercluster/dist/MarkerCluster.Default.css";
import { useQuery } from "@tanstack/react-query";
import { useToast } from "@/hooks/use-toast";
import type { RealEstateListing, RealEstateCategory } from "@shared/schema";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { useLanguage } from "@/lib/i18n";
import { useAuth } from "@/hooks/use-auth";
import { MapPin, Phone, ExternalLink, Building2, ChevronDown, ChevronUp, AlertTriangle, Eye, Pencil, ChevronLeft, ChevronRight, X, BookOpen, Map, List, DollarSign, Share2, Camera, Sparkles, Home as HomeIcon, Globe } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

function darkenHex(hex: string, amount: number = 30): string {
  const num = parseInt(hex.replace("#", ""), 16);
  const r = Math.max(0, (num >> 16) - amount);
  const g = Math.max(0, ((num >> 8) & 0x00FF) - amount);
  const b = Math.max(0, (num & 0x0000FF) - amount);
  return `#${(r << 16 | g << 8 | b).toString(16).padStart(6, "0")}`;
}
import { AppHeader } from "@/components/AppHeader";
import { TabNavigation } from "@/components/TabNavigation";
import { FixedBottomBar } from "@/components/FixedBottomBar";

interface RealEstatePlace {
  name: string;
  nameVi?: string;
  address?: string;
  phone?: string;
  mapUrl: string;
  note?: string;
  recommended?: boolean;
  imageUrl?: string;
  images?: string[];
  menuImages?: string[];
  description?: Record<string, string>;
  dbId?: number;
  sortOrder?: number;
  isPartner?: boolean;
  discountText?: string;
  latitude?: string;
  longitude?: string;
  website?: string;
}

interface RealEstateGroup {
  id: string;
  icon: React.ElementType;
  gradient: string;
  colorHex?: string;
  places: RealEstatePlace[];
}

type Place = RealEstatePlace;

function convertDBListing(dbPlace: RealEstateListing): Place | null {
  if (!dbPlace.isActive) return null;

  const description: Record<string, string> = {};
  if (dbPlace.description) {
    description.ko = dbPlace.description;
    description.en = dbPlace.description;
  }

  let mapUrl = "#";
  if (dbPlace.latitude && dbPlace.longitude) {
    mapUrl = `https://www.google.com/maps?q=${dbPlace.latitude},${dbPlace.longitude}`;
  } else if (dbPlace.website) {
    mapUrl = dbPlace.website;
  } else if (dbPlace.address) {
    mapUrl = `https://www.google.com/maps/search/${encodeURIComponent(dbPlace.address)}`;
  } else if (dbPlace.name) {
    mapUrl = `https://www.google.com/maps/search/${encodeURIComponent(dbPlace.name + ", Vung Tau")}`;
  }

  return {
    name: dbPlace.name,
    address: dbPlace.address || undefined,
    phone: dbPlace.phone || undefined,
    mapUrl,
    imageUrl: dbPlace.mainImage || undefined,
    images: dbPlace.images || [],
    menuImages: dbPlace.menuImages || [],
    description: Object.keys(description).length > 0 ? description : undefined,
    dbId: dbPlace.id,
    sortOrder: dbPlace.sortOrder ?? 0,
    isPartner: dbPlace.isPartner ?? false,
    discountText: dbPlace.discountText || undefined,
    latitude: dbPlace.latitude || undefined,
    longitude: dbPlace.longitude || undefined,
    website: dbPlace.website || undefined,
  };
}

function PlaceCard({
  place,
  language,
  isAdmin,
  categoryId,
  onEdit,
}: {
  place: Place;
  language: string;
  isAdmin: boolean;
  categoryId: string;
  onEdit: (place: Place, categoryId: string) => void;
}) {
  const [showMap, setShowMap] = useState(false);
  const [showDescription, setShowDescription] = useState(false);
  const [showEnlargedImage, setShowEnlargedImage] = useState(false);
  const [showMenuModal, setShowMenuModal] = useState(false);
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  const [menuImageIndex, setMenuImageIndex] = useState(0);
  const cardMapRef = useRef<HTMLDivElement>(null);
  const cardMapInstanceRef = useRef<L.Map | null>(null);
  const { toast } = useToast();

  const touchStartX = useRef(0);
  const touchEndX = useRef(0);

  const onTouchStart = (e: React.TouchEvent) => {
    touchStartX.current = e.changedTouches[0].screenX;
  };
  const onTouchMove = (e: React.TouchEvent) => {
    touchEndX.current = e.changedTouches[0].screenX;
  };
  const onTouchEndMenu = () => {
    const diff = touchStartX.current - touchEndX.current;
    if (Math.abs(diff) > 50 && place.menuImages && place.menuImages.length > 1) {
      if (diff > 0) {
        setMenuImageIndex((prev) => (prev + 1) % place.menuImages!.length);
      } else {
        setMenuImageIndex((prev) => (prev - 1 + place.menuImages!.length) % place.menuImages!.length);
      }
    }
  };
  const onTouchEndImage = () => {
    const diff = touchStartX.current - touchEndX.current;
    if (Math.abs(diff) > 50 && allImages.length > 1) {
      if (diff > 0) {
        setCurrentImageIndex((prev) => (prev + 1) % allImages.length);
      } else {
        setCurrentImageIndex((prev) => (prev - 1 + allImages.length) % allImages.length);
      }
    }
  };

  const descriptionText = place.description?.[language] || place.description?.ko || "";
  const placeSlug = encodeURIComponent(place.name);
  const allImages = useMemo(() => {
    const imgs: string[] = [];
    if (place.imageUrl) imgs.push(place.imageUrl);
    if (place.images) imgs.push(...place.images.filter(img => img !== place.imageUrl));
    return imgs;
  }, [place.imageUrl, place.images]);
  const hasMultipleImages = allImages.length > 1;
  const hasMenuImages = place.menuImages && place.menuImages.length > 0;

  const handleShare = async () => {
    const shareUrl = place.dbId
      ? `${window.location.origin}/realestate?p=${place.dbId}`
      : `${window.location.origin}/realestate?place=${encodeURIComponent(place.name)}`;
    try {
      if (navigator.share) {
        await navigator.share({ title: place.name, url: shareUrl });
      } else {
        await navigator.clipboard.writeText(shareUrl);
        toast({ title: language === "ko" ? "링크가 복사되었습니다" : "Link copied" });
      }
    } catch {}
  };

  useEffect(() => {
    if (showEnlargedImage || showMenuModal) {
      setShowDescription(true);
    }
  }, [showEnlargedImage, showMenuModal]);

  useEffect(() => {
    if (!showMap || !cardMapRef.current) return;
    if (cardMapInstanceRef.current) {
      cardMapInstanceRef.current.invalidateSize();
      return;
    }

    let lat: number | null = null;
    let lng: number | null = null;
    if (place.latitude && place.longitude) {
      lat = parseFloat(place.latitude);
      lng = parseFloat(place.longitude);
    } else if (place.mapUrl.includes("q=")) {
      const match = place.mapUrl.match(/q=([-\d.]+),([-\d.]+)/);
      if (match) {
        lat = parseFloat(match[1]);
        lng = parseFloat(match[2]);
      }
    }

    if (!lat || !lng || isNaN(lat) || isNaN(lng)) {
      lat = 10.3456;
      lng = 107.0844;
    }

    const map = L.map(cardMapRef.current, {
      center: [lat, lng],
      zoom: 16,
      zoomControl: true,
      dragging: true,
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; OpenStreetMap',
      maxZoom: 19,
    }).addTo(map);

    L.marker([lat, lng]).addTo(map).bindPopup(`
      <div style="text-align: center;">
        <strong>${place.name}</strong><br/>
        <a href="${place.mapUrl}" target="_blank" rel="noopener noreferrer" style="color: #3b82f6; font-size: 12px;">
          Google Maps
        </a>
      </div>
    `).openPopup();

    cardMapInstanceRef.current = map;
    setTimeout(() => map.invalidateSize(), 100);

    return () => {
      if (cardMapInstanceRef.current) {
        cardMapInstanceRef.current.remove();
        cardMapInstanceRef.current = null;
      }
    };
  }, [showMap, place.latitude, place.longitude, place.mapUrl]);

  const nextImage = (e: React.MouseEvent) => {
    e.stopPropagation();
    setCurrentImageIndex((prev) => (prev + 1) % allImages.length);
  };

  const prevImage = (e: React.MouseEvent) => {
    e.stopPropagation();
    setCurrentImageIndex((prev) => (prev - 1 + allImages.length) % allImages.length);
  };

  return (
    <Card id={place.dbId ? `realestate-id-${place.dbId}` : `realestate-${placeSlug}`} className="overflow-hidden hover:shadow-lg transition-shadow">
      <CardContent className="p-4">
        <div className="flex flex-col gap-2">
          {allImages.length > 0 && (
            <div
              className="relative w-full aspect-[16/9] rounded-lg overflow-hidden cursor-pointer group"
              onClick={() => setShowEnlargedImage(true)}
              data-testid={`realestate-image-${place.name.replace(/\s/g, "-")}`}
            >
              <img
                src={allImages[currentImageIndex]}
                alt={place.name}
                className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
                loading="lazy"
              />

              {hasMultipleImages && (
                <>
                  <button
                    onClick={prevImage}
                    className="absolute left-1 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-1 rounded-full transition-colors"
                    data-testid="realestate-button-prev-image"
                  >
                    <ChevronLeft className="w-4 h-4" />
                  </button>
                  <button
                    onClick={nextImage}
                    className="absolute right-1 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-1 rounded-full transition-colors"
                    data-testid="realestate-button-next-image"
                  >
                    <ChevronRight className="w-4 h-4" />
                  </button>
                  <div className="absolute bottom-8 left-1/2 -translate-x-1/2 flex gap-1">
                    {allImages.map((_, idx) => (
                      <div
                        key={idx}
                        className={`w-1.5 h-1.5 rounded-full transition-colors ${
                          idx === currentImageIndex ? "bg-white" : "bg-white/50"
                        }`}
                      />
                    ))}
                  </div>
                </>
              )}

              <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent flex items-end p-2">
                <span className="text-[10px] text-white flex items-center gap-1 drop-shadow-md">
                  {descriptionText ? (
                    <>
                      <Eye className="w-3 h-3" />
                      {language === "ko" ? "클릭하여 설명 보기" : "Click for details"}
                    </>
                  ) : (
                    <>
                      <MapPin className="w-3 h-3" />
                      {language === "ko" ? "사진 보기" : "View photo"}
                    </>
                  )}
                  {hasMultipleImages && (
                    <span className="ml-1 bg-white/20 px-1 rounded">
                      {currentImageIndex + 1}/{allImages.length}
                    </span>
                  )}
                </span>
              </div>
            </div>
          )}

          <AnimatePresence>
            {showDescription && descriptionText && (
              <motion.div
                initial={{ height: 0, opacity: 0 }}
                animate={{ height: "auto", opacity: 1 }}
                exit={{ height: 0, opacity: 0 }}
                transition={{ duration: 0.2 }}
                className="overflow-hidden"
              >
                <div className="bg-blue-50 dark:bg-blue-900/20 rounded-lg p-3 text-xs text-slate-700 dark:text-slate-300 leading-relaxed whitespace-pre-line">
                  {descriptionText}
                </div>
              </motion.div>
            )}
          </AnimatePresence>

          <div className="flex items-start justify-between gap-2">
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 flex-wrap">
                <h3 className="font-bold text-sm text-foreground">{place.name}</h3>
                {place.isPartner && (
                  <Badge variant="outline" className="text-[9px] px-1.5 py-0 border-amber-500 text-amber-600 dark:text-amber-400 bg-amber-50 dark:bg-amber-900/30">
                    협력업체
                  </Badge>
                )}
              </div>
              {place.nameVi && <p className="text-xs text-muted-foreground truncate">{place.nameVi}</p>}
              {place.isPartner && place.discountText && (
                <p className="text-[10px] text-green-600 dark:text-green-400 font-medium mt-0.5">
                  {place.discountText}
                </p>
              )}
            </div>
            <div className="flex items-center gap-1 flex-shrink-0">
              {place.recommended && (
                <Badge variant="default" className="bg-rose-500 text-[10px] px-1.5">
                  {language === "ko" ? "추천" : "Best"}
                </Badge>
              )}
              {isAdmin && place.dbId && (
                <Link href="/admin/real-estate">
                  <Button
                    size="icon"
                    variant="ghost"
                    className="h-6 w-6"
                    data-testid={`realestate-button-edit-${place.dbId}`}
                  >
                    <Pencil className="h-3 w-3" />
                  </Button>
                </Link>
              )}
            </div>
          </div>

          {place.address && (
            <p className="text-[11px] text-muted-foreground flex items-start gap-1">
              <MapPin className="w-3 h-3 mt-0.5 flex-shrink-0" />
              <span className="line-clamp-2">{place.address}</span>
            </p>
          )}

          <div className="flex items-center gap-2 flex-wrap">
            {place.phone && (
              <a href={`tel:${place.phone.replace(/\s/g, "")}`} className="flex items-center gap-1 text-[11px] text-blue-600 hover:underline">
                <Phone className="w-3 h-3" />
                {place.phone}
              </a>
            )}
            <a href={place.mapUrl} target="_blank" rel="noopener noreferrer" className="flex items-center gap-1 text-[11px] text-emerald-600 hover:underline">
              <ExternalLink className="w-3 h-3" />
              Google Maps
            </a>
            <button
              onClick={handleShare}
              className="flex items-center gap-1 text-[11px] text-violet-600 dark:text-violet-400 hover:underline"
              data-testid={`realestate-button-share-${place.name.replace(/\s/g, "-")}`}
            >
              <Share2 className="w-3 h-3" />
              {language === "ko" ? "공유" : "Share"}
            </button>
            {isAdmin && (
              <button
                onClick={() => onEdit(place, categoryId)}
                className="flex items-center gap-1 text-[11px] text-orange-600 hover:underline"
                data-testid={`realestate-button-edit-inline-${place.name.replace(/\s/g, "-")}`}
              >
                <Pencil className="w-3 h-3" />
                {language === "ko" ? "수정" : "Edit"}
              </button>
            )}
            {place.website && (
              <a
                href={place.website}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-1 text-[11px] text-cyan-600 dark:text-cyan-400 hover:underline"
                data-testid={`realestate-link-website-${place.name.replace(/\s/g, "-")}`}
              >
                <Globe className="w-3 h-3" />
                {language === "ko" ? "홈페이지" : "Website"}
              </a>
            )}
          </div>

          <div className="flex gap-2 mt-1">
            <Button
              variant="outline"
              size="sm"
              className="flex-1 text-xs h-8"
              onClick={() => setShowMap(!showMap)}
              data-testid={`realestate-button-toggle-map-${place.name.replace(/\s/g, "-")}`}
            >
              {showMap ? <ChevronUp className="w-3 h-3 mr-1" /> : <ChevronDown className="w-3 h-3 mr-1" />}
              {showMap ? (language === "ko" ? "지도 닫기" : "Hide Map") : (language === "ko" ? "지도 보기" : "View Map")}
            </Button>

            {hasMenuImages && (
              <Button
                variant="outline"
                size="sm"
                className="flex-1 text-xs h-8 border-amber-400 text-amber-600 hover:bg-amber-50 dark:hover:bg-amber-900/20"
                onClick={() => setShowMenuModal(true)}
                data-testid={`realestate-button-menu-${place.name.replace(/\s/g, "-")}`}
              >
                <BookOpen className="w-3 h-3 mr-1" />
                {language === "ko" ? "상세 보기" : "Details"}
              </Button>
            )}
          </div>

          <AnimatePresence>
            {showMap && (
              <motion.div
                initial={{ height: 0, opacity: 0 }}
                animate={{ height: 200, opacity: 1 }}
                exit={{ height: 0, opacity: 0 }}
                transition={{ duration: 0.3 }}
                className="overflow-hidden rounded-lg"
              >
                <div
                  ref={cardMapRef}
                  style={{ width: "100%", height: "200px" }}
                  className="rounded-lg"
                  data-testid={`realestate-map-${place.name.replace(/\s/g, "-")}`}
                />
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </CardContent>

      <AnimatePresence>
        {showMenuModal && hasMenuImages && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 bg-black/80 flex items-center justify-center p-4"
            onClick={() => setShowMenuModal(false)}
          >
            <motion.div
              initial={{ scale: 0.9 }}
              animate={{ scale: 1 }}
              exit={{ scale: 0.9 }}
              className="relative max-w-4xl max-h-[90vh] w-full"
              onClick={(e) => e.stopPropagation()}
            >
              <button
                onClick={() => setShowMenuModal(false)}
                className="absolute -top-10 right-0 text-white hover:text-gray-300"
                data-testid="realestate-button-close-menu-modal"
              >
                <X className="w-8 h-8" />
              </button>

              <div
                className="relative"
                onTouchStart={onTouchStart}
                onTouchMove={onTouchMove}
                onTouchEnd={onTouchEndMenu}
              >
                <img
                  src={place.menuImages![menuImageIndex]}
                  alt={`${menuImageIndex + 1}`}
                  className="w-full h-auto max-h-[80vh] object-contain rounded-lg select-none"
                  draggable={false}
                />

                {place.menuImages!.length > 1 && (
                  <>
                    <button
                      onClick={() => setMenuImageIndex((prev) => (prev - 1 + place.menuImages!.length) % place.menuImages!.length)}
                      className="absolute left-2 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-2 rounded-full transition-colors"
                      data-testid="realestate-button-prev-menu"
                    >
                      <ChevronLeft className="w-6 h-6" />
                    </button>
                    <button
                      onClick={() => setMenuImageIndex((prev) => (prev + 1) % place.menuImages!.length)}
                      className="absolute right-2 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-2 rounded-full transition-colors"
                      data-testid="realestate-button-next-menu"
                    >
                      <ChevronRight className="w-6 h-6" />
                    </button>
                    <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2">
                      {place.menuImages!.map((_, idx) => (
                        <button
                          key={idx}
                          onClick={() => setMenuImageIndex(idx)}
                          className={`w-3 h-3 rounded-full transition-colors ${
                            idx === menuImageIndex ? "bg-white" : "bg-white/50 hover:bg-white/70"
                          }`}
                        />
                      ))}
                    </div>
                  </>
                )}
              </div>

              <div className="text-center text-white mt-2 text-sm">
                {menuImageIndex + 1} / {place.menuImages!.length}
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>

      <AnimatePresence>
        {showEnlargedImage && allImages.length > 0 && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 bg-black/90 flex items-center justify-center p-4"
            onClick={() => setShowEnlargedImage(false)}
          >
            <motion.div
              initial={{ scale: 0.9 }}
              animate={{ scale: 1 }}
              exit={{ scale: 0.9 }}
              className="relative max-w-4xl max-h-[90vh] w-full"
              onClick={(e) => e.stopPropagation()}
            >
              <button
                onClick={() => setShowEnlargedImage(false)}
                className="absolute -top-10 right-0 text-white hover:text-gray-300 z-10"
                data-testid="realestate-button-close-enlarged-image"
              >
                <X className="w-8 h-8" />
              </button>

              <div
                className="relative"
                onTouchStart={onTouchStart}
                onTouchMove={onTouchMove}
                onTouchEnd={onTouchEndImage}
              >
                <img
                  src={allImages[currentImageIndex]}
                  alt={place.name}
                  className="w-full h-auto max-h-[80vh] object-contain rounded-lg select-none"
                  draggable={false}
                />

                {hasMultipleImages && (
                  <>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        setCurrentImageIndex((prev) => (prev - 1 + allImages.length) % allImages.length);
                      }}
                      className="absolute left-2 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-3 rounded-full transition-colors"
                      data-testid="realestate-button-prev-enlarged"
                    >
                      <ChevronLeft className="w-8 h-8" />
                    </button>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        setCurrentImageIndex((prev) => (prev + 1) % allImages.length);
                      }}
                      className="absolute right-2 top-1/2 -translate-y-1/2 bg-black/50 hover:bg-black/70 text-white p-3 rounded-full transition-colors"
                      data-testid="realestate-button-next-enlarged"
                    >
                      <ChevronRight className="w-8 h-8" />
                    </button>
                    <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2">
                      {allImages.map((_, idx) => (
                        <button
                          key={idx}
                          onClick={(e) => {
                            e.stopPropagation();
                            setCurrentImageIndex(idx);
                          }}
                          className={`w-3 h-3 rounded-full transition-colors ${
                            idx === currentImageIndex ? "bg-white" : "bg-white/50 hover:bg-white/70"
                          }`}
                        />
                      ))}
                    </div>
                  </>
                )}
              </div>

              <div className="text-center text-white mt-2 text-sm">
                {currentImageIndex + 1} / {allImages.length}
              </div>

              {descriptionText && (
                <div className="text-center text-white/80 mt-3 text-sm max-w-2xl mx-auto px-4 whitespace-pre-line">
                  {descriptionText}
                </div>
              )}
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </Card>
  );
}

export default function RealEstateGuide() {
  const { language, t } = useLanguage();
  const { user, isAdmin } = useAuth();
  const [, setLocation] = useLocation();
  const [expandedCategories, setExpandedCategories] = useState<Set<string>>(new Set());
  const [viewMode, setViewMode] = useState<"list" | "map">("list");
  const [selectedPlace, setSelectedPlace] = useState<Place | null>(null);
  const [placesOnMap, setPlacesOnMap] = useState(0);
  const [selectedMapCategories, setSelectedMapCategories] = useState<Set<string>>(new Set());
  const mapContainerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<L.Map | null>(null);
  const markersRef = useRef<L.Marker[]>([]);
  const clusterGroupRef = useRef<L.MarkerClusterGroup | null>(null);

  const { data: dbListings = [] } = useQuery<RealEstateListing[]>({
    queryKey: ["/api/real-estate-listings"],
  });

  const { data: dbCategories = [] } = useQuery<RealEstateCategory[]>({
    queryKey: ["/api/real-estate-categories"],
  });

  const getCategoryLabel = (categoryId: string): string => {
    const dbCat = dbCategories.find(c => c.id === categoryId);
    if (dbCat) {
      switch (language) {
        case "ko": return dbCat.labelKo || categoryId;
        case "en": return dbCat.labelEn || categoryId;
        case "zh": return dbCat.labelZh || categoryId;
        case "vi": return dbCat.labelVi || categoryId;
        case "ru": return dbCat.labelRu || categoryId;
        case "ja": return dbCat.labelJa || categoryId;
        default: return dbCat.labelKo || categoryId;
      }
    }
    return categoryId;
  };

  const categoryOrder = useMemo(() => {
    if (dbCategories.length === 0) return [];
    return [...dbCategories]
      .filter(c => c.isActive)
      .sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0))
      .map(c => c.id);
  }, [dbCategories]);

  const handleEditPlace = async (place: Place, categoryId: string) => {
    if (place.dbId) {
      setLocation(`/admin/real-estate?edit=${place.dbId}`);
    }
  };

  const groupedData = useMemo(() => {
    const groups: Record<string, RealEstateGroup> = {};

    const iconMap: Record<string, any> = {
      MapPin, Camera, Building2, Sparkles, HomeIcon, DollarSign,
    };

    dbCategories.forEach(dbCat => {
      if (!dbCat.isActive) return;

      const categoryListings = dbListings
        .filter(p => p.category === dbCat.id && p.isActive)
        .sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999))
        .map(p => convertDBListing(p))
        .filter((p): p is Place => p !== null);

      groups[dbCat.id] = {
        id: dbCat.id,
        icon: iconMap[dbCat.icon || "Building2"] || Building2,
        gradient: dbCat.gradient || "from-gray-500 to-gray-700",
        colorHex: dbCat.color || "#64748b",
        places: categoryListings,
      };
    });

    return groups;
  }, [dbListings, dbCategories]);

  const allPlaces = useMemo(() => {
    const places: (Place & { categoryId: string })[] = [];
    Object.entries(groupedData).forEach(([categoryId, category]) => {
      category.places.forEach(place => {
        places.push({ ...place, categoryId });
      });
    });
    return places;
  }, [groupedData]);

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const placeId = params.get("p");
    const placeName = params.get("place");
    if ((!placeId && !placeName) || Object.keys(groupedData).length === 0) return;
    let targetElId = "";
    for (const [catKey, cat] of Object.entries(groupedData)) {
      const found = placeId
        ? cat.places.find(p => p.dbId === Number(placeId))
        : cat.places.find(p => p.name === placeName);
      if (found) {
        targetElId = found.dbId ? `realestate-id-${found.dbId}` : `realestate-${encodeURIComponent(found.name)}`;
        setExpandedCategories(prev => {
          const next = new Set(prev);
          next.add(catKey);
          return next;
        });
        break;
      }
    }
    if (!targetElId) return;
    setTimeout(() => {
      const el = document.getElementById(targetElId);
      if (el) {
        el.scrollIntoView({ behavior: "smooth", block: "center" });
        el.classList.add("ring-2", "ring-violet-400");
        setTimeout(() => el.classList.remove("ring-2", "ring-violet-400"), 3000);
      }
    }, 800);
  }, [groupedData]);

  useEffect(() => {
    if (viewMode !== "map" || !mapContainerRef.current) return;

    if (mapRef.current) {
      setTimeout(() => {
        mapRef.current?.invalidateSize();
      }, 100);
      return;
    }

    const container = mapContainerRef.current;
    if (!container || container.clientHeight === 0) {
      const timer = setTimeout(() => {
        if (mapContainerRef.current && !mapRef.current) {
          initializeMap();
        }
      }, 200);
      return () => clearTimeout(timer);
    }

    initializeMap();

    function initializeMap() {
      if (!mapContainerRef.current || mapRef.current) return;

      const center: [number, number] = [10.3456, 107.0844];
      const map = L.map(mapContainerRef.current, {
        center,
        zoom: 13,
        zoomControl: true,
        preferCanvas: true,
      });

      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        maxZoom: 19,
      }).addTo(map);

      const clusterGroup = (L as any).markerClusterGroup({
        maxClusterRadius: 50,
        spiderfyOnMaxZoom: true,
        showCoverageOnHover: false,
        zoomToBoundsOnClick: true,
        disableClusteringAtZoom: 16,
        chunkedLoading: true,
      });
      map.addLayer(clusterGroup);
      clusterGroupRef.current = clusterGroup;

      mapRef.current = map;
      setTimeout(() => {
        map.invalidateSize();
      }, 100);
    }

    return () => {
      if (clusterGroupRef.current) {
        clusterGroupRef.current.clearLayers();
        clusterGroupRef.current = null;
      }
      if (mapRef.current) {
        mapRef.current.remove();
        mapRef.current = null;
      }
    };
  }, [viewMode]);

  useEffect(() => {
    if (!mapRef.current || !clusterGroupRef.current || viewMode !== "map") return;

    clusterGroupRef.current.clearLayers();
    markersRef.current = [];

    const filteredPlaces = selectedMapCategories.size === 0
      ? allPlaces
      : selectedMapCategories.has("partner")
        ? allPlaces.filter(place => place.isPartner)
        : allPlaces.filter(place => selectedMapCategories.has(place.categoryId));

    let placesWithCoords = 0;
    filteredPlaces.forEach(place => {
      let lat: number | null = null;
      let lng: number | null = null;

      if (place.latitude && place.longitude) {
        lat = parseFloat(place.latitude);
        lng = parseFloat(place.longitude);
      } else if (place.mapUrl.includes("q=")) {
        const match = place.mapUrl.match(/q=([-\d.]+),([-\d.]+)/);
        if (match) {
          lat = parseFloat(match[1]);
          lng = parseFloat(match[2]);
        }
      }

      if (!lat || !lng || isNaN(lat) || isNaN(lng)) return;
      placesWithCoords++;

      const dbCatForColor = dbCategories.find(c => c.id === place.categoryId);
      const color = dbCatForColor?.color || "#64748b";

      const markerSize = place.isPartner ? 50 : 40;
      const borderColor = place.isPartner ? '#f59e0b' : (selectedPlace?.name === place.name ? '#3b82f6' : color);
      const borderWidth = place.isPartner ? 4 : 3;

      const partnerBadge = place.isPartner ? `
        <div style="
          position: absolute; top: -14px; left: 50%; transform: translateX(-50%);
          background: linear-gradient(135deg, #f59e0b, #d97706); color: white;
          padding: 2px 6px; border-radius: 8px; font-size: 8px; font-weight: bold;
          white-space: nowrap; box-shadow: 0 2px 4px rgba(0,0,0,0.3);
          border: 1px solid #fbbf24;
        ">Partner</div>
      ` : '';

      const iconHtml = place.imageUrl
        ? `<div style="position: relative;">
            ${partnerBadge}
            <div style="
              width: ${markerSize}px; height: ${markerSize}px; border-radius: 8px; overflow: hidden;
              border: ${borderWidth}px solid ${borderColor};
              box-shadow: 0 2px 8px rgba(0,0,0,0.3); cursor: pointer;
              background: white;
            ">
              <img src="${place.imageUrl}" style="width: 100%; height: 100%; object-fit: cover;" />
            </div>
          </div>`
        : `<div style="position: relative;">
            ${partnerBadge}
            <div style="
              width: ${markerSize}px; height: ${markerSize}px; border-radius: 8px;
              background: ${place.isPartner ? 'linear-gradient(135deg, #f59e0b, #d97706)' : color};
              display: flex; align-items: center; justify-content: center;
              border: ${borderWidth}px solid ${place.isPartner ? '#fbbf24' : '#fff'};
              box-shadow: 0 2px 8px rgba(0,0,0,0.3); cursor: pointer;
            ">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="white">
                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
              </svg>
            </div>
          </div>`;

      const customIcon = L.divIcon({
        className: 'custom-realestate-marker',
        html: iconHtml,
        iconSize: [markerSize, markerSize + (place.isPartner ? 14 : 0)],
        iconAnchor: [markerSize / 2, markerSize + (place.isPartner ? 14 : 0)],
      });

      const categoryLabel = getCategoryLabel(place.categoryId);
      const descText = place.description?.[language] || place.description?.ko || "";

      const popupHtml = `
        <div style="min-width: 200px; max-width: 280px;">
          ${place.imageUrl ? `
            <img src="${place.imageUrl}"
              style="width: 100%; height: 120px; object-fit: cover; border-radius: 8px; margin-bottom: 8px;"
              onerror="this.style.display='none'" />
          ` : ""}
          <div style="display: flex; align-items: center; gap: 6px; margin-bottom: 4px;">
            <span style="background: ${color}; color: white; padding: 2px 8px; border-radius: 4px; font-size: 10px;">
              ${categoryLabel}
            </span>
            ${place.isPartner ? `<span style="background: #f59e0b; color: white; padding: 2px 6px; border-radius: 4px; font-size: 10px;">Partner</span>` : ""}
          </div>
          <h3 style="font-weight: 600; font-size: 14px; margin: 4px 0 6px 0; color: #1f2937;">${place.name}</h3>
          ${place.address ? `<p style="font-size: 11px; color: #6b7280; margin: 2px 0;">${place.address}</p>` : ""}
          ${place.phone ? `<p style="font-size: 11px; color: #6b7280; margin: 2px 0;">${place.phone}</p>` : ""}
          ${descText ? `<p style="font-size: 11px; color: #374151; margin: 6px 0 0 0; line-height: 1.4;">${descText.slice(0, 100)}${descText.length > 100 ? "..." : ""}</p>` : ""}
          ${place.isPartner && place.discountText ? `<p style="font-size: 11px; color: #dc2626; font-weight: 500; margin: 6px 0 0 0;">${place.discountText}</p>` : ""}
          <div style="margin-top: 8px; display: flex; gap: 6px;">
            <a href="${place.mapUrl}" target="_blank" rel="noopener noreferrer"
              style="flex: 1; text-align: center; background: #3b82f6; color: white; padding: 6px 10px; border-radius: 6px; font-size: 11px; text-decoration: none;">
              ${language === "ko" ? "길찾기" : "Directions"}
            </a>
            ${place.phone ? `
              <a href="tel:${place.phone}"
                style="flex: 1; text-align: center; background: #22c55e; color: white; padding: 6px 10px; border-radius: 6px; font-size: 11px; text-decoration: none;">
                ${language === "ko" ? "전화" : "Call"}
              </a>
            ` : ""}
          </div>
        </div>
      `;

      const marker = L.marker([lat, lng], { icon: customIcon })
        .bindPopup(popupHtml, {
          maxWidth: 300,
          className: 'custom-popup'
        });

      marker.bindTooltip(place.name, {
        permanent: false,
        direction: 'top',
        offset: [0, place.isPartner ? -54 : -40]
      });

      if (place.isPartner) {
        marker.addTo(mapRef.current!);
      } else {
        clusterGroupRef.current!.addLayer(marker);
      }
      markersRef.current.push(marker);
    });

    setPlacesOnMap(placesWithCoords);
  }, [allPlaces, viewMode, selectedPlace, selectedMapCategories]);

  const toggleCategory = (categoryId: string) => {
    setExpandedCategories(prev => {
      const next = new Set(prev);
      if (next.has(categoryId)) {
        next.delete(categoryId);
      } else {
        next.add(categoryId);
      }
      return next;
    });
  };

  const pageTitle: Record<string, string> = {
    ko: "붕따우 부동산 가이드",
    en: "Vung Tau Real Estate Guide",
    zh: "头顿房地产指南",
    vi: "Hướng dẫn Bất động sản Vũng Tàu",
    ru: "Гид по недвижимости Вунгтау",
    ja: "ブンタウ不動産ガイド"
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-50 to-white dark:from-slate-900 dark:to-slate-800">
      <AppHeader />

      <TabNavigation language={language} />

      <div className="container mx-auto px-4 max-w-4xl py-8">
        <div className="flex justify-end mb-4 gap-2">
          <Button
            variant={viewMode === "list" ? "default" : "outline"}
            size="sm"
            onClick={() => setViewMode("list")}
            data-testid="realestate-button-list-view"
          >
            <List className="w-4 h-4 mr-1" />
            {language === "ko" ? "목록" : "List"}
          </Button>
          <Button
            variant={viewMode === "map" ? "default" : "outline"}
            size="sm"
            onClick={() => setViewMode("map")}
            data-testid="realestate-button-map-view"
          >
            <Map className="w-4 h-4 mr-1" />
            {language === "ko" ? "지도" : "Map"}
          </Button>
        </div>

        {viewMode === "map" && (
          <div className="mb-6">
            <div
              ref={mapContainerRef}
              className="w-full rounded-lg border shadow-lg"
              style={{ height: "400px", minHeight: "400px", position: "relative", zIndex: 1 }}
              data-testid="realestate-map-container"
            />

            <AnimatePresence>
              {selectedPlace && (
                <motion.div
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: 20 }}
                  className="mt-4"
                >
                  <Card className="overflow-hidden">
                    <CardContent className="p-4">
                      <div className="flex gap-4">
                        {selectedPlace.imageUrl && (
                          <img
                            src={selectedPlace.imageUrl}
                            alt={selectedPlace.name}
                            className="w-24 h-24 object-cover rounded-lg"
                          />
                        )}
                        <div className="flex-1">
                          <h3 className="font-bold text-lg">{selectedPlace.name}</h3>
                          {selectedPlace.nameVi && (
                            <p className="text-sm text-muted-foreground">{selectedPlace.nameVi}</p>
                          )}
                          {selectedPlace.address && (
                            <p className="text-xs text-muted-foreground mt-1 flex items-center gap-1">
                              <MapPin className="w-3 h-3" />
                              {selectedPlace.address}
                            </p>
                          )}
                          <div className="flex gap-2 mt-2">
                            <a
                              href={selectedPlace.mapUrl}
                              target="_blank"
                              rel="noopener noreferrer"
                            >
                              <Button size="sm" variant="outline">
                                <ExternalLink className="w-3 h-3 mr-1" />
                                Google Maps
                              </Button>
                            </a>
                            {selectedPlace.phone && (
                              <a href={`tel:${selectedPlace.phone}`}>
                                <Button size="sm" variant="outline">
                                  <Phone className="w-3 h-3 mr-1" />
                                  {language === "ko" ? "전화" : "Call"}
                                </Button>
                              </a>
                            )}
                          </div>
                        </div>
                        <Button
                          size="icon"
                          variant="ghost"
                          onClick={() => setSelectedPlace(null)}
                        >
                          <X className="w-4 h-4" />
                        </Button>
                      </div>
                    </CardContent>
                  </Card>
                </motion.div>
              )}
            </AnimatePresence>

            <div className="mt-4 p-2 bg-blue-50 dark:bg-blue-900/20 rounded-lg border border-blue-200 dark:border-blue-800">
              <p className="text-xs text-blue-700 dark:text-blue-300">
                {language === "ko"
                  ? `지도에 ${placesOnMap}개 장소 표시 중 (전체 ${allPlaces.length}개 중 좌표가 있는 장소만 표시됩니다)`
                  : `${placesOnMap} places shown on map (only places with coordinates from ${allPlaces.length} total)`}
              </p>
            </div>

            <div className="mt-4 p-3 bg-card rounded-lg border">
              <p className="text-xs font-medium mb-2">{language === "ko" ? "카테고리 필터 (클릭하여 선택)" : "Category Filter (click to select)"}</p>
              <div className="flex flex-wrap gap-2">
                <button
                  onClick={() => setSelectedMapCategories(new Set())}
                  className={`flex items-center gap-1 px-2 py-1 rounded-full border transition-all ${
                    selectedMapCategories.size === 0
                      ? "bg-primary text-primary-foreground border-primary"
                      : "bg-muted/50 hover:bg-muted border-transparent"
                  }`}
                  data-testid="realestate-map-filter-all"
                >
                  <span className="text-[10px] font-medium">{language === "ko" ? "전체" : "All"}</span>
                </button>
                {dbCategories
                  .filter(c => c.isActive)
                  .sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0))
                  .map(cat => {
                    const isSelected = selectedMapCategories.has(cat.id);
                    const catColor = cat.color || "#64748b";
                    const label = language === "ko" ? cat.labelKo : (cat.labelEn || cat.labelKo);
                    return (
                      <button
                        key={cat.id}
                        onClick={() => {
                          const newSet = new Set(selectedMapCategories);
                          if (isSelected) {
                            newSet.delete(cat.id);
                          } else {
                            newSet.add(cat.id);
                          }
                          setSelectedMapCategories(newSet);
                        }}
                        className={`flex items-center gap-1 px-2 py-1 rounded-full border transition-all ${
                          isSelected
                            ? "ring-2 ring-offset-1"
                            : "opacity-60 hover:opacity-100"
                        }`}
                        style={{
                          backgroundColor: isSelected ? catColor : 'transparent',
                          borderColor: catColor,
                          color: isSelected ? 'white' : 'inherit'
                        }}
                        data-testid={`realestate-map-filter-${cat.id}`}
                      >
                        <div
                          className="w-2.5 h-2.5 rounded-full"
                          style={{ backgroundColor: isSelected ? 'white' : catColor }}
                        />
                        <span className="text-[10px] font-medium">{label}</span>
                      </button>
                    );
                  })}
              </div>
            </div>
          </div>
        )}

        {viewMode === "list" && (
          <div className="space-y-4">
            {categoryOrder.map((key) => {
              const category = groupedData[key];
              if (!category) return null;
              const Icon = category.icon;
              const isExpanded = expandedCategories.has(key);
              const label = getCategoryLabel(key);

              return (
                <Card key={key} className="overflow-hidden">
                  <CardHeader
                    className="cursor-pointer text-white py-3 px-4"
                    style={{
                      background: (() => {
                        const c = category.colorHex || "#64748b";
                        return `linear-gradient(to right, ${c}, ${darkenHex(c, 40)})`;
                      })(),
                    }}
                    onClick={() => toggleCategory(key)}
                    data-testid={`realestate-category-header-${key}`}
                  >
                    <CardTitle className="flex items-center justify-between text-base">
                      <div className="flex items-center gap-2">
                        <Icon className="w-5 h-5" />
                        <span>{label}</span>
                        <Badge variant="secondary" className="bg-white/20 text-white text-[10px]">
                          {category.places.length}
                        </Badge>
                      </div>
                      <div className="flex items-center gap-2">
                        {isAdmin && (
                          <Link href="/admin/real-estate">
                            <Button
                              size="sm"
                              variant="ghost"
                              className="h-7 px-2 text-white hover:bg-white/20"
                              onClick={(e) => e.stopPropagation()}
                              data-testid="realestate-button-admin"
                            >
                              <Pencil className="w-4 h-4 mr-1" />
                              {language === "ko" ? "관리" : "Manage"}
                            </Button>
                          </Link>
                        )}
                        {isExpanded ? <ChevronUp className="w-5 h-5" /> : <ChevronDown className="w-5 h-5" />}
                      </div>
                    </CardTitle>
                  </CardHeader>

                  <AnimatePresence>
                    {isExpanded && (
                      <motion.div
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: "auto", opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        transition={{ duration: 0.3 }}
                      >
                        <CardContent className="p-4">
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                            {category.places.map((place, idx) => (
                              <PlaceCard
                                key={idx}
                                place={place}
                                language={language}
                                isAdmin={isAdmin}
                                categoryId={key}
                                onEdit={handleEditPlace}
                              />
                            ))}
                          </div>
                        </CardContent>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </Card>
              );
            })}

            {categoryOrder.length === 0 && (
              <div className="text-center py-12 text-muted-foreground">
                <Building2 className="w-12 h-12 mx-auto mb-4 opacity-50" />
                <p className="text-lg font-medium">
                  {language === "ko" ? "등록된 부동산 정보가 없습니다" : "No real estate listings yet"}
                </p>
                <p className="text-sm mt-2">
                  {language === "ko" ? "관리자가 카테고리와 매물을 추가하면 여기에 표시됩니다" : "Listings will appear here once added by admin"}
                </p>
              </div>
            )}
          </div>
        )}

        <div className="h-20" />
      </div>

      <FixedBottomBar />
    </div>
  );
}
