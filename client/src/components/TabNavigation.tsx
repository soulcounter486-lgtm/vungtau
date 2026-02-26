import { useRef, useEffect } from "react";
import { Link, useLocation } from "wouter";
import { Button } from "@/components/ui/button";
import { useQuery } from "@tanstack/react-query";
import {
  Calculator,
  MapPin,
  Flag,
  ShoppingBag,
  Sparkles,
  MessageCircle,
  Wallet,
  Building
} from "lucide-react";

interface TabNavigationProps {
  language: string;
}

const navLabels: Record<string, Record<string, string>> = {
  calculator: { ko: "견적", en: "Quote", zh: "报价", vi: "Báo giá", ru: "Расчёт", ja: "見積" },
  guide: { ko: "관광", en: "Guide", zh: "指南", vi: "Hướng dẫn", ru: "Гид", ja: "ガイド" },
  board: { ko: "소식", en: "News", zh: "新闻", vi: "Tin tức", ru: "Новости", ja: "ニュース" },
  shop: { ko: "쇼핑", en: "Shop", zh: "购物", vi: "Mua sắm", ru: "Магазин", ja: "ショップ" },
  planner: { ko: "AI플래너", en: "Planner", zh: "规划", vi: "Kế hoạch", ru: "Планер", ja: "プランナー" },
  chat: { ko: "채팅", en: "Chat", zh: "聊天", vi: "Trò chuyện", ru: "Чат", ja: "チャット" },
  expenses: { ko: "가계부", en: "Expenses", zh: "账本", vi: "Chi tiêu", ru: "Расходы", ja: "家計簿" },
  realestate: { ko: "부동산", en: "Real Estate", zh: "房产", vi: "Bất động sản", ru: "Недвижимость", ja: "不動産" },
};

const iconMap: Record<string, any> = {
  calculator: Calculator,
  planner: Sparkles,
  guide: MapPin,
  board: Flag,
  shop: ShoppingBag,
  chat: MessageCircle,
  expenses: Wallet,
  realestate: Building,
};

const pathMap: Record<string, string> = {
  calculator: "/",
  planner: "/planner",
  guide: "/guide",
  board: "/board",
  shop: "/diet",
  chat: "/chat",
  expenses: "/expenses",
  realestate: "/realestate",
};

const defaultTabOrder = ["calculator", "planner", "guide", "board", "shop", "chat", "expenses", "realestate"];

const SCROLL_KEY = "tabNavScrollPosition";

export function TabNavigation({ language }: TabNavigationProps) {
  const [location] = useLocation();
  const scrollRef = useRef<HTMLDivElement>(null);

  const { data: siteSettings } = useQuery<Record<string, string>>({
    queryKey: ["/api/site-settings"],
  });

  const t = (key: string) => navLabels[key]?.[language] || navLabels[key]?.ko || key;

  useEffect(() => {
    const saved = sessionStorage.getItem(SCROLL_KEY);
    if (saved && scrollRef.current) {
      scrollRef.current.scrollLeft = parseInt(saved, 10);
    }
  }, []);

  const handleClick = () => {
    if (scrollRef.current) {
      sessionStorage.setItem(SCROLL_KEY, scrollRef.current.scrollLeft.toString());
    }
  };

  const isActive = (path: string) => {
    if (path === "/" && location === "/") return true;
    if (path !== "/" && location.startsWith(path)) return true;
    return false;
  };

  let tabOrder = defaultTabOrder;
  if (siteSettings?.tab_order) {
    try {
      const parsed = JSON.parse(siteSettings.tab_order);
      if (Array.isArray(parsed) && parsed.length > 0) {
        const missingTabs = defaultTabOrder.filter(t => !parsed.includes(t));
        tabOrder = [...parsed.filter((t: string) => defaultTabOrder.includes(t)), ...missingTabs];
      }
    } catch {}
  }

  const tabs = tabOrder.map(key => ({
    path: pathMap[key] || "/",
    icon: iconMap[key] || Calculator,
    label: key,
    testId: `nav-${key}`,
  }));

  return (
    <div className="bg-background border-b sticky top-0 z-50">
      <div 
        ref={scrollRef}
        className="container mx-auto px-4 overflow-x-auto scrollbar-hide"
      >
        <div className="flex items-center gap-1.5 py-2 min-w-max">
          {tabs.map(({ path, icon: Icon, label, testId }) => (
            <Link key={path} href={path} onClick={handleClick}>
              <Button 
                variant={isActive(path) ? "default" : "outline"} 
                size="sm" 
                className="flex items-center gap-1.5 text-xs whitespace-nowrap" 
                data-testid={testId}
              >
                <Icon className="w-3.5 h-3.5" />
                {t(label)}
              </Button>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
