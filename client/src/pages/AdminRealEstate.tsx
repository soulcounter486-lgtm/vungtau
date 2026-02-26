import { useState, useMemo, useEffect, useRef } from "react";
import L from "leaflet";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/hooks/use-auth";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { Switch } from "@/components/ui/switch";
import { useToast } from "@/hooks/use-toast";
import { ArrowLeft, Plus, Pencil, Trash2, Image, MapPin, Phone, Clock, DollarSign, Tag, Loader2, Upload, GripVertical, EyeOff, Folder, ChevronUp, ChevronDown, LocateFixed } from "lucide-react";
import { Link, useLocation } from "wouter";
import type { RealEstateListing, RealEstateCategory } from "@shared/schema";
import { DndContext, closestCenter, KeyboardSensor, PointerSensor, useSensor, useSensors, DragEndEvent } from "@dnd-kit/core";
import { arrayMove, SortableContext, sortableKeyboardCoordinates, useSortable, verticalListSortingStrategy } from "@dnd-kit/sortable";
import { CSS } from "@dnd-kit/utilities";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export default function AdminRealEstate() {
  const { user, isAdmin } = useAuth();
  const { toast } = useToast();
  const queryClient = useQueryClient();
  const [isAddOpen, setIsAddOpen] = useState(false);
  const [editingPlace, setEditingPlace] = useState<RealEstateListing | null>(null);
  const [filterCategory, setFilterCategory] = useState<string>("all");
  const [activeTab, setActiveTab] = useState<"places" | "categories">("places");

  const { data: dbPlaces = [], isLoading } = useQuery<RealEstateListing[]>({
    queryKey: ["/api/admin/real-estate-listings"],
    enabled: isAdmin,
  });
  
  const { data: dbCategories = [], isLoading: isCategoriesLoading } = useQuery<RealEstateCategory[]>({
    queryKey: ["/api/admin/real-estate-categories"],
    enabled: isAdmin,
  });
  const [, setLocation] = useLocation();

  type UnifiedPlace = {
    id: string;
    name: string;
    category: string;
    address?: string;
    phone?: string;
    description?: string;
    imageUrl?: string;
    mapUrl?: string;
    sortOrder: number;
    dbPlace?: RealEstateListing;
  };

  const unifiedPlaces = useMemo(() => {
    const list: UnifiedPlace[] = [];
    
    const activeDbPlaces = dbPlaces.filter(p => p.isActive !== false);
    const sortedDbPlaces = [...activeDbPlaces].sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999));
    sortedDbPlaces.forEach(dbPlace => {
      list.push({
        id: `db-${dbPlace.id}`,
        name: dbPlace.name,
        category: dbPlace.category,
        address: dbPlace.address || undefined,
        phone: dbPlace.phone || undefined,
        description: dbPlace.description || undefined,
        imageUrl: dbPlace.mainImage || undefined,
        mapUrl: dbPlace.website || undefined,
        sortOrder: dbPlace.sortOrder ?? 999,
        dbPlace,
      });
    });
    
    list.sort((a, b) => a.sortOrder - b.sortOrder);
    
    return list;
  }, [dbPlaces]);

  const filteredPlaces = useMemo(() => {
    const filtered = filterCategory === "all"
      ? [...unifiedPlaces]
      : unifiedPlaces.filter(p => p.category === filterCategory);
    
    return filtered.sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999));
  }, [unifiedPlaces, filterCategory]);

  const sensors = useSensors(
    useSensor(PointerSensor, {
      activationConstraint: {
        delay: 200,
        tolerance: 5,
      },
    }),
    useSensor(KeyboardSensor, {
      coordinateGetter: sortableKeyboardCoordinates,
    })
  );

  const handleDragEnd = async (event: DragEndEvent) => {
    const { active, over } = event;
    
    if (!over || active.id === over.id) return;
    
    const movedPlace = filteredPlaces.find(p => p.id === active.id);
    const targetPlace = filteredPlaces.find(p => p.id === over.id);
    
    if (!movedPlace || !targetPlace) return;
    
    if (movedPlace.category !== targetPlace.category) {
      toast({ title: "같은 카테고리 내에서만 이동할 수 있습니다", variant: "destructive" });
      return;
    }
    
    const sameCategoryPlaces = filteredPlaces.filter(p => p.category === movedPlace.category);
    const targetIndex = sameCategoryPlaces.findIndex(p => p.id === over.id);
    
    if (targetIndex === -1) {
      toast({ title: "순서 변경 실패", variant: "destructive" });
      return;
    }
    
    try {
      const res = await fetch(`/api/admin/real-estate-listings/${movedPlace.dbPlace!.id}/order`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ newIndex: targetIndex }),
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-listings"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-listings"] });
    } catch (error) {
      toast({ title: "순서 변경 실패", variant: "destructive" });
    }
  };

  const createMutation = useMutation({
    mutationFn: async (data: Partial<RealEstateListing>) => {
      const res = await fetch("/api/admin/real-estate-listings", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(data),
      });
      if (!res.ok) {
        const errorData = await res.json().catch(() => ({}));
        throw new Error(errorData.error || `HTTP ${res.status}`);
      }
      return res.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-listings"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-listings"] });
      setIsAddOpen(false);
      toast({ title: "매물이 추가되었습니다" });
    },
    onError: (error: Error) => {
      toast({ title: `추가 실패: ${error.message}`, variant: "destructive" });
    },
  });

  const updateMutation = useMutation({
    mutationFn: async ({ id, data }: { id: number; data: Partial<RealEstateListing> }) => {
      const res = await fetch(`/api/admin/real-estate-listings/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(data),
      });
      if (!res.ok) throw new Error("Failed to update");
      return res.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-listings"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-listings"] });
      setEditingPlace(null);
      toast({ title: "매물이 수정되었습니다" });
    },
    onError: () => {
      toast({ title: "수정 실패", variant: "destructive" });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: number) => {
      const res = await fetch(`/api/admin/real-estate-listings/${id}`, {
        method: "DELETE",
        credentials: "include",
      });
      if (!res.ok) throw new Error("Failed to delete");
      return res.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-listings"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-listings"] });
      toast({ title: "매물이 삭제되었습니다" });
    },
    onError: () => {
      toast({ title: "삭제 실패", variant: "destructive" });
    },
  });

  const handleMoveOrder = async (place: RealEstateListing, direction: number) => {
    const newOrder = (place.sortOrder ?? 0) + direction;
    try {
      const res = await fetch(`/api/admin/real-estate-listings/${place.id}/order`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ sortOrder: newOrder }),
      });
      if (!res.ok) throw new Error("Failed to update order");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-listings"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-listings"] });
    } catch (error) {
      toast({ title: "순서 변경 실패", variant: "destructive" });
    }
  };

  if (!user) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <Card className="p-6">
          <p className="text-muted-foreground">로그인이 필요합니다</p>
          <Link href="/">
            <Button className="mt-4">홈으로 돌아가기</Button>
          </Link>
        </Card>
      </div>
    );
  }

  if (!isAdmin) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <Card className="p-6">
          <p className="text-muted-foreground">관리자 권한이 필요합니다</p>
          <Link href="/">
            <Button className="mt-4">홈으로 돌아가기</Button>
          </Link>
        </Card>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-6">
        <div className="flex items-center gap-4 mb-6 flex-wrap">
          <Link href="/">
            <Button variant="ghost" size="icon" data-testid="realestate-button-back">
              <ArrowLeft className="h-5 w-5" />
            </Button>
          </Link>
          <h1 className="text-2xl font-bold">부동산 관리</h1>
          
          {activeTab === "places" && (
            <Dialog open={isAddOpen} onOpenChange={setIsAddOpen}>
              <DialogTrigger asChild>
                <Button className="ml-auto" data-testid="realestate-button-add-place">
                  <Plus className="h-4 w-4 mr-2" />
                  새 매물 추가
                </Button>
              </DialogTrigger>
              <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                  <DialogTitle>새 매물 추가</DialogTitle>
                </DialogHeader>
                <RealEstateForm
                  defaultCategory={filterCategory !== "all" ? filterCategory : "apartment"}
                  onSubmit={(data) => createMutation.mutate(data)}
                  isLoading={createMutation.isPending}
                  onCancel={() => setIsAddOpen(false)}
                  categories={dbCategories}
                />
              </DialogContent>
            </Dialog>
          )}
        </div>

        <div className="flex gap-2 mb-4 border-b pb-2">
          <Button
            variant={activeTab === "places" ? "default" : "ghost"}
            onClick={() => setActiveTab("places")}
            data-testid="realestate-tab-places"
          >
            <MapPin className="h-4 w-4 mr-2" />
            매물 관리
          </Button>
          <Button
            variant={activeTab === "categories" ? "default" : "ghost"}
            onClick={() => setActiveTab("categories")}
            data-testid="realestate-tab-categories"
          >
            <Folder className="h-4 w-4 mr-2" />
            카테고리 관리
          </Button>
        </div>

        {activeTab === "categories" ? (
          <RealEstateCategoryManagement 
            categories={dbCategories} 
            isLoading={isCategoriesLoading}
            queryClient={queryClient}
            toast={toast}
          />
        ) : (
          <>
            <div className="flex gap-2 mb-4 overflow-x-auto pb-2">
              {[
                { value: "all", label: "전체" },
                ...[...dbCategories].sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999)).map(cat => ({
                  value: cat.id,
                  label: cat.labelKo || cat.id,
                }))
              ].map(tab => (
                <Button
                  key={tab.value}
                  variant={filterCategory === tab.value ? "default" : "outline"}
                  size="sm"
                  onClick={() => setFilterCategory(tab.value)}
                  data-testid={`realestate-filter-${tab.value}`}
                >
                  {tab.label}
                  {tab.value !== "all" && (
                    <span className="ml-1 text-xs opacity-70">
                      ({unifiedPlaces.filter(p => p.category === tab.value).length})
                    </span>
                  )}
                </Button>
              ))}
            </div>
            
            <p className="text-xs text-muted-foreground mb-4">
              드래그 핸들을 길게 눌러 순서 변경
            </p>

            {isLoading ? (
              <div className="flex justify-center py-12">
                <div className="animate-spin h-8 w-8 border-4 border-primary border-t-transparent rounded-full" />
              </div>
            ) : filteredPlaces.length === 0 ? (
              <Card className="p-12 text-center">
                <MapPin className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
                <p className="text-muted-foreground mb-4">해당 카테고리에 매물이 없습니다</p>
                <Button onClick={() => setIsAddOpen(true)}>새 매물 추가하기</Button>
              </Card>
            ) : (
              <DndContext 
                sensors={sensors} 
                collisionDetection={closestCenter} 
                onDragEnd={handleDragEnd}
              >
                <SortableContext items={filteredPlaces.map(p => p.id)} strategy={verticalListSortingStrategy}>
                  <div className="grid gap-3">
                    {filteredPlaces.map((place) => (
                      <SortableRealEstateCard
                        key={place.id}
                        place={place}
                        onEdit={(p) => {
                          if (p.dbPlace) {
                            setEditingPlace(p.dbPlace);
                          }
                        }}
                        onDelete={deleteMutation.mutate}
                        editingPlace={editingPlace}
                        setEditingPlace={setEditingPlace}
                        updateMutation={updateMutation}
                        categories={dbCategories}
                      />
                    ))}
                  </div>
                </SortableContext>
              </DndContext>
            )}
          </>
        )}
      </div>
    </div>
  );
}

interface SortableRealEstateCardProps {
  place: {
    id: string;
    name: string;
    category: string;
    address?: string;
    phone?: string;
    description?: string;
    imageUrl?: string;
    mapUrl?: string;
    sortOrder: number;
    dbPlace?: RealEstateListing;
  };
  onEdit: (place: SortableRealEstateCardProps["place"]) => void;
  onDelete: (id: number) => void;
  editingPlace: RealEstateListing | null;
  setEditingPlace: (place: RealEstateListing | null) => void;
  updateMutation: any;
  categories?: RealEstateCategory[];
}

function SortableRealEstateCard({ place, onEdit, onDelete, editingPlace, setEditingPlace, updateMutation, categories = [] }: SortableRealEstateCardProps) {
  const {
    attributes,
    listeners,
    setNodeRef,
    transform,
    transition,
    isDragging,
  } = useSortable({ id: place.id });
  
  const style = {
    transform: CSS.Transform.toString(transform),
    transition,
    opacity: isDragging ? 0.5 : 1,
  };
  
  const categoryLabel = categories.find(c => c.id === place.category)?.labelKo || place.category;
  
  return (
    <Card 
      ref={setNodeRef} 
      style={style}
      className={isDragging ? "z-50" : ""}
    >
      <CardContent className="p-3">
        <div className="flex items-center gap-3">
          <div
            {...attributes}
            {...listeners}
            className="touch-none cursor-grab active:cursor-grabbing p-2 rounded hover-elevate"
            data-testid={`realestate-drag-handle-${place.id}`}
          >
            <GripVertical className="h-5 w-5 text-muted-foreground" />
          </div>
          
          {place.imageUrl ? (
            <img
              src={place.imageUrl}
              alt={place.name}
              className="w-16 h-16 object-cover rounded-md flex-shrink-0"
            />
          ) : (
            <div className="w-16 h-16 bg-muted rounded-md flex items-center justify-center flex-shrink-0">
              <Image className="h-6 w-6 text-muted-foreground" />
            </div>
          )}
          
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1 flex-wrap">
              <h4 className="font-medium text-sm">{place.name}</h4>
              <span className="text-[10px] bg-primary/10 text-primary px-1.5 py-0.5 rounded">
                {categoryLabel}
              </span>
              {place.dbPlace && !place.dbPlace.isActive && (
                <span className="text-[10px] bg-muted px-1.5 py-0.5 rounded">비활성</span>
              )}
            </div>
            {place.description && (
              <p className="text-xs text-muted-foreground line-clamp-1">{place.description}</p>
            )}
            {place.address && (
              <p className="text-xs text-muted-foreground line-clamp-1 flex items-center gap-1">
                <MapPin className="h-3 w-3" />
                {place.address}
              </p>
            )}
          </div>
          
          <div className="flex gap-1 flex-shrink-0">
            {place.dbPlace && (
              <>
                <Dialog open={editingPlace?.id === place.dbPlace.id} onOpenChange={(open) => !open && setEditingPlace(null)}>
                  <DialogTrigger asChild>
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => onEdit(place)}
                      data-testid={`realestate-button-edit-${place.id}`}
                    >
                      <Pencil className="h-3 w-3 mr-1" />
                      수정
                    </Button>
                  </DialogTrigger>
                  <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
                    <DialogHeader>
                      <DialogTitle>매물 수정</DialogTitle>
                    </DialogHeader>
                    <RealEstateForm
                      place={editingPlace}
                      categories={categories}
                      onSubmit={(data) => updateMutation.mutate({ id: place.dbPlace!.id, data })}
                      isLoading={updateMutation.isPending}
                      onCancel={() => setEditingPlace(null)}
                    />
                  </DialogContent>
                </Dialog>
                <AlertDialog>
                  <AlertDialogTrigger asChild>
                    <Button
                      variant="destructive"
                      size="icon"
                      className="h-8 w-8"
                      data-testid={`realestate-button-delete-${place.id}`}
                    >
                      <Trash2 className="h-3 w-3" />
                    </Button>
                  </AlertDialogTrigger>
                  <AlertDialogContent>
                    <AlertDialogHeader>
                      <AlertDialogTitle>매물 삭제</AlertDialogTitle>
                      <AlertDialogDescription>
                        "{place.name}"을(를) 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
                      </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                      <AlertDialogCancel>취소</AlertDialogCancel>
                      <AlertDialogAction
                        onClick={() => onDelete(place.dbPlace!.id)}
                        className="bg-destructive text-destructive-foreground hover-elevate"
                      >
                        삭제
                      </AlertDialogAction>
                    </AlertDialogFooter>
                  </AlertDialogContent>
                </AlertDialog>
              </>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  );
}

interface RealEstateFormProps {
  place?: RealEstateListing | null;
  defaultCategory?: string;
  onSubmit: (data: Partial<RealEstateListing>) => void;
  isLoading: boolean;
  onCancel: () => void;
  categories?: RealEstateCategory[];
}


function RealEstateForm({ place, defaultCategory, onSubmit, isLoading, onCancel, categories = [] }: RealEstateFormProps) {
  const { toast } = useToast();
  
  const getInitialImages = () => {
    const existingImages = place?.images || [];
    const mainImg = place?.mainImage || "";
    
    if (mainImg && !existingImages.includes(mainImg)) {
      return [mainImg, ...existingImages];
    }
    return existingImages;
  };
  
  const [formData, setFormData] = useState({
    name: place?.name || "",
    category: place?.category || defaultCategory || "apartment",
    description: place?.description || "",
    mainImage: place?.mainImage || "",
    images: getInitialImages(),
    latitude: place?.latitude || "",
    longitude: place?.longitude || "",
    address: place?.address || "",
    phone: place?.phone || "",
    website: place?.website || "",
    websiteLabel: place?.websiteLabel || "",
    openingHours: place?.openingHours || "",
    priceRange: place?.priceRange || "",
    tags: place?.tags || [],
    isPartner: place?.isPartner ?? false,
    discountText: place?.discountText || "",
    menuImages: place?.menuImages || [],
    isActive: place?.isActive ?? true,
    sortOrder: place?.sortOrder || 0,
  });

  const [newTag, setNewTag] = useState("");
  const [blogUrl, setBlogUrl] = useState("");
  const [isExtractingImages, setIsExtractingImages] = useState(false);
  const [extractedImages, setExtractedImages] = useState<string[]>([]);
  const [selectedExtracted, setSelectedExtracted] = useState<string[]>([]);
  const [isDownloading, setIsDownloading] = useState(false);
  
  const [googleSearchQuery, setGoogleSearchQuery] = useState("");
  const [isSearchingGoogle, setIsSearchingGoogle] = useState(false);
  const [isFetchingDetails, setIsFetchingDetails] = useState(false);
  
  const [showLocationMap, setShowLocationMap] = useState(false);
  const locationMapRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<L.Map | null>(null);
  const markerRef = useRef<L.Marker | null>(null);
  
  useEffect(() => {
    if (!showLocationMap || !locationMapRef.current) return;
    
    if (mapInstanceRef.current) {
      mapInstanceRef.current.invalidateSize();
      return;
    }
    
    const lat = formData.latitude ? parseFloat(formData.latitude) : 10.3456;
    const lng = formData.longitude ? parseFloat(formData.longitude) : 107.0844;
    
    const map = L.map(locationMapRef.current).setView([lat, lng], 14);
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; OpenStreetMap',
    }).addTo(map);
    
    mapInstanceRef.current = map;
    
    if (formData.latitude && formData.longitude) {
      markerRef.current = L.marker([lat, lng]).addTo(map);
    }
    
    map.on('click', (e: L.LeafletMouseEvent) => {
      const { lat, lng } = e.latlng;
      
      if (markerRef.current) {
        markerRef.current.remove();
      }
      
      markerRef.current = L.marker([lat, lng]).addTo(map);
      
      setFormData(prev => ({
        ...prev,
        latitude: lat.toFixed(6),
        longitude: lng.toFixed(6),
      }));
    });
    
    return () => {
      if (mapInstanceRef.current) {
        mapInstanceRef.current.remove();
        mapInstanceRef.current = null;
      }
    };
  }, [showLocationMap]);

  const [isUploading, setIsUploading] = useState(false);

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0) return;
    
    setIsUploading(true);
    try {
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        
        const base64Data = await new Promise<string>((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => resolve(reader.result as string);
          reader.onerror = reject;
          reader.readAsDataURL(file);
        });
        
        const res = await fetch("/api/upload-image", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            base64Data,
            fileName: file.name,
            contentType: file.type,
          }),
        });
        
        if (!res.ok) {
          const error = await res.json();
          throw new Error(error.error || "업로드 실패");
        }
        
        const data = await res.json();
        setFormData(prev => ({
          ...prev,
          images: [...prev.images, data.url],
        }));
      }
    } catch (error: any) {
      alert("이미지 업로드 실패: " + error.message);
    } finally {
      setIsUploading(false);
      e.target.value = "";
    }
  };

  const extractImagesFromBlog = async () => {
    if (!blogUrl.trim()) return;
    
    setIsExtractingImages(true);
    try {
      const res = await fetch("/api/extract-blog-images", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ url: blogUrl.trim() }),
      });
      
      if (!res.ok) {
        const error = await res.json();
        alert(error.error || "이미지 추출 실패");
        return;
      }
      
      const data = await res.json();
      if (data.images && data.images.length > 0) {
        setExtractedImages(data.images);
        alert(`${data.images.length}개의 이미지를 추출했습니다. 클릭해서 선택하세요.`);
      } else {
        alert("이미지를 찾을 수 없습니다.");
      }
    } catch (error) {
      alert("이미지 추출 중 오류가 발생했습니다.");
    } finally {
      setIsExtractingImages(false);
    }
  };

  const toggleExtractedImage = (imgUrl: string) => {
    if (selectedExtracted.includes(imgUrl)) {
      setSelectedExtracted(selectedExtracted.filter(i => i !== imgUrl));
    } else {
      setSelectedExtracted([...selectedExtracted, imgUrl]);
    }
  };

  const parseGoogleMapsUrl = async () => {
    const url = googleSearchQuery.trim();
    if (!url) return;
    
    setIsSearchingGoogle(true);
    setIsFetchingDetails(true);
    
    try {
      const res = await fetch("/api/parse-google-maps-url", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ url }),
      });
      
      if (!res.ok) {
        const err = await res.json();
        alert(err.error || "URL 파싱 실패");
        return;
      }
      
      const data = await res.json();
      
      setFormData(prev => ({
        ...prev,
        name: data.name || prev.name,
        address: data.address || prev.address,
        latitude: data.latitude?.toString() || prev.latitude,
        longitude: data.longitude?.toString() || prev.longitude,
        website: url,
      }));
      
      setGoogleSearchQuery("");
      alert("정보를 가져왔습니다! 필요하면 수정해주세요.");
    } catch (error) {
      alert("URL 파싱 중 오류가 발생했습니다");
    } finally {
      setIsSearchingGoogle(false);
      setIsFetchingDetails(false);
    }
  };

  const downloadAndSaveImages = async () => {
    if (selectedExtracted.length === 0) {
      alert("다운로드할 이미지를 선택해주세요");
      return;
    }
    
    setIsDownloading(true);
    try {
      const res = await fetch("/api/download-blog-images", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ imageUrls: selectedExtracted }),
      });
      
      if (!res.ok) {
        const error = await res.json();
        alert(error.error || "다운로드 실패");
        return;
      }
      
      const data = await res.json();
      if (data.uploadedUrls && data.uploadedUrls.length > 0) {
        setFormData(prev => ({
          ...prev,
          images: [...prev.images, ...data.uploadedUrls],
        }));
        setSelectedExtracted([]);
        setExtractedImages([]);
        alert(`${data.success}개 이미지 저장 완료!`);
      } else {
        alert("이미지 다운로드에 실패했습니다.");
      }
    } catch (error) {
      alert("이미지 다운로드 중 오류가 발생했습니다.");
    } finally {
      setIsDownloading(false);
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!formData.name.trim()) {
      toast({ title: "매물명을 입력해주세요", variant: "destructive" });
      return;
    }
    
    const uniqueImages = Array.from(new Set(formData.images.filter((img: string) => img)));
    
    const mainImage = formData.mainImage || (uniqueImages.length > 0 ? uniqueImages[0] : "");
    
    const finalImages = mainImage && !uniqueImages.includes(mainImage) 
      ? [mainImage, ...uniqueImages] 
      : uniqueImages;
    
    const dataToSubmit = {
      ...formData,
      images: finalImages,
      mainImage,
    };
    onSubmit(dataToSubmit);
  };

  const addTag = () => {
    if (newTag.trim() && !formData.tags.includes(newTag.trim())) {
      setFormData({
        ...formData,
        tags: [...formData.tags, newTag.trim()],
      });
      setNewTag("");
    }
  };

  const removeTag = (tag: string) => {
    setFormData({
      ...formData,
      tags: formData.tags.filter((t: string) => t !== tag),
    });
  };

  const removeImage = (index: number) => {
    setFormData({
      ...formData,
      images: formData.images.filter((_: string, i: number) => i !== index),
    });
  };

  const handleMenuUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0) return;
    
    setIsUploading(true);
    try {
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        
        const base64Data = await new Promise<string>((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => resolve(reader.result as string);
          reader.onerror = reject;
          reader.readAsDataURL(file);
        });
        
        const res = await fetch("/api/upload-image", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            base64Data,
            fileName: file.name,
            contentType: file.type,
          }),
        });
        
        if (!res.ok) {
          const error = await res.json();
          throw new Error(error.error || "업로드 실패");
        }
        
        const { url } = await res.json();
        setFormData((prev: any) => ({
          ...prev,
          menuImages: [...(prev.menuImages || []), url],
        }));
      }
      toast({ title: "이미지 업로드 완료" });
    } catch (error: any) {
      toast({ title: error.message || "업로드 실패", variant: "destructive" });
    } finally {
      setIsUploading(false);
    }
  };

  const removeMenuImage = (index: number) => {
    setFormData({
      ...formData,
      menuImages: formData.menuImages.filter((_: string, i: number) => i !== index),
    });
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div className="bg-blue-50 dark:bg-blue-900/20 p-4 rounded-lg space-y-3">
        <Label className="text-blue-700 dark:text-blue-300 font-medium">
          구글 맵 URL로 정보 가져오기
        </Label>
        <p className="text-xs text-muted-foreground">
          구글 맵에서 장소를 찾고 "공유" - "링크 복사"한 URL을 붙여넣으세요
        </p>
        <div className="flex gap-2">
          <Input
            value={googleSearchQuery}
            onChange={(e) => setGoogleSearchQuery(e.target.value)}
            placeholder="https://maps.app.goo.gl/... 또는 https://www.google.com/maps/..."
            data-testid="realestate-input-google-url"
          />
          <Button
            type="button"
            onClick={parseGoogleMapsUrl}
            disabled={isSearchingGoogle || !googleSearchQuery.trim()}
            data-testid="realestate-button-parse-url"
          >
            {isSearchingGoogle ? <Loader2 className="h-4 w-4 animate-spin" /> : "가져오기"}
          </Button>
        </div>
        
        {isFetchingDetails && (
          <div className="flex items-center gap-2 text-sm text-blue-600">
            <Loader2 className="h-4 w-4 animate-spin" />
            정보를 가져오는 중...
          </div>
        )}
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="name">매물명 *</Label>
          <Input
            id="name"
            value={formData.name}
            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
            placeholder="매물 이름을 입력하세요"
            data-testid="realestate-input-place-name"
          />
        </div>

        <div>
          <Label htmlFor="category">카테고리 *</Label>
          <Select 
            value={formData.category} 
            onValueChange={(v) => setFormData({ ...formData, category: v })}
          >
            <SelectTrigger data-testid="realestate-select-place-category">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              {[...categories]
                .sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999))
                .map(cat => (
                <SelectItem key={cat.id} value={cat.id}>
                  {cat.labelKo || cat.id}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </div>

      <div>
        <Label htmlFor="description">설명</Label>
        <Textarea
          id="description"
          value={formData.description}
          onChange={(e) => setFormData({ ...formData, description: e.target.value })}
          placeholder="매물에 대한 상세 설명을 입력하세요..."
          rows={3}
          data-testid="realestate-textarea-place-description"
        />
      </div>

      <div>
        <Label>블로그에서 이미지 가져오기</Label>
        <div className="flex gap-2 mt-1">
          <Input
            value={blogUrl}
            onChange={(e) => setBlogUrl(e.target.value)}
            placeholder="네이버 블로그 URL 입력"
            data-testid="realestate-input-blog-url"
          />
          <Button 
            type="button" 
            onClick={extractImagesFromBlog} 
            variant="default"
            disabled={isExtractingImages || !blogUrl.trim()}
          >
            {isExtractingImages ? <Loader2 className="h-4 w-4 animate-spin" /> : "이미지 추출"}
          </Button>
        </div>
        
        {extractedImages.length > 0 && (
          <div className="mt-3 p-3 bg-muted/50 rounded-lg border">
            <div className="flex items-center justify-between mb-2 flex-wrap gap-2">
              <Label className="text-sm">추출된 이미지 (클릭해서 선택)</Label>
              <div className="flex gap-2">
                <Button type="button" size="sm" variant="outline" onClick={() => setSelectedExtracted([...extractedImages])}>
                  전체 선택
                </Button>
                <Button type="button" size="sm" variant="outline" onClick={() => setSelectedExtracted([])}>
                  전체 해제
                </Button>
              </div>
            </div>
            <div className="grid grid-cols-4 gap-2 max-h-40 overflow-y-auto">
              {extractedImages.map((img, idx) => {
                const isSelected = selectedExtracted.includes(img);
                const proxyUrl = `/api/naver-image-proxy?url=${encodeURIComponent(img)}`;
                return (
                  <div
                    key={idx}
                    className={`relative cursor-pointer rounded border-2 overflow-hidden ${isSelected ? "border-primary" : "border-transparent"}`}
                    onClick={() => toggleExtractedImage(img)}
                  >
                    <img src={proxyUrl} alt="" className="w-full h-16 object-cover" />
                    {isSelected && (
                      <div className="absolute inset-0 bg-primary/30 flex items-center justify-center">
                        <div className="w-4 h-4 bg-primary rounded-full" />
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
            {selectedExtracted.length > 0 && (
              <Button 
                type="button" 
                onClick={downloadAndSaveImages} 
                className="mt-2 w-full"
                disabled={isDownloading}
              >
                {isDownloading ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
                {isDownloading ? "저장 중..." : `선택한 ${selectedExtracted.length}개 이미지 저장`}
              </Button>
            )}
          </div>
        )}
      </div>

      <div>
        <Label>직접 이미지 업로드</Label>
        <div className="mt-1">
          <label className="flex items-center justify-center gap-2 p-4 border-2 border-dashed rounded-lg cursor-pointer hover:bg-muted/50 transition-colors">
            <Upload className="h-5 w-5 text-muted-foreground" />
            <span className="text-sm text-muted-foreground">클릭해서 이미지 업로드</span>
            <input
              type="file"
              accept="image/*"
              multiple
              onChange={handleFileUpload}
              className="hidden"
              data-testid="realestate-input-image-upload"
            />
          </label>
        </div>
      </div>

      {(() => {
        const uniqueImages = Array.from(new Set(formData.images as string[]));
        
        if (formData.mainImage && !uniqueImages.includes(formData.mainImage)) {
          uniqueImages.unshift(formData.mainImage);
        }
        
        if (uniqueImages.length === 0) return null;
        
        return (
          <div>
            <Label>등록된 이미지 ({uniqueImages.length}개) - 클릭하여 대표 사진 선택</Label>
            <div className="grid grid-cols-4 gap-2 mt-2">
              {uniqueImages.map((img: string, idx: number) => {
                const isMainImage = formData.mainImage === img;
                return (
                  <div 
                    key={img} 
                    className={`relative group cursor-pointer ${isMainImage ? 'ring-2 ring-primary ring-offset-2' : 'hover:ring-2 hover:ring-muted-foreground hover:ring-offset-1'}`}
                    onClick={() => {
                      if (!isMainImage) {
                        setFormData({ ...formData, mainImage: img });
                        toast({ title: "대표 사진이 변경되었습니다" });
                      }
                    }}
                  >
                    <img src={img} alt="" className="w-full h-20 object-cover rounded" />
                    {isMainImage && (
                      <span className="absolute top-1 left-1 text-xs bg-primary text-primary-foreground px-1 rounded">대표</span>
                    )}
                    <button
                      type="button"
                      onClick={(e) => {
                        e.stopPropagation();
                        const remainingImages = formData.images.filter((i: string) => i !== img);
                        if (isMainImage) {
                          setFormData({ 
                            ...formData, 
                            images: remainingImages,
                            mainImage: remainingImages.length > 0 ? remainingImages[0] : ""
                          });
                        } else {
                          setFormData({ ...formData, images: remainingImages });
                        }
                      }}
                      className="absolute top-1 right-1 bg-destructive text-destructive-foreground p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity"
                    >
                      <Trash2 className="h-3 w-3" />
                    </button>
                  </div>
                );
              })}
            </div>
          </div>
        );
      })()}

      <div className="border-t pt-4">
        <Label className="flex items-center gap-2 text-amber-700 dark:text-amber-400">
          추가 이미지
        </Label>
        <p className="text-xs text-muted-foreground mt-1 mb-2">
          추가 사진을 업로드하면 사용자가 상세 보기에서 볼 수 있습니다
        </p>
        <div className="mt-1">
          <label className="flex items-center justify-center gap-2 p-3 border-2 border-dashed border-amber-300 rounded-lg cursor-pointer hover:bg-amber-50/50 dark:hover:bg-amber-900/20 transition-colors">
            <Upload className="h-5 w-5 text-amber-600" />
            <span className="text-sm text-amber-600">추가 이미지 업로드</span>
            <input
              type="file"
              accept="image/*"
              multiple
              onChange={handleMenuUpload}
              className="hidden"
              data-testid="realestate-input-menu-upload"
            />
          </label>
        </div>
      </div>

      {formData.menuImages && formData.menuImages.length > 0 && (
        <div>
          <Label>추가 이미지 ({formData.menuImages.length}개)</Label>
          <div className="grid grid-cols-3 gap-2 mt-2">
            {formData.menuImages.map((img: string, idx: number) => (
              <div key={idx} className="relative group">
                <img src={img} alt={`추가 ${idx + 1}`} className="w-full h-24 object-cover rounded border" />
                <button
                  type="button"
                  onClick={() => removeMenuImage(idx)}
                  className="absolute top-1 right-1 bg-destructive text-destructive-foreground p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity"
                >
                  <Trash2 className="h-3 w-3" />
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      <div className="space-y-3">
        <div className="flex items-center justify-between">
          <Label className="flex items-center gap-2">
            <MapPin className="h-4 w-4" />
            위치 설정
          </Label>
          <Button 
            type="button" 
            variant="outline" 
            size="sm"
            onClick={() => setShowLocationMap(!showLocationMap)}
          >
            {showLocationMap ? "지도 닫기" : "지도에서 위치 선택"}
          </Button>
        </div>
        
        {showLocationMap && (
          <div className="space-y-2">
            <div className="relative">
              <div 
                ref={locationMapRef}
                className="h-[300px] rounded-lg border border-slate-300 overflow-hidden"
                data-testid="realestate-location-map"
              />
              <Button
                type="button"
                variant="default"
                size="sm"
                className="absolute top-2 right-2 z-[1000] gap-1"
                data-testid="realestate-button-my-location"
                onClick={() => {
                  if (!navigator.geolocation) {
                    toast({ title: "이 브라우저에서 위치 서비스를 지원하지 않습니다", variant: "destructive" });
                    return;
                  }
                  navigator.geolocation.getCurrentPosition(
                    (pos) => {
                      const { latitude, longitude } = pos.coords;
                      if (mapInstanceRef.current) {
                        mapInstanceRef.current.setView([latitude, longitude], 16);
                        if (markerRef.current) markerRef.current.remove();
                        markerRef.current = L.marker([latitude, longitude]).addTo(mapInstanceRef.current);
                        setFormData(prev => ({
                          ...prev,
                          latitude: latitude.toFixed(6),
                          longitude: longitude.toFixed(6),
                        }));
                      }
                    },
                    (err) => {
                      toast({ title: "위치를 가져올 수 없습니다. 위치 권한을 확인해주세요.", variant: "destructive" });
                    },
                    { enableHighAccuracy: true, timeout: 10000 }
                  );
                }}
              >
                <LocateFixed className="w-3.5 h-3.5" />
                내 위치
              </Button>
            </div>
            <p className="text-xs text-muted-foreground text-center">
              지도를 클릭해서 위치를 선택하세요
            </p>
          </div>
        )}
        
        <div className="grid grid-cols-2 gap-4">
          <div>
            <Label htmlFor="latitude">위도</Label>
            <Input
              id="latitude"
              value={formData.latitude}
              onChange={(e) => setFormData({ ...formData, latitude: e.target.value })}
              placeholder="예: 10.3460"
              data-testid="realestate-input-latitude"
            />
          </div>
          <div>
            <Label htmlFor="longitude">경도</Label>
            <Input
              id="longitude"
              value={formData.longitude}
              onChange={(e) => setFormData({ ...formData, longitude: e.target.value })}
              placeholder="예: 107.0843"
              data-testid="realestate-input-longitude"
            />
          </div>
        </div>
        
        {formData.latitude && formData.longitude && (
          <p className="text-xs text-green-600 flex items-center gap-1">
            위치 설정됨: {formData.latitude}, {formData.longitude}
          </p>
        )}
      </div>

      <div>
        <Label htmlFor="address">주소</Label>
        <Input
          id="address"
          value={formData.address}
          onChange={(e) => setFormData({ ...formData, address: e.target.value })}
          placeholder="예: 861 Tr&#7847;n Ph&#250;, Ph&#432;&#7901;ng 5, V&#361;ng T&#224;u"
          data-testid="realestate-input-address"
        />
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="phone">전화번호</Label>
          <Input
            id="phone"
            value={formData.phone}
            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
            placeholder="예: +84 254 3856 789"
            data-testid="realestate-input-phone"
          />
        </div>
        <div>
          <Label htmlFor="website">웹사이트/SNS URL</Label>
          <Input
            id="website"
            value={formData.website}
            onChange={(e) => setFormData({ ...formData, website: e.target.value })}
            placeholder="예: https://instagram.com/..."
            data-testid="realestate-input-website"
          />
        </div>
        <div>
          <Label htmlFor="websiteLabel">링크 표시 텍스트</Label>
          <Input
            id="websiteLabel"
            value={formData.websiteLabel}
            onChange={(e) => setFormData({ ...formData, websiteLabel: e.target.value })}
            placeholder="예: 360° 투어, 홈페이지, 인스타그램"
            data-testid="realestate-input-website-label"
          />
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="openingHours">영업시간</Label>
          <Input
            id="openingHours"
            value={formData.openingHours}
            onChange={(e) => setFormData({ ...formData, openingHours: e.target.value })}
            placeholder="예: 07:00 - 17:00"
            data-testid="realestate-input-hours"
          />
        </div>
        <div>
          <Label htmlFor="priceRange">가격대</Label>
          <Select 
            value={formData.priceRange} 
            onValueChange={(v) => setFormData({ ...formData, priceRange: v })}
          >
            <SelectTrigger data-testid="realestate-select-price-range">
              <SelectValue placeholder="선택" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="$">$ (저렴)</SelectItem>
              <SelectItem value="$$">$$ (보통)</SelectItem>
              <SelectItem value="$$$">$$$ (고급)</SelectItem>
            </SelectContent>
          </Select>
        </div>
      </div>

      <div>
        <Label>태그</Label>
        <div className="flex gap-2 mt-1">
          <Input
            value={newTag}
            onChange={(e) => setNewTag(e.target.value)}
            placeholder="태그 입력 후 추가"
            onKeyDown={(e) => e.key === "Enter" && (e.preventDefault(), addTag())}
            data-testid="realestate-input-tag"
          />
          <Button type="button" onClick={addTag} variant="outline">
            추가
          </Button>
        </div>
        {formData.tags.length > 0 && (
          <div className="flex gap-1 mt-2 flex-wrap">
            {formData.tags.map((tag: string, idx: number) => (
              <span key={idx} className="text-sm bg-muted px-2 py-1 rounded flex items-center gap-1">
                #{tag}
                <button type="button" onClick={() => removeTag(tag)} className="text-muted-foreground hover:text-destructive">
                  x
                </button>
              </span>
            ))}
          </div>
        )}
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="sortOrder">정렬 순서</Label>
          <Input
            id="sortOrder"
            type="number"
            value={formData.sortOrder}
            onChange={(e) => setFormData({ ...formData, sortOrder: parseInt(e.target.value) || 0 })}
            data-testid="realestate-input-sort-order"
          />
        </div>
        <div className="flex items-center gap-2 pt-6">
          <Switch
            checked={formData.isActive}
            onCheckedChange={(checked) => setFormData({ ...formData, isActive: checked })}
            data-testid="realestate-switch-active"
          />
          <Label>활성화</Label>
        </div>
      </div>

      <div className="space-y-3 p-4 border rounded-lg bg-amber-50 dark:bg-amber-900/20">
        <div className="flex items-center gap-2">
          <Switch
            checked={formData.isPartner}
            onCheckedChange={(checked) => setFormData({ ...formData, isPartner: checked })}
            data-testid="realestate-switch-partner"
          />
          <Label className="font-medium text-amber-700 dark:text-amber-300">협력업체 뱃지 표시</Label>
        </div>
        {formData.isPartner && (
          <div>
            <Label htmlFor="discountText" className="text-sm text-amber-600 dark:text-amber-400">할인 안내 문구</Label>
            <Input
              id="discountText"
              value={formData.discountText}
              onChange={(e) => setFormData({ ...formData, discountText: e.target.value })}
              placeholder="할인 안내 문구를 입력하세요"
              className="mt-1"
              data-testid="realestate-input-discount-text"
            />
          </div>
        )}
      </div>

      <div className="flex gap-2 justify-end">
        <Button type="button" variant="outline" onClick={onCancel}>
          취소
        </Button>
        <Button type="submit" disabled={isLoading || isUploading} data-testid="realestate-button-submit-place">
          {isLoading ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
          {place ? "수정" : "추가"}
        </Button>
      </div>
    </form>
  );
}

interface RealEstateCategoryManagementProps {
  categories: RealEstateCategory[];
  isLoading: boolean;
  queryClient: any;
  toast: any;
}

function RealEstateCategoryManagement({ categories, isLoading, queryClient, toast }: RealEstateCategoryManagementProps) {
  const [isAddOpen, setIsAddOpen] = useState(false);
  const [editingCategory, setEditingCategory] = useState<RealEstateCategory | null>(null);
  const [isMutating, setIsMutating] = useState(false);
  
  const sortedCategories = useMemo(() => 
    [...categories].sort((a, b) => (a.sortOrder ?? 999) - (b.sortOrder ?? 999)),
    [categories]
  );
  
  const moveCategory = async (categoryId: string, direction: "up" | "down") => {
    if (isMutating) return;
    const currentIndex = sortedCategories.findIndex(c => c.id === categoryId);
    if (currentIndex === -1) return;
    
    const newIndex = direction === "up" ? currentIndex - 1 : currentIndex + 1;
    if (newIndex < 0 || newIndex >= sortedCategories.length) return;
    
    const newOrder = [...sortedCategories];
    [newOrder[currentIndex], newOrder[newIndex]] = [newOrder[newIndex], newOrder[currentIndex]];
    
    setIsMutating(true);
    try {
      const res = await fetch("/api/admin/real-estate-categories/reorder", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ categoryIds: newOrder.map(c => c.id) }),
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-categories"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-categories"] });
    } catch (error) {
      toast({ title: "순서 변경 실패", variant: "destructive" });
    } finally {
      setIsMutating(false);
    }
  };
  
  const deleteCategory = async (categoryId: string) => {
    if (isMutating) return;
    setIsMutating(true);
    try {
      const res = await fetch(`/api/admin/real-estate-categories/${categoryId}`, {
        method: "DELETE",
        credentials: "include",
      });
      if (!res.ok) {
        const err = await res.json();
        toast({ title: err.error || "삭제 실패", variant: "destructive" });
        return;
      }
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-categories"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-categories"] });
      toast({ title: "카테고리가 삭제되었습니다" });
    } catch (error) {
      toast({ title: "삭제 실패", variant: "destructive" });
    } finally {
      setIsMutating(false);
    }
  };
  
  const toggleActive = async (category: RealEstateCategory) => {
    if (isMutating) return;
    setIsMutating(true);
    try {
      const res = await fetch(`/api/admin/real-estate-categories/${category.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ isActive: !category.isActive }),
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-categories"] });
      queryClient.invalidateQueries({ queryKey: ["/api/real-estate-categories"] });
    } catch (error) {
      toast({ title: "수정 실패", variant: "destructive" });
    } finally {
      setIsMutating(false);
    }
  };

  if (isLoading) {
    return (
      <div className="flex justify-center py-12">
        <div className="animate-spin h-8 w-8 border-4 border-primary border-t-transparent rounded-full" />
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="flex justify-between items-center">
        <p className="text-sm text-muted-foreground">
          카테고리 순서와 표시 여부를 관리할 수 있습니다
        </p>
        <div className="flex gap-2">
          <Dialog open={isAddOpen} onOpenChange={setIsAddOpen}>
            <DialogTrigger asChild>
              <Button data-testid="realestate-button-add-category">
                <Plus className="h-4 w-4 mr-2" />
                새 카테고리
              </Button>
            </DialogTrigger>
            <DialogContent className="max-w-lg">
              <DialogHeader>
                <DialogTitle>새 카테고리 추가</DialogTitle>
              </DialogHeader>
              <RealEstateCategoryForm
                isSubmitting={isMutating}
                onSubmit={async (data) => {
                  if (isMutating) return;
                  setIsMutating(true);
                  try {
                    const res = await fetch("/api/admin/real-estate-categories", {
                      method: "POST",
                      headers: { "Content-Type": "application/json" },
                      credentials: "include",
                      body: JSON.stringify(data),
                    });
                    if (!res.ok) {
                      const err = await res.json();
                      toast({ title: err.error || "추가 실패", variant: "destructive" });
                      return;
                    }
                    queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-categories"] });
                    queryClient.invalidateQueries({ queryKey: ["/api/real-estate-categories"] });
                    setIsAddOpen(false);
                    toast({ title: "카테고리가 추가되었습니다" });
                  } catch (error) {
                    toast({ title: "추가 실패", variant: "destructive" });
                  } finally {
                    setIsMutating(false);
                  }
                }}
                onCancel={() => setIsAddOpen(false)}
              />
            </DialogContent>
          </Dialog>
        </div>
      </div>
      
      {sortedCategories.length === 0 ? (
        <Card className="p-12 text-center">
          <Folder className="h-12 w-12 mx-auto text-muted-foreground mb-4" />
          <p className="text-muted-foreground mb-4">카테고리가 없습니다</p>
          <p className="text-sm text-muted-foreground">새 카테고리를 추가해주세요</p>
        </Card>
      ) : (
        <div className="grid gap-2">
          {sortedCategories.map((category, index) => (
            <Card 
              key={category.id} 
              className={`p-3 ${!category.isActive ? "opacity-50" : ""}`}
            >
              <div className="flex items-center gap-3">
                <div className="flex flex-col gap-1">
                  <Button
                    variant="ghost"
                    size="icon"
                    className="h-6 w-6"
                    disabled={index === 0 || isMutating}
                    onClick={() => moveCategory(category.id, "up")}
                    data-testid={`realestate-button-move-up-${category.id}`}
                  >
                    <ChevronUp className="h-4 w-4" />
                  </Button>
                  <Button
                    variant="ghost"
                    size="icon"
                    className="h-6 w-6"
                    disabled={index === sortedCategories.length - 1 || isMutating}
                    onClick={() => moveCategory(category.id, "down")}
                    data-testid={`realestate-button-move-down-${category.id}`}
                  >
                    <ChevronDown className="h-4 w-4" />
                  </Button>
                </div>
                
                <div 
                  className="w-4 h-4 rounded-full flex-shrink-0"
                  style={{ backgroundColor: category.color || "#64748b" }}
                />
                
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <span className="font-medium">{category.labelKo}</span>
                    <span className="text-xs text-muted-foreground">({category.id})</span>
                    {!category.isActive && (
                      <span className="text-xs bg-gray-100 text-gray-600 px-1 rounded">비활성</span>
                    )}
                  </div>
                  <div className="text-xs text-muted-foreground">
                    {category.labelEn}
                  </div>
                </div>
                
                <div className="flex items-center gap-1">
                  <Switch
                    checked={category.isActive ?? true}
                    onCheckedChange={() => toggleActive(category)}
                    disabled={isMutating}
                    data-testid={`realestate-switch-active-${category.id}`}
                  />
                  
                  <Dialog 
                    open={editingCategory?.id === category.id} 
                    onOpenChange={(open) => !open && setEditingCategory(null)}
                  >
                    <DialogTrigger asChild>
                      <Button 
                        variant="ghost" 
                        size="icon"
                        onClick={() => setEditingCategory(category)}
                        data-testid={`realestate-button-edit-${category.id}`}
                      >
                        <Pencil className="h-4 w-4" />
                      </Button>
                    </DialogTrigger>
                    <DialogContent className="max-w-lg">
                      <DialogHeader>
                        <DialogTitle>카테고리 수정</DialogTitle>
                      </DialogHeader>
                      <RealEstateCategoryForm
                        category={category}
                        isSubmitting={isMutating}
                        onSubmit={async (data) => {
                          if (isMutating) return;
                          setIsMutating(true);
                          try {
                            const res = await fetch(`/api/admin/real-estate-categories/${category.id}`, {
                              method: "PATCH",
                              headers: { "Content-Type": "application/json" },
                              credentials: "include",
                              body: JSON.stringify(data),
                            });
                            if (!res.ok) throw new Error("Failed");
                            queryClient.invalidateQueries({ queryKey: ["/api/admin/real-estate-categories"] });
                            queryClient.invalidateQueries({ queryKey: ["/api/real-estate-categories"] });
                            setEditingCategory(null);
                            toast({ title: "카테고리가 수정되었습니다" });
                          } catch (error) {
                            toast({ title: "수정 실패", variant: "destructive" });
                          } finally {
                            setIsMutating(false);
                          }
                        }}
                        onCancel={() => setEditingCategory(null)}
                      />
                    </DialogContent>
                  </Dialog>
                  
                  <AlertDialog>
                    <AlertDialogTrigger asChild>
                      <Button 
                        variant="ghost" 
                        size="icon"
                        data-testid={`realestate-button-delete-${category.id}`}
                      >
                        <Trash2 className="h-4 w-4 text-destructive" />
                      </Button>
                    </AlertDialogTrigger>
                    <AlertDialogContent>
                      <AlertDialogHeader>
                        <AlertDialogTitle>카테고리 삭제</AlertDialogTitle>
                        <AlertDialogDescription>
                          "{category.labelKo}" 카테고리를 삭제하시겠습니까?
                          이 카테고리에 속한 매물이 있으면 삭제할 수 없습니다.
                        </AlertDialogDescription>
                      </AlertDialogHeader>
                      <AlertDialogFooter>
                        <AlertDialogCancel>취소</AlertDialogCancel>
                        <AlertDialogAction onClick={() => deleteCategory(category.id)} disabled={isMutating}>
                          {isMutating ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
                          삭제
                        </AlertDialogAction>
                      </AlertDialogFooter>
                    </AlertDialogContent>
                  </AlertDialog>
                </div>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
}

interface RealEstateCategoryFormProps {
  category?: RealEstateCategory | null;
  onSubmit: (data: Partial<RealEstateCategory>) => void;
  onCancel: () => void;
  isSubmitting?: boolean;
}

function RealEstateCategoryForm({ category, onSubmit, onCancel, isSubmitting = false }: RealEstateCategoryFormProps) {
  const { toast } = useToast();
  const [isTranslating, setIsTranslating] = useState(false);
  const [formData, setFormData] = useState({
    id: category?.id || "",
    labelKo: category?.labelKo || "",
    labelEn: category?.labelEn || "",
    labelZh: category?.labelZh || "",
    labelVi: category?.labelVi || "",
    labelRu: category?.labelRu || "",
    labelJa: category?.labelJa || "",
    color: category?.color || "#64748b",
    gradient: category?.gradient || "from-gray-600 to-gray-700",
    icon: category?.icon || "Building",
  });

  const generateIdFromKorean = (korean: string): string => {
    const romanMap: Record<string, string> = {
      "아파트": "apartment", "빌라": "villa", "원룸": "studio", "오피스텔": "officetel",
      "상가": "commercial", "토지": "land", "사무실": "office", "공장": "factory",
      "창고": "warehouse", "주택": "house", "타운하우스": "townhouse", "펜트하우스": "penthouse",
      "콘도": "condo", "리조트": "resort", "호텔": "hotel", "모텔": "motel",
      "숙소": "lodging", "임대": "rental", "매매": "sale", "전세": "lease",
      "월세": "monthly", "부동산": "realestate",
    };
    
    let id = korean.toLowerCase();
    for (const [ko, en] of Object.entries(romanMap)) {
      id = id.replace(new RegExp(ko, "g"), en);
    }
    id = id.replace(/[^a-z0-9]/g, "_").replace(/_+/g, "_").replace(/^_|_$/g, "");
    return id || "category_" + Date.now();
  };

  const handleAutoTranslate = async () => {
    if (!formData.labelKo) {
      toast({ title: "한국어 이름을 먼저 입력해주세요", variant: "destructive" });
      return;
    }
    
    setIsTranslating(true);
    try {
      const res = await fetch("/api/translate-category", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ text: formData.labelKo }),
      });
      
      if (res.ok) {
        const translations = await res.json();
        const newId = !category && !formData.id ? generateIdFromKorean(formData.labelKo) : formData.id;
        setFormData(prev => ({
          ...prev,
          id: newId,
          labelEn: translations.en || prev.labelEn,
          labelZh: translations.zh || prev.labelZh,
          labelVi: translations.vi || prev.labelVi,
          labelRu: translations.ru || prev.labelRu,
          labelJa: translations.ja || prev.labelJa,
        }));
        toast({ title: "번역이 완료되었습니다" });
      } else {
        toast({ title: "번역 실패", variant: "destructive" });
      }
    } catch {
      toast({ title: "번역 오류", variant: "destructive" });
    } finally {
      setIsTranslating(false);
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formData.labelKo) {
      toast({ title: "한국어 이름을 입력해주세요", variant: "destructive" });
      return;
    }
    
    const finalData = {
      ...formData,
      id: formData.id || generateIdFromKorean(formData.labelKo),
      labelEn: formData.labelEn || formData.labelKo,
    };
    
    onSubmit(finalData);
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <Label htmlFor="cat-label-ko">카테고리명 (한국어) <span className="text-red-500">*</span></Label>
        <div className="flex gap-2">
          <Input
            id="cat-label-ko"
            value={formData.labelKo}
            onChange={(e) => setFormData({ ...formData, labelKo: e.target.value })}
            placeholder="예: 아파트"
            className="flex-1"
            data-testid="realestate-input-category-label-ko"
          />
          <Button 
            type="button" 
            variant="outline" 
            onClick={handleAutoTranslate}
            disabled={isTranslating || !formData.labelKo}
          >
            {isTranslating ? <Loader2 className="h-4 w-4 animate-spin" /> : "자동번역"}
          </Button>
        </div>
        <p className="text-xs text-muted-foreground mt-1">한국어 입력 후 '자동번역' 버튼을 누르면 다른 언어와 ID가 자동 생성됩니다</p>
      </div>
      
      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="cat-id">ID (자동생성)</Label>
          <Input
            id="cat-id"
            value={formData.id}
            onChange={(e) => setFormData({ ...formData, id: e.target.value.toLowerCase().replace(/\s/g, "_") })}
            placeholder="자동 생성됨"
            disabled={!!category}
            className="bg-muted"
            data-testid="realestate-input-category-id"
          />
        </div>
        <div>
          <Label htmlFor="cat-color">색상</Label>
          <div className="flex gap-2">
            <Input
              id="cat-color"
              type="color"
              value={formData.color}
              onChange={(e) => setFormData({ ...formData, color: e.target.value })}
              className="w-12 h-9 p-1"
            />
            <Input
              value={formData.color}
              onChange={(e) => setFormData({ ...formData, color: e.target.value })}
              placeholder="#64748b"
              className="flex-1"
              data-testid="realestate-input-category-color"
            />
          </div>
        </div>
      </div>
      
      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="cat-label-en">영어</Label>
          <Input
            id="cat-label-en"
            value={formData.labelEn}
            onChange={(e) => setFormData({ ...formData, labelEn: e.target.value })}
            placeholder="자동번역됨"
            data-testid="realestate-input-category-label-en"
          />
        </div>
        <div>
          <Label htmlFor="cat-label-zh">중국어</Label>
          <Input
            id="cat-label-zh"
            value={formData.labelZh || ""}
            onChange={(e) => setFormData({ ...formData, labelZh: e.target.value })}
            placeholder="公寓"
            data-testid="realestate-input-category-label-zh"
          />
        </div>
        <div>
          <Label htmlFor="cat-label-vi">베트남어</Label>
          <Input
            id="cat-label-vi"
            value={formData.labelVi || ""}
            onChange={(e) => setFormData({ ...formData, labelVi: e.target.value })}
            placeholder="C&#259;n h&#7897;"
            data-testid="realestate-input-category-label-vi"
          />
        </div>
      </div>
      
      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="cat-label-ru">러시아어</Label>
          <Input
            id="cat-label-ru"
            value={formData.labelRu || ""}
            onChange={(e) => setFormData({ ...formData, labelRu: e.target.value })}
            placeholder="Квартира"
            data-testid="realestate-input-category-label-ru"
          />
        </div>
        <div>
          <Label htmlFor="cat-label-ja">일본어</Label>
          <Input
            id="cat-label-ja"
            value={formData.labelJa || ""}
            onChange={(e) => setFormData({ ...formData, labelJa: e.target.value })}
            placeholder="アパート"
            data-testid="realestate-input-category-label-ja"
          />
        </div>
      </div>
      
      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="cat-icon">아이콘 (Lucide)</Label>
          <Input
            id="cat-icon"
            value={formData.icon || ""}
            onChange={(e) => setFormData({ ...formData, icon: e.target.value })}
            placeholder="Building, Home, Store..."
            data-testid="realestate-input-category-icon"
          />
        </div>
        <div>
          <Label htmlFor="cat-gradient">그라데이션 클래스</Label>
          <Input
            id="cat-gradient"
            value={formData.gradient || ""}
            onChange={(e) => setFormData({ ...formData, gradient: e.target.value })}
            placeholder="from-blue-500 to-blue-700"
            data-testid="realestate-input-category-gradient"
          />
        </div>
      </div>
      
      <div className="flex gap-2 justify-end">
        <Button type="button" variant="outline" onClick={onCancel} disabled={isSubmitting}>
          취소
        </Button>
        <Button 
          type="button" 
          disabled={isSubmitting} 
          data-testid="realestate-button-submit-category"
          onClick={(e) => {
            e.preventDefault();
            handleSubmit(e as any);
          }}
        >
          {isSubmitting ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
          {category ? "수정" : "추가"}
        </Button>
      </div>
    </form>
  );
}
