import { useState, useRef, useCallback } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/hooks/use-auth";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { useToast } from "@/hooks/use-toast";
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger } from "@/components/ui/alert-dialog";
import { Dialog, DialogContent } from "@/components/ui/dialog";
import { ArrowLeft, Loader2, Users, Upload, Plus, Trash2, CheckSquare, Square, XSquare, GripVertical, X } from "lucide-react";
import { Link } from "wouter";
import type { EcoProfile } from "@shared/schema";
import { DndContext, closestCenter, PointerSensor, TouchSensor, useSensor, useSensors, type DragEndEvent } from "@dnd-kit/core";
import { SortableContext, rectSortingStrategy, useSortable, arrayMove } from "@dnd-kit/sortable";
import { CSS } from "@dnd-kit/utilities";

function SortableProfileCard({ profile, selectedIds, toggleSelect, profileUploading, handleProfileImageUpload, handleUpdateProfile, handleDeleteProfile, onImageClick }: {
  profile: EcoProfile;
  selectedIds: Set<number>;
  toggleSelect: (id: number) => void;
  profileUploading: number | null;
  handleProfileImageUpload: (id: number, e: React.ChangeEvent<HTMLInputElement>) => void;
  handleUpdateProfile: (id: number, updates: Partial<EcoProfile>) => void;
  handleDeleteProfile: (id: number) => void;
  onImageClick: (url: string, name: string) => void;
}) {
  const { attributes, listeners, setNodeRef, transform, transition, isDragging } = useSortable({ id: profile.id });
  const style = {
    transform: CSS.Transform.toString(transform),
    transition,
    opacity: isDragging ? 0.5 : 1,
    zIndex: isDragging ? 50 : "auto" as any,
  };

  return (
    <div
      ref={setNodeRef}
      style={style}
      className={`relative border rounded-md p-2 space-y-2 transition-all ${selectedIds.has(profile.id) ? "ring-2 ring-pink-500 border-pink-500" : ""}`}
      data-testid={`eco-profile-${profile.id}`}
    >
      <div className="absolute top-1 left-1 z-10 flex items-center gap-0.5">
        <button
          type="button"
          className="touch-none cursor-grab active:cursor-grabbing p-0.5"
          {...attributes}
          {...listeners}
          data-testid={`drag-handle-profile-${profile.id}`}
        >
          <GripVertical className="w-4 h-4 text-slate-400" />
        </button>
        <button
          type="button"
          onClick={() => toggleSelect(profile.id)}
          data-testid={`checkbox-profile-${profile.id}`}
        >
          {selectedIds.has(profile.id) ? (
            <CheckSquare className="w-5 h-5 text-pink-500" />
          ) : (
            <Square className="w-5 h-5 text-slate-400 hover:text-slate-600 dark:hover:text-slate-300" />
          )}
        </button>
      </div>
      {profile.imageUrl ? (
        <div className="relative aspect-square rounded-md overflow-hidden">
          <img
            src={profile.imageUrl}
            alt={profile.name || "에코"}
            className="w-full h-full object-cover cursor-pointer"
            onClick={() => onImageClick(profile.imageUrl, profile.name || "에코")}
            data-testid={`img-eco-profile-${profile.id}`}
          />
          <label className="absolute bottom-0 right-0 flex items-center justify-center bg-black/50 rounded-tl-md px-2 py-1 cursor-pointer hover:bg-black/70 transition-colors" data-testid={`label-change-profile-${profile.id}`}>
            <span className="text-white text-[10px] font-medium">변경</span>
            <input type="file" accept="image/*" className="hidden" onChange={(e) => handleProfileImageUpload(profile.id, e)} />
          </label>
        </div>
      ) : (
        <label className="flex flex-col items-center justify-center aspect-square border-2 border-dashed rounded-md cursor-pointer hover:bg-muted/30 transition-colors" data-testid={`label-upload-profile-${profile.id}`}>
          {profileUploading === profile.id ? (
            <Loader2 className="w-5 h-5 animate-spin text-muted-foreground" />
          ) : (
            <Upload className="w-5 h-5 text-muted-foreground" />
          )}
          <input type="file" accept="image/*" className="hidden" onChange={(e) => handleProfileImageUpload(profile.id, e)} />
        </label>
      )}
      <Input
        value={profile.name || ""}
        onChange={(e) => handleUpdateProfile(profile.id, { name: e.target.value })}
        placeholder="이름"
        className="text-xs h-8"
        data-testid={`input-profile-name-${profile.id}`}
      />
      <AlertDialog>
        <AlertDialogTrigger asChild>
          <Button
            variant="ghost"
            size="icon"
            className="absolute top-1 right-1 text-muted-foreground hover:text-red-500"
            data-testid={`button-delete-profile-${profile.id}`}
          >
            <Trash2 className="w-3.5 h-3.5" />
          </Button>
        </AlertDialogTrigger>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>프로필 삭제</AlertDialogTitle>
            <AlertDialogDescription>
              {profile.name ? `"${profile.name}" 프로필을` : "이 프로필을"} 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>취소</AlertDialogCancel>
            <AlertDialogAction onClick={() => handleDeleteProfile(profile.id)} className="bg-red-600 hover:bg-red-700">삭제</AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}

export default function AdminEcoProfiles() {
  const { isAdmin } = useAuth();
  const { toast } = useToast();
  const queryClient = useQueryClient();
  const [profileUploading, setProfileUploading] = useState<number | null>(null);
  const [addingProfile, setAddingProfile] = useState(false);
  const [bulkUploading, setBulkUploading] = useState(false);
  const [selectedIds, setSelectedIds] = useState<Set<number>>(new Set());
  const [deleting, setDeleting] = useState(false);
  const [viewImage, setViewImage] = useState<{ url: string; name: string } | null>(null);
  const bulkInputRef = useRef<HTMLInputElement>(null);

  const { data: ecoProfilesList = [], isLoading } = useQuery<EcoProfile[]>({
    queryKey: ["/api/admin/eco-profiles"],
    enabled: isAdmin,
  });

  const isSelectMode = selectedIds.size > 0;

  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 8 } }),
    useSensor(TouchSensor, { activationConstraint: { delay: 200, tolerance: 5 } })
  );

  const handleDragEnd = useCallback(async (event: DragEndEvent) => {
    const { active, over } = event;
    if (!over || active.id === over.id) return;
    const oldIndex = ecoProfilesList.findIndex(p => p.id === active.id);
    const newIndex = ecoProfilesList.findIndex(p => p.id === over.id);
    if (oldIndex === -1 || newIndex === -1) return;
    const reordered = arrayMove(ecoProfilesList, oldIndex, newIndex);
    const orderedIds = reordered.map(p => p.id);
    queryClient.setQueryData(["/api/admin/eco-profiles"], reordered);
    try {
      await fetch("/api/admin/eco-profiles/reorder", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ orderedIds }),
      });
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
      queryClient.invalidateQueries({ queryKey: ["/api/eco-profiles"] });
    } catch {
      toast({ title: "순서 변경 실패", variant: "destructive" });
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
    }
  }, [ecoProfilesList, queryClient, toast]);

  const handleAddProfile = async () => {
    setAddingProfile(true);
    try {
      const res = await fetch("/api/admin/eco-profiles", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ name: "", imageUrl: "" }),
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
      toast({ title: "프로필이 추가되었습니다" });
    } catch {
      toast({ title: "추가 실패", variant: "destructive" });
    } finally {
      setAddingProfile(false);
    }
  };

  const handleDeleteProfile = async (id: number) => {
    try {
      const res = await fetch(`/api/admin/eco-profiles/${id}`, {
        method: "DELETE",
        credentials: "include",
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
      queryClient.invalidateQueries({ queryKey: ["/api/eco-profiles"] });
      setSelectedIds(prev => { const next = new Set(prev); next.delete(id); return next; });
    } catch {
      toast({ title: "삭제 실패", variant: "destructive" });
    }
  };

  const handleBulkDelete = async () => {
    if (selectedIds.size === 0) return;
    setDeleting(true);
    try {
      const ids = Array.from(selectedIds);
      await Promise.all(ids.map(id =>
        fetch(`/api/admin/eco-profiles/${id}`, { method: "DELETE", credentials: "include" })
      ));
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
      queryClient.invalidateQueries({ queryKey: ["/api/eco-profiles"] });
      toast({ title: `${ids.length}개 프로필이 삭제되었습니다` });
      setSelectedIds(new Set());
    } catch {
      toast({ title: "삭제 실패", variant: "destructive" });
    } finally {
      setDeleting(false);
    }
  };

  const handleSelectAll = () => {
    if (selectedIds.size === ecoProfilesList.length) {
      setSelectedIds(new Set());
    } else {
      setSelectedIds(new Set(ecoProfilesList.map(p => p.id)));
    }
  };

  const toggleSelect = (id: number) => {
    setSelectedIds(prev => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  const handleUpdateProfile = async (id: number, updates: Partial<EcoProfile>) => {
    try {
      const res = await fetch(`/api/admin/eco-profiles/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(updates),
      });
      if (!res.ok) throw new Error("Failed");
      queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
      queryClient.invalidateQueries({ queryKey: ["/api/eco-profiles"] });
    } catch {
      toast({ title: "수정 실패", variant: "destructive" });
    }
  };

  const handleProfileImageUpload = async (profileId: number, e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setProfileUploading(profileId);
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
          await handleUpdateProfile(profileId, { imageUrl: data.url });
          toast({ title: "사진 업로드 완료" });
        } catch {
          toast({ title: "사진 업로드 실패", variant: "destructive" });
        } finally {
          setProfileUploading(null);
        }
      };
      reader.onerror = () => {
        toast({ title: "사진 업로드 실패", variant: "destructive" });
        setProfileUploading(null);
      };
      reader.readAsDataURL(file);
    } catch {
      toast({ title: "사진 업로드 실패", variant: "destructive" });
      setProfileUploading(null);
    }
  };

  const uploadSingleFile = (file: File): Promise<string> => {
    return new Promise((resolve, reject) => {
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
          resolve(data.url);
        } catch (err) {
          reject(err);
        }
      };
      reader.onerror = () => reject(new Error("Read failed"));
      reader.readAsDataURL(file);
    });
  };

  const handleBulkUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files || files.length === 0) return;
    setBulkUploading(true);
    let successCount = 0;
    let failCount = 0;
    for (let i = 0; i < files.length; i++) {
      try {
        const url = await uploadSingleFile(files[i]);
        const res = await fetch("/api/admin/eco-profiles", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          credentials: "include",
          body: JSON.stringify({ name: "", imageUrl: url }),
        });
        if (res.ok) successCount++;
        else failCount++;
      } catch {
        failCount++;
      }
    }
    queryClient.invalidateQueries({ queryKey: ["/api/admin/eco-profiles"] });
    queryClient.invalidateQueries({ queryKey: ["/api/eco-profiles"] });
    toast({ title: `${successCount}개 업로드 완료${failCount > 0 ? `, ${failCount}개 실패` : ""}` });
    setBulkUploading(false);
    if (bulkInputRef.current) bulkInputRef.current.value = "";
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
    <div className="max-w-2xl mx-auto p-4 pb-20 space-y-6">
      <div className="flex items-center gap-3">
        <Link href="/admin/settings">
          <Button variant="ghost" size="icon" data-testid="button-back-eco-profiles">
            <ArrowLeft className="w-5 h-5" />
          </Button>
        </Link>
        <h1 className="text-xl font-bold">에코 프로필 관리</h1>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Users className="w-5 h-5" />
            프로필 사진 목록 ({ecoProfilesList.length}개)
          </CardTitle>
          <p className="text-sm text-muted-foreground">사진을 길게 누르거나 ⠿ 아이콘을 드래그하여 순서를 변경할 수 있습니다</p>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex gap-2 flex-wrap">
            <Button variant="outline" onClick={() => bulkInputRef.current?.click()} disabled={bulkUploading} data-testid="button-bulk-upload">
              {bulkUploading ? <Loader2 className="w-4 h-4 mr-2 animate-spin" /> : <Upload className="w-4 h-4 mr-2" />}
              여러장 업로드
            </Button>
            <input ref={bulkInputRef} type="file" accept="image/*" multiple className="hidden" onChange={handleBulkUpload} />
            <Button variant={selectedIds.size === ecoProfilesList.length && ecoProfilesList.length > 0 ? "default" : "outline"} onClick={handleSelectAll} disabled={ecoProfilesList.length === 0} data-testid="button-select-all">
              {selectedIds.size === ecoProfilesList.length && ecoProfilesList.length > 0 ? <CheckSquare className="w-4 h-4 mr-2" /> : <Square className="w-4 h-4 mr-2" />}
              전체선택
            </Button>
            {isSelectMode && (
              <>
                <Button variant="outline" onClick={() => setSelectedIds(new Set())} data-testid="button-deselect">
                  <XSquare className="w-4 h-4 mr-2" />
                  선택해제
                </Button>
                <AlertDialog>
                  <AlertDialogTrigger asChild>
                    <Button variant="destructive" disabled={deleting} data-testid="button-bulk-delete">
                      {deleting ? <Loader2 className="w-4 h-4 mr-2 animate-spin" /> : <Trash2 className="w-4 h-4 mr-2" />}
                      {selectedIds.size}개 삭제
                    </Button>
                  </AlertDialogTrigger>
                  <AlertDialogContent>
                    <AlertDialogHeader>
                      <AlertDialogTitle>일괄 삭제</AlertDialogTitle>
                      <AlertDialogDescription>
                        선택한 {selectedIds.size}개 프로필을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
                      </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                      <AlertDialogCancel>취소</AlertDialogCancel>
                      <AlertDialogAction onClick={handleBulkDelete} className="bg-red-600 hover:bg-red-700">삭제</AlertDialogAction>
                    </AlertDialogFooter>
                  </AlertDialogContent>
                </AlertDialog>
              </>
            )}
          </div>
          <DndContext sensors={sensors} collisionDetection={closestCenter} onDragEnd={handleDragEnd}>
            <SortableContext items={ecoProfilesList.map(p => p.id)} strategy={rectSortingStrategy}>
              <div className="grid grid-cols-3 gap-3">
                {ecoProfilesList.map((profile) => (
                  <SortableProfileCard
                    key={profile.id}
                    profile={profile}
                    selectedIds={selectedIds}
                    toggleSelect={toggleSelect}
                    profileUploading={profileUploading}
                    handleProfileImageUpload={handleProfileImageUpload}
                    handleUpdateProfile={handleUpdateProfile}
                    handleDeleteProfile={handleDeleteProfile}
                    onImageClick={(url, name) => setViewImage({ url, name })}
                  />
                ))}
              </div>
            </SortableContext>
          </DndContext>
          <Button
            variant="outline"
            className="w-full border-dashed"
            onClick={handleAddProfile}
            disabled={addingProfile}
            data-testid="button-add-eco-profile"
          >
            {addingProfile ? <Loader2 className="w-4 h-4 mr-2 animate-spin" /> : <Plus className="w-4 h-4 mr-2" />}
            프로필 추가
          </Button>
          <p className="text-xs text-muted-foreground">사진을 올리면 사용자가 날짜별로 인원수에 따라 A, B, C...별 1지망~3지망을 선택할 수 있습니다</p>
        </CardContent>
      </Card>

      <Dialog open={!!viewImage} onOpenChange={() => setViewImage(null)}>
        <DialogContent className="max-w-[90vw] max-h-[90vh] p-0 border-none bg-transparent shadow-none [&>button]:hidden">
          {viewImage && (
            <div className="relative flex items-center justify-center">
              <button
                onClick={() => setViewImage(null)}
                className="absolute top-2 right-2 z-50 bg-black/60 hover:bg-black/80 text-white rounded-full p-1.5 transition-colors"
                data-testid="button-close-image-viewer"
              >
                <X className="w-5 h-5" />
              </button>
              <img
                src={viewImage.url}
                alt={viewImage.name}
                className="max-w-full max-h-[85vh] object-contain rounded-lg"
                data-testid="img-enlarged-profile"
              />
              {viewImage.name && (
                <div className="absolute bottom-2 left-1/2 -translate-x-1/2 bg-black/60 text-white px-3 py-1 rounded-full text-sm">
                  {viewImage.name}
                </div>
              )}
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}