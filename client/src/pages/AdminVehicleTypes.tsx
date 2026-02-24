import { useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/hooks/use-auth";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { useToast } from "@/hooks/use-toast";
import { Switch } from "@/components/ui/switch";
import { ArrowLeft, Plus, Trash2, Save, Loader2, Car, GripVertical } from "lucide-react";
import { Link } from "wouter";
import type { VehicleType } from "@shared/schema";

export default function AdminVehicleTypes() {
  const { isAdmin } = useAuth();
  const { toast } = useToast();
  const queryClient = useQueryClient();
  const [saving, setSaving] = useState(false);
  const [editingId, setEditingId] = useState<number | null>(null);
  const [showForm, setShowForm] = useState(false);

  const [formData, setFormData] = useState({
    key: "", nameKo: "", nameEn: "", descriptionKo: "", descriptionEn: "",
    cityPrice: 0, onewayPrice: 0, hochamOnewayPrice: 0, phanthietOnewayPrice: 0,
    roundtripPrice: 0, cityPickupDropPrice: 0, sortOrder: 0, isActive: true,
  });

  const { data: vehicleTypesList = [], isLoading } = useQuery<VehicleType[]>({
    queryKey: ["/api/admin/vehicle-types"],
    enabled: isAdmin,
  });

  const resetForm = () => {
    setFormData({ key: "", nameKo: "", nameEn: "", descriptionKo: "", descriptionEn: "", cityPrice: 0, onewayPrice: 0, hochamOnewayPrice: 0, phanthietOnewayPrice: 0, roundtripPrice: 0, cityPickupDropPrice: 0, sortOrder: 0, isActive: true });
    setEditingId(null);
    setShowForm(false);
  };

  const handleEdit = (vt: VehicleType) => {
    setFormData({
      key: vt.key, nameKo: vt.nameKo, nameEn: vt.nameEn,
      descriptionKo: vt.descriptionKo, descriptionEn: vt.descriptionEn,
      cityPrice: vt.cityPrice, onewayPrice: vt.onewayPrice,
      hochamOnewayPrice: vt.hochamOnewayPrice, phanthietOnewayPrice: vt.phanthietOnewayPrice,
      roundtripPrice: vt.roundtripPrice, cityPickupDropPrice: vt.cityPickupDropPrice,
      sortOrder: vt.sortOrder ?? 0, isActive: vt.isActive ?? true,
    });
    setEditingId(vt.id);
    setShowForm(true);
  };

  const handleSave = async () => {
    if (!formData.key || !formData.nameKo) {
      toast({ title: "키값과 한글 이름은 필수입니다", variant: "destructive" });
      return;
    }
    setSaving(true);
    try {
      const url = editingId ? `/api/admin/vehicle-types/${editingId}` : "/api/admin/vehicle-types";
      const method = editingId ? "PUT" : "POST";
      const res = await fetch(url, { method, headers: { "Content-Type": "application/json" }, credentials: "include", body: JSON.stringify(formData) });
      if (!res.ok) throw new Error("Failed to save");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/vehicle-types"] });
      queryClient.invalidateQueries({ queryKey: ["/api/vehicle-types"] });
      toast({ title: editingId ? "차량 종류가 수정되었습니다" : "차량 종류가 추가되었습니다" });
      resetForm();
    } catch {
      toast({ title: "저장 실패", variant: "destructive" });
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async (id: number) => {
    if (!confirm("이 차량 종류를 삭제하시겠습니까?")) return;
    try {
      const res = await fetch(`/api/admin/vehicle-types/${id}`, { method: "DELETE", credentials: "include" });
      if (!res.ok) throw new Error("Failed to delete");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/vehicle-types"] });
      queryClient.invalidateQueries({ queryKey: ["/api/vehicle-types"] });
      toast({ title: "차량 종류가 삭제되었습니다" });
    } catch {
      toast({ title: "삭제 실패", variant: "destructive" });
    }
  };

  if (!isAdmin) return <div className="p-8 text-center text-muted-foreground">관리자 권한이 필요합니다</div>;

  return (
    <div className="min-h-screen bg-slate-50 dark:bg-slate-900 p-4 max-w-4xl mx-auto">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/">
          <Button variant="ghost" size="icon" data-testid="button-back"><ArrowLeft className="w-5 h-5" /></Button>
        </Link>
        <h1 className="text-xl font-bold dark:text-white">차량 종류 관리</h1>
      </div>

      <div className="flex justify-end mb-4">
        <Button onClick={() => { resetForm(); setShowForm(true); }} data-testid="button-add-vehicle-type">
          <Plus className="w-4 h-4 mr-2" /> 새 차량 종류 추가
        </Button>
      </div>

      {showForm && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Car className="w-5 h-5" />
              {editingId ? "차량 종류 수정" : "새 차량 종류 추가"}
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label>키값 (영문, 예: 7_seater)</Label>
                <Input value={formData.key} onChange={(e) => setFormData({ ...formData, key: e.target.value })} placeholder="7_seater" disabled={!!editingId} data-testid="input-vt-key" />
              </div>
              <div className="space-y-2">
                <Label>정렬 순서</Label>
                <Input type="number" value={formData.sortOrder} onChange={(e) => setFormData({ ...formData, sortOrder: parseInt(e.target.value) || 0 })} data-testid="input-vt-sort" />
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label>한글 이름</Label>
                <Input value={formData.nameKo} onChange={(e) => setFormData({ ...formData, nameKo: e.target.value })} placeholder="7인승 SUV" data-testid="input-vt-name-ko" />
              </div>
              <div className="space-y-2">
                <Label>영문 이름</Label>
                <Input value={formData.nameEn} onChange={(e) => setFormData({ ...formData, nameEn: e.target.value })} placeholder="7-Seater SUV" data-testid="input-vt-name-en" />
              </div>
            </div>
            <div className="space-y-2">
              <Label>한글 설명 (| 로 줄 구분)</Label>
              <Textarea value={formData.descriptionKo} onChange={(e) => setFormData({ ...formData, descriptionKo: e.target.value })} placeholder="- 7인승 SUV 차량|• 최대 4인+캐리어 4개" rows={3} data-testid="input-vt-desc-ko" />
            </div>
            <div className="space-y-2">
              <Label>영문 설명 (| 로 줄 구분)</Label>
              <Textarea value={formData.descriptionEn} onChange={(e) => setFormData({ ...formData, descriptionEn: e.target.value })} placeholder="- 7-Seater SUV|• Max 4 passengers" rows={3} data-testid="input-vt-desc-en" />
            </div>
            <div className="border-t pt-4">
              <Label className="text-sm font-bold mb-3 block">경로별 가격 (USD)</Label>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">시내투어</Label>
                  <Input type="number" min="0" value={formData.cityPrice} onChange={(e) => setFormData({ ...formData, cityPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-city" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">편도(붕따우)</Label>
                  <Input type="number" min="0" value={formData.onewayPrice} onChange={(e) => setFormData({ ...formData, onewayPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-oneway" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">편도(호짬)</Label>
                  <Input type="number" min="0" value={formData.hochamOnewayPrice} onChange={(e) => setFormData({ ...formData, hochamOnewayPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-hocham" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">편도(판티엣)</Label>
                  <Input type="number" min="0" value={formData.phanthietOnewayPrice} onChange={(e) => setFormData({ ...formData, phanthietOnewayPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-phanthiet" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">왕복</Label>
                  <Input type="number" min="0" value={formData.roundtripPrice} onChange={(e) => setFormData({ ...formData, roundtripPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-roundtrip" />
                </div>
                <div className="space-y-1">
                  <Label className="text-xs text-muted-foreground">픽드랍+시내</Label>
                  <Input type="number" min="0" value={formData.cityPickupDropPrice} onChange={(e) => setFormData({ ...formData, cityPickupDropPrice: parseInt(e.target.value) || 0 })} data-testid="input-vt-pickup-drop" />
                </div>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                <Switch checked={formData.isActive} onCheckedChange={(v) => setFormData({ ...formData, isActive: v })} data-testid="switch-vt-active" />
                <Label className="text-sm">활성화</Label>
              </div>
              <div className="flex gap-2">
                <Button variant="outline" onClick={resetForm} data-testid="button-vt-cancel">취소</Button>
                <Button onClick={handleSave} disabled={saving} data-testid="button-vt-save">
                  {saving ? <Loader2 className="w-4 h-4 animate-spin mr-2" /> : <Save className="w-4 h-4 mr-2" />}
                  {editingId ? "수정" : "추가"}
                </Button>
              </div>
            </div>
          </CardContent>
        </Card>
      )}

      {isLoading ? (
        <div className="flex justify-center py-12"><Loader2 className="w-8 h-8 animate-spin text-muted-foreground" /></div>
      ) : (
        <div className="space-y-3">
          {vehicleTypesList.map((vt) => (
            <Card key={vt.id} className={`${!vt.isActive ? "opacity-50" : ""}`}>
              <CardContent className="p-4">
                <div className="flex items-start justify-between gap-4">
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 mb-1">
                      <GripVertical className="w-4 h-4 text-muted-foreground shrink-0" />
                      <span className="text-xs text-muted-foreground">#{vt.sortOrder}</span>
                      <span className="font-bold text-sm">{vt.nameKo}</span>
                      <span className="text-xs text-muted-foreground">({vt.nameEn})</span>
                      {!vt.isActive && <span className="text-xs bg-red-100 text-red-600 px-2 py-0.5 rounded">비활성</span>}
                    </div>
                    <div className="text-xs text-muted-foreground mb-2">key: {vt.key}</div>
                    <div className="grid grid-cols-3 md:grid-cols-6 gap-2 text-xs">
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">시내</div>
                        <div className="font-bold">${vt.cityPrice}</div>
                      </div>
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">편도</div>
                        <div className="font-bold">${vt.onewayPrice}</div>
                      </div>
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">호짬</div>
                        <div className="font-bold">${vt.hochamOnewayPrice}</div>
                      </div>
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">판티엣</div>
                        <div className="font-bold">${vt.phanthietOnewayPrice}</div>
                      </div>
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">왕복</div>
                        <div className="font-bold">${vt.roundtripPrice}</div>
                      </div>
                      <div className="bg-slate-100 dark:bg-slate-800 rounded p-2 text-center">
                        <div className="text-muted-foreground">픽드랍</div>
                        <div className="font-bold">${vt.cityPickupDropPrice}</div>
                      </div>
                    </div>
                  </div>
                  <div className="flex flex-col gap-1 shrink-0">
                    <Button variant="outline" size="sm" onClick={() => handleEdit(vt)} data-testid={`button-edit-vt-${vt.id}`}>수정</Button>
                    <Button variant="outline" size="sm" className="text-red-500 hover:text-red-600" onClick={() => handleDelete(vt.id)} data-testid={`button-delete-vt-${vt.id}`}>
                      <Trash2 className="w-3 h-3" />
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
          {vehicleTypesList.length === 0 && (
            <div className="text-center py-12 text-muted-foreground">등록된 차량 종류가 없습니다</div>
          )}
        </div>
      )}
    </div>
  );
}