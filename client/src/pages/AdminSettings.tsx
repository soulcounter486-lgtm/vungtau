import { useState, useEffect } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/hooks/use-auth";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { useToast } from "@/hooks/use-toast";
import { Switch } from "@/components/ui/switch";
import { ArrowLeft, Save, Loader2, Globe, Type, Search, Users, DollarSign, Upload, X, Building2, GripVertical, ArrowUp, ArrowDown } from "lucide-react";
import { Link } from "wouter";

export default function AdminSettings() {
  const { isAdmin } = useAuth();
  const { toast } = useToast();
  const queryClient = useQueryClient();
  const [saving, setSaving] = useState(false);

  const { data: settings = {}, isLoading } = useQuery<Record<string, string>>({
    queryKey: ["/api/site-settings"],
    enabled: isAdmin,
  });

  const [heroTitle, setHeroTitle] = useState("");
  const [heroSubtitle, setHeroSubtitle] = useState("");
  const [heroDescription, setHeroDescription] = useState("");
  const [seoTitle, setSeoTitle] = useState("");
  const [seoDescription, setSeoDescription] = useState("");
  const [seoKeywords, setSeoKeywords] = useState("");
  const [ecoPrice12, setEcoPrice12] = useState("220");
  const [ecoPrice22, setEcoPrice22] = useState("380");
  const [ecoDescription, setEcoDescription] = useState("");
  const [golfParadiseWeekday, setGolfParadiseWeekday] = useState("90");
  const [golfParadiseWeekend, setGolfParadiseWeekend] = useState("110");
  const [golfParadiseTip, setGolfParadiseTip] = useState("40만동");
  const [golfChouducWeekday, setGolfChouducWeekday] = useState("80");
  const [golfChouducWeekend, setGolfChouducWeekend] = useState("120");
  const [golfChouducTip, setGolfChouducTip] = useState("50만동");
  const [golfHochamWeekday, setGolfHochamWeekday] = useState("150");
  const [golfHochamWeekend, setGolfHochamWeekend] = useState("200");
  const [golfHochamTip, setGolfHochamTip] = useState("50만동");
  const [ecoImageUrl, setEcoImageUrl] = useState("");
  const [ecoImageUploading, setEcoImageUploading] = useState(false);
  const [bizEnabled, setBizEnabled] = useState(true);
  const [bizName, setBizName] = useState("");
  const [bizNumber, setBizNumber] = useState("");
  const [bizOwner, setBizOwner] = useState("");
  const [bizAddress, setBizAddress] = useState("");
  const [bizPhone, setBizPhone] = useState("");
  const [bizEmail, setBizEmail] = useState("");
  const [fakeVisitorMin, setFakeVisitorMin] = useState("50");
  const [fakeVisitorMax, setFakeVisitorMax] = useState("300");
  const [fakeMemberMin, setFakeMemberMin] = useState("5");
  const [fakeMemberMax, setFakeMemberMax] = useState("20");
  const [fakeMemberBase, setFakeMemberBase] = useState("563");
  const defaultTabOrder = ["calculator", "planner", "guide", "board", "shop", "chat", "expenses", "realestate"];
  const tabLabels: Record<string, string> = { calculator: "견적", planner: "AI플래너", guide: "관광", board: "소식", shop: "쇼핑", chat: "채팅", expenses: "가계부", realestate: "매물" };
  const [tabOrder, setTabOrder] = useState<string[]>(defaultTabOrder);
  const defaultCatOrder = ["villa", "vehicle", "golf", "guide", "fasttrack", "eco"];
  const catLabels: Record<string, string> = { villa: "럭셔리 풀빌라 숙박", vehicle: "프라이빗 차량렌트 및 투어", golf: "골프 라운딩", guide: "한국어 투어 가이드", fasttrack: "패스트트랙", eco: "에코" };
  const [catOrder, setCatOrder] = useState<string[]>(defaultCatOrder);
  const { data: customQuoteCats } = useQuery<any[]>({ queryKey: ["/api/quote-categories"] });

  useEffect(() => {
    if (settings) {
      setHeroTitle(settings["hero_title"] || "");
      setHeroSubtitle(settings["hero_subtitle"] || "");
      setHeroDescription(settings["hero_description"] || "");
      setSeoTitle(settings["seo_title"] || "");
      setSeoDescription(settings["seo_description"] || "");
      setSeoKeywords(settings["seo_keywords"] || "");
      setEcoPrice12(settings["eco_price_12"] || "220");
      setEcoPrice22(settings["eco_price_22"] || "380");
      setEcoDescription(settings["eco_description"] || "");
      setGolfParadiseWeekday(settings["golf_paradise_weekday"] || "90");
      setGolfParadiseWeekend(settings["golf_paradise_weekend"] || "110");
      setGolfParadiseTip(settings["golf_paradise_tip"] || "40만동");
      setGolfChouducWeekday(settings["golf_chouduc_weekday"] || "80");
      setGolfChouducWeekend(settings["golf_chouduc_weekend"] || "120");
      setGolfChouducTip(settings["golf_chouduc_tip"] || "50만동");
      setGolfHochamWeekday(settings["golf_hocham_weekday"] || "150");
      setGolfHochamWeekend(settings["golf_hocham_weekend"] || "200");
      setGolfHochamTip(settings["golf_hocham_tip"] || "50만동");
      setEcoImageUrl(settings["eco_image_url"] || "");
      setBizEnabled(settings["biz_enabled"] !== "false");
      setBizName(settings["biz_name"] || "");
      setBizNumber(settings["biz_number"] || "");
      setBizOwner(settings["biz_owner"] || "");
      setBizAddress(settings["biz_address"] || "");
      setBizPhone(settings["biz_phone"] || "");
      setBizEmail(settings["biz_email"] || "");
      if (settings["fake_visitor_range"]) {
        try {
          const parsed = JSON.parse(settings["fake_visitor_range"]);
          setFakeVisitorMin(String(parsed.min || 50));
          setFakeVisitorMax(String(parsed.max || 300));
        } catch {}
      }
      if (settings["fake_member_range"]) {
        try {
          const parsed = JSON.parse(settings["fake_member_range"]);
          setFakeMemberMin(String(parsed.min || 5));
          setFakeMemberMax(String(parsed.max || 20));
          setFakeMemberBase(String(parsed.base || 563));
        } catch {}
      }
      if (settings["tab_order"]) {
        try {
          const parsed = JSON.parse(settings["tab_order"]);
          if (Array.isArray(parsed) && parsed.length > 0) {
            const missing = defaultTabOrder.filter(t => !parsed.includes(t));
            setTabOrder([...parsed.filter((t: string) => defaultTabOrder.includes(t)), ...missing]);
          }
        } catch {}
      }
      if (settings["category_order"]) {
        try {
          const parsed = JSON.parse(settings["category_order"]);
          if (Array.isArray(parsed) && parsed.length > 0) {
            setCatOrder(parsed);
          }
        } catch {}
      }
    }
  }, [settings]);

  useEffect(() => {
    if (customQuoteCats && customQuoteCats.length > 0) {
      setCatOrder(prev => {
        const allKeys = [...defaultCatOrder, ...customQuoteCats.filter((c: any) => c.isActive).map((c: any) => `custom-${c.id}`)];
        const missing = allKeys.filter(k => !prev.includes(k));
        const valid = prev.filter(k => allKeys.includes(k));
        return [...valid, ...missing];
      });
    }
  }, [customQuoteCats]);

  const saveSetting = async (key: string, value: string) => {
    const res = await fetch("/api/admin/site-settings", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      credentials: "include",
      body: JSON.stringify({ key, value }),
    });
    if (!res.ok) throw new Error("Failed to save");
  };

  const handleSaveAll = async () => {
    setSaving(true);
    try {
      const entries = [
        ["hero_title", heroTitle],
        ["hero_subtitle", heroSubtitle],
        ["hero_description", heroDescription],
        ["seo_title", seoTitle],
        ["seo_description", seoDescription],
        ["seo_keywords", seoKeywords],
        ["eco_price_12", ecoPrice12],
        ["eco_price_22", ecoPrice22],
        ["eco_description", ecoDescription],
        ["eco_image_url", ecoImageUrl],
        ["golf_paradise_weekday", golfParadiseWeekday],
        ["golf_paradise_weekend", golfParadiseWeekend],
        ["golf_paradise_tip", golfParadiseTip],
        ["golf_chouduc_weekday", golfChouducWeekday],
        ["golf_chouduc_weekend", golfChouducWeekend],
        ["golf_chouduc_tip", golfChouducTip],
        ["golf_hocham_weekday", golfHochamWeekday],
        ["golf_hocham_weekend", golfHochamWeekend],
        ["golf_hocham_tip", golfHochamTip],
        ["biz_enabled", bizEnabled ? "true" : "false"],
        ["biz_name", bizName],
        ["biz_number", bizNumber],
        ["biz_owner", bizOwner],
        ["biz_address", bizAddress],
        ["biz_phone", bizPhone],
        ["biz_email", bizEmail],
        ["tab_order", JSON.stringify(tabOrder)],
        ["category_order", JSON.stringify(catOrder)],
      ];
      for (const [key, value] of entries) {
        await saveSetting(key, String(value).trim());
      }
      queryClient.invalidateQueries({ queryKey: ["/api/site-settings"] });
      toast({ title: "설정이 저장되었습니다" });
    } catch {
      toast({ title: "저장 실패", variant: "destructive" });
    } finally {
      setSaving(false);
    }
  };

  const handleEcoImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setEcoImageUploading(true);
    try {
      const reader = new FileReader();
      reader.onload = async () => {
        try {
          const base64Data = reader.result as string;
          const res = await fetch("/api/upload-image", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            credentials: "include",
            body: JSON.stringify({ base64Data, fileName: file.name, contentType: file.type }),
          });
          if (!res.ok) throw new Error("Upload failed");
          const data = await res.json();
          setEcoImageUrl(data.url);
          toast({ title: "이미지 업로드 완료" });
        } catch {
          toast({ title: "이미지 업로드 실패", variant: "destructive" });
        } finally {
          setEcoImageUploading(false);
        }
      };
      reader.onerror = () => {
        toast({ title: "이미지 업로드 실패", variant: "destructive" });
        setEcoImageUploading(false);
      };
      reader.readAsDataURL(file);
    } catch {
      toast({ title: "이미지 업로드 실패", variant: "destructive" });
      setEcoImageUploading(false);
    }
  };

  if (!isAdmin) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <p className="text-muted-foreground">관리자 권한이 필요합니다</p>
      </div>
    );
  }

  if (isLoading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <Loader2 className="w-8 h-8 animate-spin text-muted-foreground" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <div className="sticky top-0 z-50 bg-background/95 backdrop-blur border-b">
        <div className="container mx-auto px-4 py-3 flex items-center gap-3">
          <Link href="/">
            <Button variant="ghost" size="icon" data-testid="button-back-home">
              <ArrowLeft className="w-5 h-5" />
            </Button>
          </Link>
          <h1 className="text-lg font-bold flex-1">사이트 설정</h1>
          <Button onClick={handleSaveAll} disabled={saving} data-testid="button-save-settings">
            {saving ? <Loader2 className="w-4 h-4 mr-2 animate-spin" /> : <Save className="w-4 h-4 mr-2" />}
            전체 저장
          </Button>
        </div>
      </div>

      <div className="container mx-auto px-4 py-6 space-y-6 max-w-2xl">
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="w-5 h-5" />
              에코 설정
            </CardTitle>
            <p className="text-sm text-muted-foreground">에코 서비스 이미지, 설명, 가격을 관리합니다</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label>에코 대표 이미지</Label>
              {ecoImageUrl ? (
                <div className="relative w-full aspect-video rounded-md overflow-hidden border">
                  <img src={ecoImageUrl} alt="에코" className="w-full h-full object-cover" data-testid="img-eco-preview" />
                  <Button variant="ghost" size="icon" className="absolute top-2 right-2 bg-black/50 text-white" onClick={() => setEcoImageUrl("")} data-testid="button-remove-eco-image">
                    <X className="w-4 h-4" />
                  </Button>
                </div>
              ) : (
                <label className="flex flex-col items-center justify-center w-full h-32 border-2 border-dashed rounded-md cursor-pointer hover:bg-muted/30 transition-colors" data-testid="label-eco-image-upload">
                  {ecoImageUploading ? (
                    <Loader2 className="w-6 h-6 animate-spin text-muted-foreground" />
                  ) : (
                    <>
                      <Upload className="w-6 h-6 text-muted-foreground mb-2" />
                      <span className="text-sm text-muted-foreground">이미지 업로드</span>
                    </>
                  )}
                  <input type="file" accept="image/*" className="hidden" onChange={handleEcoImageUpload} data-testid="input-eco-image-upload" />
                </label>
              )}
            </div>
            <div className="space-y-2">
              <Label htmlFor="ecoDescription">에코 설명</Label>
              <Textarea
                id="ecoDescription"
                value={ecoDescription}
                onChange={(e) => setEcoDescription(e.target.value)}
                placeholder="에코 서비스에 대한 설명을 입력하세요"
                rows={3}
                data-testid="input-eco-description"
              />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="ecoPrice12" className="flex items-center gap-1">
                  <DollarSign className="w-3.5 h-3.5" />
                  12시간 가격 (USD)
                </Label>
                <Input
                  id="ecoPrice12"
                  type="number"
                  min="0"
                  value={ecoPrice12}
                  onChange={(e) => setEcoPrice12(e.target.value)}
                  placeholder="220"
                  data-testid="input-eco-price-12"
                />
                <p className="text-xs text-muted-foreground">기본값: $220 (18~06시)</p>
              </div>
              <div className="space-y-2">
                <Label htmlFor="ecoPrice22" className="flex items-center gap-1">
                  <DollarSign className="w-3.5 h-3.5" />
                  22시간 가격 (USD)
                </Label>
                <Input
                  id="ecoPrice22"
                  type="number"
                  min="0"
                  value={ecoPrice22}
                  onChange={(e) => setEcoPrice22(e.target.value)}
                  placeholder="380"
                  data-testid="input-eco-price-22"
                />
                <p className="text-xs text-muted-foreground">기본값: $380 (12~10시)</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="w-5 h-5" />
              에코 프로필 관리
            </CardTitle>
            <p className="text-sm text-muted-foreground">사용자가 선택할 수 있는 에코 프로필 사진을 관리합니다</p>
          </CardHeader>
          <CardContent>
            <Link href="/admin/eco-profiles">
              <Button variant="outline" className="w-full" data-testid="link-eco-profiles-manage">
                <Users className="w-4 h-4 mr-2" />
                에코 프로필 관리 페이지로 이동
              </Button>
            </Link>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <DollarSign className="w-5 h-5" />
              골프 요금 관리
            </CardTitle>
            <p className="text-sm text-muted-foreground">골프장별 평일/주말 요금과 캐디팁을 설정합니다</p>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="space-y-3">
              <Label className="text-sm font-semibold">파라다이스 골프장</Label>
              <div className="grid grid-cols-3 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">평일 (USD)</Label>
                  <Input type="number" min="0" value={golfParadiseWeekday} onChange={(e) => setGolfParadiseWeekday(e.target.value)} placeholder="90" data-testid="input-golf-paradise-weekday" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">주말 (USD)</Label>
                  <Input type="number" min="0" value={golfParadiseWeekend} onChange={(e) => setGolfParadiseWeekend(e.target.value)} placeholder="110" data-testid="input-golf-paradise-weekend" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">캐디팁</Label>
                  <Input value={golfParadiseTip} onChange={(e) => setGolfParadiseTip(e.target.value)} placeholder="40만동" data-testid="input-golf-paradise-tip" />
                </div>
              </div>
            </div>
            <div className="space-y-3">
              <Label className="text-sm font-semibold">쩌우득 골프장</Label>
              <div className="grid grid-cols-3 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">평일 (USD)</Label>
                  <Input type="number" min="0" value={golfChouducWeekday} onChange={(e) => setGolfChouducWeekday(e.target.value)} placeholder="80" data-testid="input-golf-chouduc-weekday" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">주말 (USD)</Label>
                  <Input type="number" min="0" value={golfChouducWeekend} onChange={(e) => setGolfChouducWeekend(e.target.value)} placeholder="120" data-testid="input-golf-chouduc-weekend" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">캐디팁</Label>
                  <Input value={golfChouducTip} onChange={(e) => setGolfChouducTip(e.target.value)} placeholder="50만동" data-testid="input-golf-chouduc-tip" />
                </div>
              </div>
            </div>
            <div className="space-y-3">
              <Label className="text-sm font-semibold">호짬 골프장</Label>
              <div className="grid grid-cols-3 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">평일 (USD)</Label>
                  <Input type="number" min="0" value={golfHochamWeekday} onChange={(e) => setGolfHochamWeekday(e.target.value)} placeholder="150" data-testid="input-golf-hocham-weekday" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">주말 (USD)</Label>
                  <Input type="number" min="0" value={golfHochamWeekend} onChange={(e) => setGolfHochamWeekend(e.target.value)} placeholder="200" data-testid="input-golf-hocham-weekend" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">캐디팁</Label>
                  <Input value={golfHochamTip} onChange={(e) => setGolfHochamTip(e.target.value)} placeholder="50만동" data-testid="input-golf-hocham-tip" />
                </div>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Type className="w-5 h-5" />
              히어로 섹션 텍스트
            </CardTitle>
            <p className="text-sm text-muted-foreground">홈 화면 상단에 표시되는 제목과 설명을 수정합니다</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="heroTitle">사이트 제목</Label>
              <Input
                id="heroTitle"
                value={heroTitle}
                onChange={(e) => setHeroTitle(e.target.value)}
                placeholder="붕따우 도깨비"
                data-testid="input-hero-title"
              />
              <p className="text-xs text-muted-foreground">비워두면 기본값 "붕따우 도깨비"가 표시됩니다</p>
            </div>
            <div className="space-y-2">
              <Label htmlFor="heroSubtitle">부제목</Label>
              <Input
                id="heroSubtitle"
                value={heroSubtitle}
                onChange={(e) => setHeroSubtitle(e.target.value)}
                placeholder="실시간 여행견적"
                data-testid="input-hero-subtitle"
              />
              <p className="text-xs text-muted-foreground">비워두면 기본값 "실시간 여행견적"이 표시됩니다</p>
            </div>
            <div className="space-y-2">
              <Label htmlFor="heroDescription">설명</Label>
              <Textarea
                id="heroDescription"
                value={heroDescription}
                onChange={(e) => setHeroDescription(e.target.value)}
                placeholder="풀빌라, 차량, 가이드 서비스 등 나만의 맞춤 여행 견적을 실시간으로 확인하세요."
                rows={3}
                data-testid="input-hero-description"
              />
              <p className="text-xs text-muted-foreground">비워두면 기본값이 표시됩니다</p>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Search className="w-5 h-5" />
              SEO 설정 (검색 엔진 최적화)
            </CardTitle>
            <p className="text-sm text-muted-foreground">구글, 네이버 검색 결과에 표시되는 정보를 설정합니다</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="seoTitle">검색 제목 (title)</Label>
              <Input
                id="seoTitle"
                value={seoTitle}
                onChange={(e) => setSeoTitle(e.target.value)}
                placeholder="베트남 붕따우 도깨비"
                data-testid="input-seo-title"
              />
              <p className="text-xs text-muted-foreground">구글/네이버 검색 결과에 표시되는 제목</p>
            </div>
            <div className="space-y-2">
              <Label htmlFor="seoDescription">검색 설명 (description)</Label>
              <Textarea
                id="seoDescription"
                value={seoDescription}
                onChange={(e) => setSeoDescription(e.target.value)}
                placeholder="베트남 붕따우 여행의 모든것, 실시간 견적서 확인, 관광명소 및 맛집 소개"
                rows={3}
                data-testid="input-seo-description"
              />
              <p className="text-xs text-muted-foreground">검색 결과에서 제목 아래에 표시되는 설명 (160자 이내 권장)</p>
            </div>
            <div className="space-y-2">
              <Label htmlFor="seoKeywords">검색 키워드 (keywords)</Label>
              <Textarea
                id="seoKeywords"
                value={seoKeywords}
                onChange={(e) => setSeoKeywords(e.target.value)}
                placeholder="붕따우, 베트남, 여행, 붕따우 여행, 붕따우 관광, 붕따우 맛집, 베트남 골프, 붕따우 풀빌라"
                rows={3}
                data-testid="input-seo-keywords"
              />
              <p className="text-xs text-muted-foreground">쉼표(,)로 구분하여 입력. 구글/네이버에서 검색될 단어들</p>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Building2 className="w-5 h-5" />
              사업자 등록정보
            </CardTitle>
            <p className="text-sm text-muted-foreground">홈 화면 하단에 표시되는 사업자 등록정보를 수정합니다</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex items-center justify-between">
              <Label htmlFor="bizEnabled">사업자 정보 표시</Label>
              <Switch id="bizEnabled" checked={bizEnabled} onCheckedChange={setBizEnabled} data-testid="switch-biz-enabled" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="bizName">상호명</Label>
              <Input id="bizName" value={bizName} onChange={(e) => setBizName(e.target.value)} placeholder="붕따우 도깨비" data-testid="input-biz-name" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="bizNumber">사업자등록번호</Label>
              <Input id="bizNumber" value={bizNumber} onChange={(e) => setBizNumber(e.target.value)} placeholder="350-70-00679" data-testid="input-biz-number" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="bizOwner">대표자명</Label>
              <Input id="bizOwner" value={bizOwner} onChange={(e) => setBizOwner(e.target.value)} placeholder="대표자 이름" data-testid="input-biz-owner" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="bizAddress">사업장 주소</Label>
              <Input id="bizAddress" value={bizAddress} onChange={(e) => setBizAddress(e.target.value)} placeholder="사업장 주소 입력" data-testid="input-biz-address" />
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="bizPhone">연락처</Label>
                <Input id="bizPhone" value={bizPhone} onChange={(e) => setBizPhone(e.target.value)} placeholder="089-932-6273" data-testid="input-biz-phone" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="bizEmail">이메일</Label>
                <Input id="bizEmail" value={bizEmail} onChange={(e) => setBizEmail(e.target.value)} placeholder="email@example.com" data-testid="input-biz-email" />
              </div>
            </div>
            {bizEnabled && (bizName || bizNumber) && (
              <div className="border rounded-md p-3 bg-slate-900 text-white text-xs space-y-1">
                <p className="text-slate-400 font-semibold mb-1">미리보기</p>
                {bizName && <p>상호: {bizName}</p>}
                {bizNumber && <p>사업자등록번호: {bizNumber}</p>}
                {bizOwner && <p>대표: {bizOwner}</p>}
                {bizAddress && <p>주소: {bizAddress}</p>}
                {bizPhone && <p>연락처: {bizPhone}</p>}
                {bizEmail && <p>이메일: {bizEmail}</p>}
              </div>
            )}
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <GripVertical className="w-5 h-5" />
              탭 순서 관리
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-2">
            {tabOrder.map((key, index) => (
              <div key={key} className="flex items-center gap-2 p-2 rounded-md border bg-muted/30" data-testid={`tab-order-item-${key}`}>
                <GripVertical className="w-4 h-4 text-muted-foreground" />
                <span className="flex-1 text-sm font-medium">{tabLabels[key] || key}</span>
                <Button
                  variant="ghost"
                  size="sm"
                  className="h-7 w-7 p-0"
                  disabled={index === 0}
                  onClick={() => {
                    const newOrder = [...tabOrder];
                    [newOrder[index - 1], newOrder[index]] = [newOrder[index], newOrder[index - 1]];
                    setTabOrder(newOrder);
                  }}
                  data-testid={`tab-order-up-${key}`}
                >
                  <ArrowUp className="w-3.5 h-3.5" />
                </Button>
                <Button
                  variant="ghost"
                  size="sm"
                  className="h-7 w-7 p-0"
                  disabled={index === tabOrder.length - 1}
                  onClick={() => {
                    const newOrder = [...tabOrder];
                    [newOrder[index], newOrder[index + 1]] = [newOrder[index + 1], newOrder[index]];
                    setTabOrder(newOrder);
                  }}
                  data-testid={`tab-order-down-${key}`}
                >
                  <ArrowDown className="w-3.5 h-3.5" />
                </Button>
              </div>
            ))}
            <p className="text-xs text-muted-foreground mt-2">화살표를 눌러 탭 순서를 변경한 뒤 상단 저장 버튼을 누르세요</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <GripVertical className="w-5 h-5" />
              견적 카테고리 순서 관리
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-2">
            {catOrder.map((key, index) => {
              const customMatch = key.match(/^custom-(\d+)$/);
              const label = customMatch
                ? (customQuoteCats?.find((c: any) => c.id === parseInt(customMatch[1]))?.name || key)
                : (catLabels[key] || key);
              return (
                <div key={key} className="flex items-center gap-2 p-2 rounded-md border bg-muted/30" data-testid={`cat-order-item-${key}`}>
                  <GripVertical className="w-4 h-4 text-muted-foreground" />
                  <span className="flex-1 text-sm font-medium">{label}</span>
                  {customMatch && <span className="text-xs text-muted-foreground">커스텀</span>}
                  <Button
                    variant="ghost"
                    size="sm"
                    className="h-7 w-7 p-0"
                    disabled={index === 0}
                    onClick={() => {
                      const newOrder = [...catOrder];
                      [newOrder[index - 1], newOrder[index]] = [newOrder[index], newOrder[index - 1]];
                      setCatOrder(newOrder);
                    }}
                    data-testid={`cat-order-up-${key}`}
                  >
                    <ArrowUp className="w-3.5 h-3.5" />
                  </Button>
                  <Button
                    variant="ghost"
                    size="sm"
                    className="h-7 w-7 p-0"
                    disabled={index === catOrder.length - 1}
                    onClick={() => {
                      const newOrder = [...catOrder];
                      [newOrder[index], newOrder[index + 1]] = [newOrder[index + 1], newOrder[index]];
                      setCatOrder(newOrder);
                    }}
                    data-testid={`cat-order-down-${key}`}
                  >
                    <ArrowDown className="w-3.5 h-3.5" />
                  </Button>
                </div>
              );
            })}
            <p className="text-xs text-muted-foreground mt-2">화살표를 눌러 견적 카테고리 순서를 변경한 뒤 상단 저장 버튼을 누르세요</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="w-5 h-5" />
              가짜 카운터 설정
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <p className="text-sm font-medium mb-2">일일 방문자 수 범위</p>
              <div className="grid grid-cols-2 gap-2">
                <div>
                  <Label className="text-xs">최소</Label>
                  <Input type="number" value={fakeVisitorMin} onChange={(e) => setFakeVisitorMin(e.target.value)} className="h-8 text-sm" data-testid="input-fake-visitor-min" />
                </div>
                <div>
                  <Label className="text-xs">최대</Label>
                  <Input type="number" value={fakeVisitorMax} onChange={(e) => setFakeVisitorMax(e.target.value)} className="h-8 text-sm" data-testid="input-fake-visitor-max" />
                </div>
              </div>
              <p className="text-xs text-muted-foreground mt-1">하루 시작 시 이 범위 내 랜덤 값으로 설정됩니다</p>
            </div>
            <div>
              <p className="text-sm font-medium mb-2">일일 회원 증가 범위</p>
              <div className="grid grid-cols-3 gap-2">
                <div>
                  <Label className="text-xs">기준값</Label>
                  <Input type="number" value={fakeMemberBase} onChange={(e) => setFakeMemberBase(e.target.value)} className="h-8 text-sm" data-testid="input-fake-member-base" />
                </div>
                <div>
                  <Label className="text-xs">일 최소 증가</Label>
                  <Input type="number" value={fakeMemberMin} onChange={(e) => setFakeMemberMin(e.target.value)} className="h-8 text-sm" data-testid="input-fake-member-min" />
                </div>
                <div>
                  <Label className="text-xs">일 최대 증가</Label>
                  <Input type="number" value={fakeMemberMax} onChange={(e) => setFakeMemberMax(e.target.value)} className="h-8 text-sm" data-testid="input-fake-member-max" />
                </div>
              </div>
              <p className="text-xs text-muted-foreground mt-1">기준값부터 시작하여 매일 이 범위만큼 증가합니다</p>
            </div>
            <Button
              variant="outline"
              size="sm"
              className="w-full"
              data-testid="button-reset-counter"
              onClick={async () => {
                try {
                  await saveSetting("fake_visitor_range", JSON.stringify({ min: Number(fakeVisitorMin) || 50, max: Number(fakeVisitorMax) || 300 }));
                  await saveSetting("fake_member_range", JSON.stringify({ min: Number(fakeMemberMin) || 5, max: Number(fakeMemberMax) || 20, base: Number(fakeMemberBase) || 563 }));
                  const res = await fetch("/api/admin/reset-visitor-count", { method: "POST", credentials: "include" });
                  if (res.ok) {
                    const data = await res.json();
                    toast({ title: `카운터 적용 완료 (방문자: ${data.visitorCount}명, 회원: ${data.fakeMemberCount}명)` });
                  }
                } catch {
                  toast({ title: "적용 실패", variant: "destructive" });
                }
              }}
            >
              지금 바로 적용 (오늘 방문자 수 리셋)
            </Button>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Globe className="w-5 h-5" />
              미리보기
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="border rounded-md p-4 bg-muted/30">
              <p className="text-sm font-medium text-blue-600 dark:text-blue-400 mb-1">
                {seoTitle || "베트남 붕따우 도깨비"}
              </p>
              <p className="text-xs text-green-700 dark:text-green-400 mb-1">vungtau.blog</p>
              <p className="text-xs text-muted-foreground line-clamp-2">
                {seoDescription || "베트남 붕따우 여행의 모든것, 실시간 견적서 확인, 관광명소 및 맛집 소개"}
              </p>
            </div>
            <p className="text-xs text-muted-foreground">
              위 미리보기는 구글 검색 결과에서 보이는 모습의 예시입니다.
              변경사항은 저장 후 재배포해야 검색엔진에 반영됩니다.
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
