import { createContext, useContext, useState, ReactNode } from "react";

export type Language = "ko" | "en" | "zh" | "vi" | "ru" | "ja";

export const languageNames: Record<Language, string> = {
  ko: "한국어",
  en: "English",
  zh: "中文",
  vi: "Tiếng Việt",
  ru: "Русский",
  ja: "日本語",
};

export const languageFlags: Record<Language, string> = {
  ko: "🇰🇷",
  en: "🇺🇸",
  zh: "🇨🇳",
  vi: "🇻🇳",
  ru: "🇷🇺",
  ja: "🇯🇵",
};

export const translations: Record<Language, Record<string, string>> = {
  ko: {
    // Header
    "header.title": "붕따우 도깨비",
    "header.subtitle": "여행견적",
    "header.description": "풀빌라, 차량, 가이드 서비스 등 나만의 맞춤 여행 견적을 실시간으로 확인하세요.",
    
    // Navigation
    "nav.calculator": "견적 계산기",
    "nav.guide": "관광/맛집",
    "nav.expenses": "여행 가계부",
    "nav.nearby": "내 주변",
    
    // Nearby Places
    "nearby.title": "내 주변 장소",
    "nearby.subtitle": "현재 위치 기준으로 주변 맛집, 카페, 편의시설을 찾아보세요",
    "nearby.loading": "위치 정보를 불러오는 중...",
    "nearby.error": "장소 정보를 불러오는데 실패했습니다",
    "nearby.noResults": "주변에 해당하는 장소가 없습니다",
    "nearby.locationError": "위치 정보를 가져올 수 없습니다.",
    "nearby.noGeolocation": "이 브라우저는 위치 서비스를 지원하지 않습니다.",
    "nearby.usingDefault": "붕따우 중심 기준으로 검색합니다.",
    "nearby.open": "영업중",
    "nearby.closed": "영업종료",
    "nearby.reviews": "개의 리뷰",
    "nearby.recentReviews": "최근 리뷰",
    "nearby.openMaps": "지도에서 열기",
    "nearby.category.restaurant": "음식점",
    "nearby.category.cafe": "카페",
    "nearby.category.pharmacy": "약국",
    "nearby.category.atm": "ATM",
    "nearby.category.convenience_store": "편의점",
    "nearby.category.hospital": "병원",
    "nearby.category.gas_station": "주유소",
    "nearby.category.hair_care": "미용실",
    "nearby.category.lodging": "숙박",
    
    // Villa Section
    "villa.title": "럭셔리 풀빌라 숙박",
    "villa.checkIn": "체크인 날짜",
    "villa.checkOut": "체크아웃 날짜",
    "villa.selectDate": "날짜 선택",
    "villa.weekday": "평일(일-목)",
    "villa.friday": "금요일",
    "villa.saturday": "토요일",
    "villa.holiday": "공휴일",
    "villa.priceNote": "※가격은 방 오픈 갯수와 성수기(6,7,8,9월) 공휴일에 따라 상이 할 수 있습니다.\n※최저가 보장※ 어플가격이 더 싸다면 링크 보내주시면 더 저렴하게 부킹 해 드립니다.",
    "villa.estimatedPrice": "예상 금액",
    "villa.nightsTotal": "박 기준 예상 금액입니다",
    "villa.viewMore": "실제 빌라 사진 더보기",
    
    // Vehicle Section
    "vehicle.title": "프라이빗 차량렌트 및 투어",
    "vehicle.viewMore": "실제 차량 사진 더보기",
    "vehicle.info": "차량 서비스 안내",
    "vehicle.included": "[포함 사항]",
    "vehicle.includedItems": "운전기사, 유류비, 통행료 및 팁|대기료, 야간 할증",
    "vehicle.notIncluded": "[불포함 사항]",
    "vehicle.notIncludedItems": "개별 여행자 보험",
    "vehicle.date": "날짜",
    "vehicle.type": "차량 종류",
    "vehicle.route": "이동 경로",
    "vehicle.addDay": "차량 이용일 추가",
    "vehicle.estimatedPrice": "이용 금액 (예상)",
    "vehicle.select": "선택",
    
    // Vehicle Types
    "vehicle.7_seater": "7인승 SUV",
    "vehicle.16_seater": "16인승 밴",
    "vehicle.9_limo": "9인승 리무진",
    "vehicle.9_lux_limo": "9인승 럭셔리 리무진",
    "vehicle.12_lux_limo": "12인승 럭셔리 리무진",
    "vehicle.16_lux_limo": "16인승 럭셔리 리무진",
    "vehicle.29_seater": "29인승 버스",
    "vehicle.45_seater": "45인승 버스",
    
    // Routes
    "route.city": "붕따우 시내관광",
    "route.oneway": "호치민 ↔ 붕따우 (편도)",
    "route.hocham_oneway": "호치민 ↔ 호짬 (편도)",
    "route.phanthiet_oneway": "호치민 ↔ 판티엣 (편도)",
    "route.roundtrip": "호치민 ↔ 붕따우 (왕복)",
    "route.city_pickup_drop": "호치민 픽업/드랍 + 붕따우 시내",
    
    // Golf Section
    "golf.title": "골프 라운딩",
    "golf.viewMore": "골프장 정보 더보기",
    "golf.info": "골프 서비스 안내",
    "golf.included": "[포함 사항]",
    "golf.includedItems": "그린피, 캐디피, 카트비|락커, 샤워 시설 이용",
    "golf.notIncluded": "[불포함 사항]",
    "golf.notIncludedItems": "캐디팁 (1인당 $15~20 권장)|식사 및 음료",
    "golf.date": "날짜",
    "golf.course": "골프장",
    "golf.courseSelect": "골프장 선택",
    "golf.players": "인원",
    "golf.addDay": "골프 일정 추가",
    "golf.person": "명",
    
    // Golf Courses
    "golf.paradise": "파라다이스 CC",
    "golf.twin_doves": "트윈도브스 GC",
    "golf.sonadezi": "소나데지 CC",
    "golf.the_bluffs": "더 블러프스 GC",
    "golf.jw_marriott": "JW 메리어트 GC",
    "golf.mamason": "마마손 GC",
    
    // Eco Girl Section
    "ecoGirl.title": "에코걸 서비스",
    "ecoGirl.viewMore": "에코걸 정보 더보기",
    "ecoGirl.count": "인원 수",
    "ecoGirl.nights": "이용 박수",
    "ecoGirl.info": "에코걸 서비스 안내",
    "ecoGirl.infoText": "1박당 1인 기준 요금입니다. 인원과 박수를 선택해주세요.",
    "ecoGirl.person": "명",
    "ecoGirl.night": "박",
    
    // Guide Section
    "guide.title": "한국어 투어 가이드",
    "guide.viewMore": "가이드 정보 더보기",
    "guide.days": "가이드 일수",
    "guide.groupSize": "그룹 인원",
    "guide.info": "가이드 서비스 안내",
    "guide.infoText": "그룹 인원에 따라 1인당 요금이 달라집니다.",
    "guide.estimatedPrice": "예상 금액",
    "guide.baseRate": "기본 요금 (4인까지)",
    "guide.perDay": "일",
    "guide.extraCharge": "추가 인원",
    "guide.daysTotal": "일 기준 예상 금액",
    "guide.day": "일",
    "guide.person": "명",
    
    // Quote Summary
    "quote.title": "예상 견적 금액",
    "common.exchangeRate": "현재 환율",
    "quote.villa": "풀빌라 숙박",
    "quote.vehicle": "차량 서비스",
    "quote.golf": "골프 라운딩",
    "quote.ecoGirl": "에코 가이드",
    "quote.guide": "한국어 가이드",
    "quote.note": "실제 가격은 현지 상황에 따라 다를 수 있습니다.",
    "quote.actualLower": "실견적 금액은 예상금액보다 적습니다.",
    "quote.save": "견적서 저장",
    "quote.ready": "준비되셨나요?",
    "quote.readyDesc": "왼쪽 옵션을 조정하여 맞춤 여행 견적을 실시간으로 확인하세요.",
    "quote.calculating": "견적을 계산하고 있습니다...",
    
    // Contact Section
    "contact.title": "문의하기",
    "contact.vietnam": "베트남",
    "contact.korea": "한국",
    "contact.kakao": "카톡ID",
    "contact.blog": "블로그",
    
    // Dialog
    "dialog.customerName": "고객명",
    "dialog.saveQuote": "견적 저장",
    "dialog.cancel": "취소",
    "dialog.save": "저장",
    "dialog.enterName": "고객 이름을 입력하세요",
    
    // Language
    "language.select": "언어 선택",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- 7인승 SUV 차량(2,3인 추천)|• 최대 4인+캐리어 4개|• 골프백 이용 시 최대 3인(골프백3개 + 캐리어 3개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.16_seater": "- 16인승 미니밴 차량(4~6인 추천, 최대 8인)|• 6인(골프백 6개 + 캐리어 6개)|• 9인(캐리어 9개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.9_limo": "- 9인승 미니밴 차량(4~6인 추천, 최대 6인)|• 4인(골프백 4개 + 캐리어 4개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.9_lux_limo": "- 9인승 럭셔리 리무진 차량(4~6인 추천, 최대 6인)|• VIP 인테리어, 편안한 좌석|• 4인(골프백 4개 + 캐리어 4개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.12_lux_limo": "- 12인승 VIP리무진 밴 차량(6~8인 추천, 최대 8인)|• 6인(골프백 6개 + 캐리어 6개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.16_lux_limo": "- 16인승 미니밴 차량(10인 이상 추천, 최대 16인)|• 16인(골프백 16개 + 캐리어 16개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.29_seater": "- 29인승 미니밴 차량(10인 이상 추천, 최대 25인)|• 15인(골프백 15개 + 캐리어 15개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    "vehicle.desc.45_seater": "- 45인승 대형 버스 차량(20인 이상 추천, 최대 40인)|• 20인(골프백 20개 + 캐리어 20개)|• 요청 주신 픽업,드랍장소로 진행|• 기사 포함, 추가금 없음(지연, 대기, 야간 일체)",
    
    // Golf Info
    "golf.info.included": "* 포함사항: 그린피, 카트피(2인 1카트), 캐디피",
    "golf.info.notIncluded": "* 불포함(현장지불): 캐디팁 (파라다이스 40만동 / 쩌우득·호짬 50만동)",
    "golf.info.weekend": "* 주말요금 적용: 토요일, 일요일",
    "golf.estimatedPrice": "예상 금액",
    "golf.caddyTipNote": "* 캐디팁 별도 (파라다이스: 40만동/인, 쩌우득/호짬: 50만동/인)",
    "golf.course.paradise": "파라다이스",
    "golf.course.chouduc": "쩌우득",
    "golf.course.hocham": "호짬",
    "golf.course.paradise_price": "파라다이스 (평일 $90 / 주말 $110)",
    "golf.course.chouduc_price": "쩌우득 (평일 $80 / 주말 $120)",
    "golf.course.hocham_price": "호짬 (평일 $150 / 주말 $200)",
    
    // Footer
    "footer.connect": "채널 연결",
    "footer.visit": "방문하기",
    "footer.terms": "이용약관",
    "footer.privacy": "개인정보처리방침",
    
    // File name
    "file.quoteName": "붕따우_도깨비_견적서",
    
    // Toast messages
    "toast.saved": "저장 완료",
    "toast.savedDesc": "견적서가 성공적으로 저장되었습니다",
    "toast.error": "오류",
    "toast.errorDesc": "문제가 발생했습니다. 다시 시도해주세요",
    
    // Travel Planner
    "nav.planner": "AI 여행플래너",
    "nav.chat": "채팅방",
    "nav.board": "붕따우 소식",
    "nav.diet": "쇼핑",
    "planner.title": "AI 여행 플래너",
    "planner.subtitle": "여행 목적과 일정을 선택하면 AI가 최적의 여행 계획을 만들어 드립니다",
    "planner.purpose": "여행 목적",
    "planner.purpose.gourmet": "식도락 여행",
    "planner.purpose.relaxing": "여유로운 힐링",
    "planner.purpose.golf": "골프 여행",
    "planner.purpose.adventure": "관광 탐험",
    "planner.purpose.culture": "문화 역사 탐방",
    "planner.purpose.family": "가족 여행",
    "planner.purpose.nightlife": "신나는 밤문화",
    "planner.purpose.casino": "카지노",
    "planner.startDate": "출발일",
    "planner.endDate": "종료일",
    "planner.generate": "여행 일정 생성",
    "planner.generating": "AI가 일정을 생성 중...",
    "planner.day": "일차",
    "planner.tips": "여행 팁",
    "planner.regenerate": "다시 생성",
    "planner.selectPurpose": "여행 목적을 선택하세요",
    "planner.selectDates": "여행 일정을 선택하세요",
  },
  
  en: {
    // Header
    "header.title": "Vung Tau Dokkaebi",
    "header.subtitle": "Travel Quote",
    "header.description": "Check your customized travel quote for pool villas, vehicles, and guide services in real-time.",
    
    // Navigation
    "nav.calculator": "Quote Calculator",
    "nav.guide": "Travel Guide",
    "nav.expenses": "Expense Tracker",
    "nav.nearby": "Nearby",
    
    // Nearby Places
    "nearby.title": "Nearby Places",
    "nearby.subtitle": "Find restaurants, cafes, and amenities near your current location",
    "nearby.loading": "Loading location...",
    "nearby.error": "Failed to load nearby places",
    "nearby.noResults": "No places found nearby",
    "nearby.locationError": "Unable to get your location.",
    "nearby.noGeolocation": "This browser does not support geolocation.",
    "nearby.usingDefault": "Searching from Vung Tau center.",
    "nearby.open": "Open",
    "nearby.closed": "Closed",
    "nearby.reviews": "reviews",
    "nearby.recentReviews": "Recent Reviews",
    "nearby.openMaps": "Open in Maps",
    "nearby.category.restaurant": "Restaurant",
    "nearby.category.cafe": "Cafe",
    "nearby.category.pharmacy": "Pharmacy",
    "nearby.category.atm": "ATM",
    "nearby.category.convenience_store": "Convenience",
    "nearby.category.hospital": "Hospital",
    "nearby.category.gas_station": "Gas Station",
    "nearby.category.hair_care": "Hair Salon",
    "nearby.category.lodging": "Lodging",
    
    // Villa Section
    "villa.title": "Luxury Pool Villa Stay",
    "villa.checkIn": "Check-in Date",
    "villa.checkOut": "Check-out Date",
    "villa.selectDate": "Select Date",
    "villa.weekday": "Weekdays (Sun-Thu)",
    "villa.friday": "Friday",
    "villa.saturday": "Saturday",
    "villa.holiday": "Holiday",
    "villa.priceNote": "* Prices may vary based on villa size and condition.",
    "villa.estimatedPrice": "Estimated Price",
    "villa.nightsTotal": " night(s) total",
    "villa.viewMore": "View More Villa Photos",
    
    // Vehicle Section
    "vehicle.title": "Private Vehicle (Daily Selection)",
    "vehicle.viewMore": "View More Vehicle Photos",
    "vehicle.info": "Vehicle Service Info",
    "vehicle.included": "[Included]",
    "vehicle.includedItems": "Driver, fuel, tolls, and tips|Waiting fee, night surcharge",
    "vehicle.notIncluded": "[Not Included]",
    "vehicle.notIncludedItems": "Individual travel insurance",
    "vehicle.date": "Date",
    "vehicle.type": "Vehicle Type",
    "vehicle.route": "Route",
    "vehicle.addDay": "Add Vehicle Day",
    "vehicle.estimatedPrice": "Estimated Price",
    "vehicle.select": "Select",
    
    // Vehicle Types
    "vehicle.7_seater": "7-Seater SUV",
    "vehicle.16_seater": "16-Seater Van",
    "vehicle.9_limo": "9-Seater Limousine",
    "vehicle.9_lux_limo": "9-Seater Luxury Limousine",
    "vehicle.12_lux_limo": "12-Seater Luxury Limousine",
    "vehicle.16_lux_limo": "16-Seater Luxury Limousine",
    "vehicle.29_seater": "29-Seater Bus",
    "vehicle.45_seater": "45-Seater Bus",
    
    // Routes
    "route.city": "Vung Tau City Tour",
    "route.oneway": "Ho Chi Minh ↔ Vung Tau (One Way)",
    "route.hocham_oneway": "Ho Chi Minh ↔ Ho Tram (One Way)",
    "route.phanthiet_oneway": "Ho Chi Minh ↔ Phan Thiet (One Way)",
    "route.roundtrip": "Ho Chi Minh ↔ Vung Tau (Round Trip)",
    "route.city_pickup_drop": "HCM Pickup/Drop + Vung Tau City",
    
    // Golf Section
    "golf.title": "Golf Round",
    "golf.viewMore": "View Golf Course Info",
    "golf.info": "Golf Service Info",
    "golf.included": "[Included]",
    "golf.includedItems": "Green fee, caddy fee, cart fee|Locker and shower facilities",
    "golf.notIncluded": "[Not Included]",
    "golf.notIncludedItems": "Caddy tip ($15-20 per person recommended)|Meals and beverages",
    "golf.date": "Date",
    "golf.course": "Golf Course",
    "golf.courseSelect": "Select Golf Course",
    "golf.players": "Players",
    "golf.addDay": "Add Golf Day",
    "golf.person": "person(s)",
    
    // Golf Courses
    "golf.paradise": "Paradise CC",
    "golf.twin_doves": "Twin Doves GC",
    "golf.sonadezi": "Sonadezi CC",
    "golf.the_bluffs": "The Bluffs GC",
    "golf.jw_marriott": "JW Marriott GC",
    "golf.mamason": "Mamason GC",
    
    // Eco Girl Section
    "ecoGirl.title": "Eco Girl Service",
    "ecoGirl.viewMore": "View Eco Girl Info",
    "ecoGirl.count": "Number of People",
    "ecoGirl.nights": "Number of Nights",
    "ecoGirl.info": "Eco Girl Service Info",
    "ecoGirl.infoText": "Price per person per night. Select the number of people and nights.",
    "ecoGirl.person": "person(s)",
    "ecoGirl.night": "night(s)",
    
    // Guide Section
    "guide.title": "Korean Tour Guide",
    "guide.viewMore": "View Guide Info",
    "guide.days": "Guide Days",
    "guide.groupSize": "Group Size",
    "guide.info": "Guide Service Info",
    "guide.infoText": "Price per person varies by group size.",
    "guide.estimatedPrice": "Estimated Price",
    "guide.baseRate": "Base Rate (up to 4 people)",
    "guide.perDay": "day",
    "guide.extraCharge": "Extra charge",
    "guide.daysTotal": " day(s) total",
    "guide.day": "day(s)",
    "guide.person": "person(s)",
    
    // Quote Summary
    "quote.title": "Estimated Quote",
    "common.exchangeRate": "Exchange Rate",
    "quote.villa": "Pool Villa Stay",
    "quote.vehicle": "Vehicle Service",
    "quote.golf": "Golf Round",
    "quote.ecoGirl": "Eco Guide",
    "quote.guide": "Korean Guide",
    "quote.note": "Actual prices may vary depending on local conditions.",
    "quote.actualLower": "The actual quote is lower than the estimate.",
    "quote.save": "Save Quote",
    "quote.ready": "Ready to start?",
    "quote.readyDesc": "Adjust the options on the left to see your customized travel quote in real-time.",
    "quote.calculating": "Calculating your quote...",
    
    // Contact Section
    "contact.title": "Contact Us",
    "contact.vietnam": "Vietnam",
    "contact.korea": "Korea",
    "contact.kakao": "KakaoTalk",
    "contact.blog": "Blog",
    
    // Dialog
    "dialog.customerName": "Customer Name",
    "dialog.saveQuote": "Save Quote",
    "dialog.cancel": "Cancel",
    "dialog.save": "Save",
    "dialog.enterName": "Enter customer name",
    
    // Language
    "language.select": "Select Language",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- 7-Seater SUV (Recommended for 2-3 people)|• Max 4 passengers + 4 suitcases|• With golf bags: max 3 passengers (3 golf bags + 3 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.16_seater": "- 16-Seater Minivan (Recommended for 4-6 people, max 8)|• 6 passengers (6 golf bags + 6 suitcases)|• 9 passengers (9 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.9_limo": "- 9-Seater Minivan (Recommended for 4-6 people, max 6)|• 4 passengers (4 golf bags + 4 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.9_lux_limo": "- 9-Seater Luxury Limousine (Recommended for 4-6 people, max 6)|• VIP interior, comfortable seating|• 4 passengers (4 golf bags + 4 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.12_lux_limo": "- 12-Seater VIP Limousine (Recommended for 6-8 people, max 8)|• 6 passengers (6 golf bags + 6 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.16_lux_limo": "- 16-Seater Minivan (Recommended for 10+ people, max 16)|• 16 passengers (16 golf bags + 16 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.29_seater": "- 29-Seater Bus (Recommended for 10+ people, max 25)|• 15 passengers (15 golf bags + 15 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    "vehicle.desc.45_seater": "- 45-Seater Bus (Recommended for 20+ people, max 40)|• 20 passengers (20 golf bags + 20 suitcases)|• Pickup/drop-off at your requested location|• Driver included, no extra charges (delays, waiting, night)",
    
    // Golf Info
    "golf.info.included": "* Included: Green fee, cart fee (2 per cart), caddy fee",
    "golf.info.notIncluded": "* Not included (pay on-site): Caddy tip (Paradise 400k VND / Chouduc/Ho Tram 500k VND)",
    "golf.info.weekend": "* Weekend rate applies: Saturday, Sunday",
    "golf.estimatedPrice": "Estimated Price",
    "golf.caddyTipNote": "* Caddy tip not included (Paradise: 400K VND/person, Chouduc/Hocham: 500K VND/person)",
    "golf.course.paradise": "Paradise",
    "golf.course.chouduc": "Chouduc",
    "golf.course.hocham": "Ho Tram",
    "golf.course.paradise_price": "Paradise (Weekday $90 / Weekend $110)",
    "golf.course.chouduc_price": "Chouduc (Weekday $80 / Weekend $120)",
    "golf.course.hocham_price": "Ho Tram (Weekday $150 / Weekend $200)",
    
    // Footer
    "footer.connect": "Connect Channel",
    "footer.visit": "Visit",
    "footer.terms": "Terms of Service",
    "footer.privacy": "Privacy Policy",
    
    // File name
    "file.quoteName": "VungTau_Dokkaebi_Quote",
    
    // Toast messages
    "toast.saved": "Saved",
    "toast.savedDesc": "Your quote has been saved successfully",
    "toast.error": "Error",
    "toast.errorDesc": "Something went wrong. Please try again",
    
    // Travel Planner
    "nav.planner": "AI Travel Planner",
    "nav.chat": "Chat Room",
    "nav.board": "Vung Tau News",
    "nav.diet": "Shop",
    "planner.title": "AI Travel Planner",
    "planner.subtitle": "Select your travel purpose and dates, and AI will create the perfect itinerary for you",
    "planner.purpose": "Travel Purpose",
    "planner.purpose.gourmet": "Gourmet Tour",
    "planner.purpose.relaxing": "Relaxing Retreat",
    "planner.purpose.golf": "Golf Trip",
    "planner.purpose.adventure": "Adventure Tour",
    "planner.purpose.culture": "Culture & History",
    "planner.purpose.family": "Family Trip",
    "planner.purpose.nightlife": "Exciting Nightlife",
    "planner.purpose.casino": "Casino",
    "planner.startDate": "Start Date",
    "planner.endDate": "End Date",
    "planner.generate": "Generate Itinerary",
    "planner.generating": "AI is generating your plan...",
    "planner.day": "Day",
    "planner.tips": "Travel Tips",
    "planner.regenerate": "Regenerate",
    "planner.selectPurpose": "Select travel purpose",
    "planner.selectDates": "Select travel dates",
  },
  
  zh: {
    // Header
    "header.title": "头顿 Dokkaebi",
    "header.subtitle": "旅行报价",
    "header.description": "实时查看您的定制旅行报价，包括别墅、车辆和导游服务。",
    
    // Navigation
    "nav.calculator": "报价计算器",
    "nav.guide": "旅游指南",
    "nav.expenses": "旅行记账",
    "nav.nearby": "附近",
    
    // Nearby Places
    "nearby.title": "附近地点",
    "nearby.subtitle": "在您当前位置附近查找餐厅、咖啡馆和便利设施",
    "nearby.loading": "正在加载位置信息...",
    "nearby.error": "加载附近地点失败",
    "nearby.noResults": "附近没有找到地点",
    "nearby.locationError": "无法获取您的位置。",
    "nearby.noGeolocation": "此浏览器不支持地理定位。",
    "nearby.usingDefault": "从头顿中心搜索。",
    "nearby.open": "营业中",
    "nearby.closed": "已关门",
    "nearby.reviews": "条评价",
    "nearby.recentReviews": "最近评价",
    "nearby.openMaps": "在地图中打开",
    "nearby.category.restaurant": "餐厅",
    "nearby.category.cafe": "咖啡馆",
    "nearby.category.pharmacy": "药店",
    "nearby.category.atm": "ATM",
    "nearby.category.convenience_store": "便利店",
    "nearby.category.hospital": "医院",
    "nearby.category.gas_station": "加油站",
    "nearby.category.hair_care": "美发店",
    "nearby.category.lodging": "住宿",
    
    // Villa Section
    "villa.title": "豪华泳池别墅住宿",
    "villa.checkIn": "入住日期",
    "villa.checkOut": "退房日期",
    "villa.selectDate": "选择日期",
    "villa.weekday": "平日(周日-周四)",
    "villa.friday": "周五",
    "villa.saturday": "周六",
    "villa.holiday": "节假日",
    "villa.priceNote": "* 价格可能因别墅大小和条件而有所不同。",
    "villa.estimatedPrice": "预估价格",
    "villa.nightsTotal": "晚 总计",
    "villa.viewMore": "查看更多别墅照片",
    
    // Vehicle Section
    "vehicle.title": "私人车辆（按日选择）",
    "vehicle.viewMore": "查看更多车辆照片",
    "vehicle.info": "车辆服务信息",
    "vehicle.included": "[包含]",
    "vehicle.includedItems": "司机、燃油费、过路费及小费|等候费、夜间附加费",
    "vehicle.notIncluded": "[不包含]",
    "vehicle.notIncludedItems": "个人旅行保险",
    "vehicle.date": "日期",
    "vehicle.type": "车辆类型",
    "vehicle.route": "路线",
    "vehicle.addDay": "添加用车日",
    "vehicle.estimatedPrice": "预估价格",
    "vehicle.select": "选择",
    
    // Vehicle Types
    "vehicle.7_seater": "7座SUV",
    "vehicle.16_seater": "16座面包车",
    "vehicle.9_limo": "9座豪华轿车",
    "vehicle.9_lux_limo": "9座奢华轿车",
    "vehicle.12_lux_limo": "12座奢华轿车",
    "vehicle.16_lux_limo": "16座奢华轿车",
    "vehicle.29_seater": "29座巴士",
    "vehicle.45_seater": "45座巴士",
    
    // Routes
    "route.city": "头顿市内观光",
    "route.oneway": "胡志明市 ↔ 头顿（单程）",
    "route.hocham_oneway": "胡志明市 ↔ 胡襄（单程）",
    "route.phanthiet_oneway": "胡志明市 ↔ 潘切（单程）",
    "route.roundtrip": "胡志明市 ↔ 头顿（往返）",
    "route.city_pickup_drop": "胡志明市接送 + 头顿市内",
    
    // Golf Section
    "golf.title": "高尔夫球场",
    "golf.viewMore": "查看高尔夫球场信息",
    "golf.info": "高尔夫服务信息",
    "golf.included": "[包含]",
    "golf.includedItems": "果岭费、球童费、球车费|更衣室和淋浴设施",
    "golf.notIncluded": "[不包含]",
    "golf.notIncludedItems": "球童小费（建议每人$15-20）|餐饮",
    "golf.date": "日期",
    "golf.course": "高尔夫球场",
    "golf.courseSelect": "选择高尔夫球场",
    "golf.players": "人数",
    "golf.addDay": "添加高尔夫日程",
    "golf.person": "人",
    
    // Golf Courses
    "golf.paradise": "天堂CC",
    "golf.twin_doves": "双鸽GC",
    "golf.sonadezi": "Sonadezi CC",
    "golf.the_bluffs": "悬崖GC",
    "golf.jw_marriott": "JW万豪GC",
    "golf.mamason": "Mamason GC",
    
    // Eco Girl Section
    "ecoGirl.title": "Eco Girl服务",
    "ecoGirl.viewMore": "查看Eco Girl信息",
    "ecoGirl.count": "人数",
    "ecoGirl.nights": "住宿天数",
    "ecoGirl.info": "Eco Girl服务信息",
    "ecoGirl.infoText": "每人每晚价格。请选择人数和天数。",
    "ecoGirl.person": "人",
    "ecoGirl.night": "晚",
    
    // Guide Section
    "guide.title": "韩语导游",
    "guide.viewMore": "查看导游信息",
    "guide.days": "导游天数",
    "guide.groupSize": "团队人数",
    "guide.info": "导游服务信息",
    "guide.infoText": "每人价格因团队人数而异。",
    "guide.estimatedPrice": "预估价格",
    "guide.baseRate": "基本费用（4人以内）",
    "guide.perDay": "天",
    "guide.extraCharge": "额外人数",
    "guide.daysTotal": "天 总计",
    "guide.day": "天",
    "guide.person": "人",
    
    // Quote Summary
    "quote.title": "预估报价",
    "common.exchangeRate": "当前汇率",
    "quote.villa": "泳池别墅住宿",
    "quote.vehicle": "车辆服务",
    "quote.golf": "高尔夫球场",
    "quote.ecoGirl": "Eco导游",
    "quote.guide": "韩语导游",
    "quote.note": "实际价格可能因当地情况而有所不同。",
    "quote.actualLower": "实际报价低于预估金额。",
    "quote.save": "保存报价",
    "quote.ready": "准备好了吗？",
    "quote.readyDesc": "调整左侧选项，实时查看您的定制旅行报价。",
    "quote.calculating": "正在计算报价...",
    
    // Contact Section
    "contact.title": "联系我们",
    "contact.vietnam": "越南",
    "contact.korea": "韩国",
    "contact.kakao": "KakaoTalk",
    "contact.blog": "博客",
    
    // Dialog
    "dialog.customerName": "客户姓名",
    "dialog.saveQuote": "保存报价",
    "dialog.cancel": "取消",
    "dialog.save": "保存",
    "dialog.enterName": "请输入客户姓名",
    
    // Language
    "language.select": "选择语言",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- 7座SUV（推荐2-3人）|• 最多4人+4个行李箱|• 带高尔夫球包：最多3人（3个球包+3个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.16_seater": "- 16座面包车（推荐4-6人，最多8人）|• 6人（6个球包+6个行李箱）|• 9人（9个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.9_limo": "- 9座面包车（推荐4-6人，最多6人）|• 4人（4个球包+4个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.9_lux_limo": "- 9座豪华轿车（推荐4-6人，最多6人）|• VIP内饰，舒适座椅|• 4人（4个球包+4个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.12_lux_limo": "- 12座VIP豪华车（推荐6-8人，最多8人）|• 6人（6个球包+6个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.16_lux_limo": "- 16座面包车（推荐10人以上，最多16人）|• 16人（16个球包+16个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.29_seater": "- 29座巴士（推荐10人以上，最多25人）|• 15人（15个球包+15个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    "vehicle.desc.45_seater": "- 45座巴士（推荐20人以上，最多40人）|• 20人（20个球包+20个行李箱）|• 按您要求的地点接送|• 含司机，无额外费用（延误、等待、夜间）",
    
    // Golf Info
    "golf.info.included": "* 包含：果岭费、球车费（2人1车）、球童费",
    "golf.info.notIncluded": "* 不包含（现场支付）：球童小费（天堂40万越南盾/쩌우득·胡襄50万越南盾）",
    "golf.info.weekend": "* 周末价格适用：周六、周日",
    "golf.estimatedPrice": "预估价格",
    "golf.caddyTipNote": "* 球童小费另计（天堂：40万越南盾/人，丑德/胡济：50万越南盾/人）",
    "golf.course.paradise": "天堂",
    "golf.course.chouduc": "丑德",
    "golf.course.hocham": "胡济",
    "golf.course.paradise_price": "天堂（平日$90/周末$110）",
    "golf.course.chouduc_price": "쩌우득（平日$80/周末$120）",
    "golf.course.hocham_price": "胡襄（平日$150/周末$200）",
    
    // Footer
    "footer.connect": "连接频道",
    "footer.visit": "访问",
    "footer.terms": "服务条款",
    "footer.privacy": "隐私政策",
    
    // File name
    "file.quoteName": "头顿_Dokkaebi_报价",
    
    // Toast messages
    "toast.saved": "已保存",
    "toast.savedDesc": "报价已成功保存",
    "toast.error": "错误",
    "toast.errorDesc": "出现问题，请重试",
    
    // Travel Planner
    "nav.planner": "AI旅行规划",
    "nav.chat": "聊天室",
    "nav.board": "头顿资讯",
    "nav.diet": "购物",
    "planner.title": "AI旅行规划师",
    "planner.subtitle": "选择您的旅行目的和日期，AI将为您创建完美的行程",
    "planner.purpose": "旅行目的",
    "planner.purpose.gourmet": "美食之旅",
    "planner.purpose.relaxing": "休闲度假",
    "planner.purpose.golf": "高尔夫之旅",
    "planner.purpose.adventure": "探险之旅",
    "planner.purpose.culture": "文化历史",
    "planner.purpose.family": "家庭旅行",
    "planner.purpose.nightlife": "精彩夜生活",
    "planner.purpose.casino": "赌场",
    "planner.startDate": "开始日期",
    "planner.endDate": "结束日期",
    "planner.generate": "生成行程",
    "planner.generating": "AI正在生成行程...",
    "planner.day": "第",
    "planner.tips": "旅行贴士",
    "planner.regenerate": "重新生成",
    "planner.selectPurpose": "选择旅行目的",
    "planner.selectDates": "选择旅行日期",
  },
  
  vi: {
    // Header
    "header.title": "Vũng Tàu Dokkaebi",
    "header.subtitle": "Báo giá du lịch",
    "header.description": "Kiểm tra báo giá du lịch tùy chỉnh của bạn cho biệt thự, xe và dịch vụ hướng dẫn theo thời gian thực.",
    
    // Navigation
    "nav.calculator": "Báo giá",
    "nav.guide": "Du lịch",
    "nav.expenses": "Chi tiêu",
    "nav.nearby": "Gần đây",
    
    // Nearby Places
    "nearby.title": "Địa điểm gần đây",
    "nearby.subtitle": "Tìm nhà hàng, quán cà phê và tiện ích gần vị trí của bạn",
    "nearby.loading": "Đang tải vị trí...",
    "nearby.error": "Không thể tải địa điểm gần đây",
    "nearby.noResults": "Không tìm thấy địa điểm gần đây",
    "nearby.locationError": "Không thể lấy vị trí của bạn.",
    "nearby.noGeolocation": "Trình duyệt này không hỗ trợ định vị.",
    "nearby.usingDefault": "Tìm kiếm từ trung tâm Vũng Tàu.",
    "nearby.open": "Mở cửa",
    "nearby.closed": "Đã đóng",
    "nearby.reviews": "đánh giá",
    "nearby.recentReviews": "Đánh giá gần đây",
    "nearby.openMaps": "Mở trong Bản đồ",
    "nearby.category.restaurant": "Nhà hàng",
    "nearby.category.cafe": "Cà phê",
    "nearby.category.pharmacy": "Nhà thuốc",
    "nearby.category.atm": "ATM",
    "nearby.category.convenience_store": "Cửa hàng",
    "nearby.category.hospital": "Bệnh viện",
    "nearby.category.gas_station": "Trạm xăng",
    "nearby.category.hair_care": "Tiệm tóc",
    "nearby.category.lodging": "Chỗ ở",
    
    // Villa Section
    "villa.title": "Biệt thự hồ bơi sang trọng",
    "villa.checkIn": "Ngày nhận phòng",
    "villa.checkOut": "Ngày trả phòng",
    "villa.selectDate": "Chọn ngày",
    "villa.weekday": "Ngày thường (CN-T5)",
    "villa.friday": "Thứ Sáu",
    "villa.saturday": "Thứ Bảy",
    "villa.holiday": "Ngày lễ",
    "villa.priceNote": "* Giá có thể thay đổi tùy theo kích thước và tình trạng biệt thự.",
    "villa.estimatedPrice": "Giá ước tính",
    "villa.nightsTotal": " đêm tổng cộng",
    "villa.viewMore": "Xem thêm ảnh biệt thự",
    
    // Vehicle Section
    "vehicle.title": "Xe riêng (Chọn theo ngày)",
    "vehicle.viewMore": "Xem thêm ảnh xe",
    "vehicle.info": "Thông tin dịch vụ xe",
    "vehicle.included": "[Bao gồm]",
    "vehicle.includedItems": "Tài xế, nhiên liệu, phí cầu đường và tiền tip|Phí chờ đợi, phụ phí đêm",
    "vehicle.notIncluded": "[Không bao gồm]",
    "vehicle.notIncludedItems": "Bảo hiểm du lịch cá nhân",
    "vehicle.date": "Ngày",
    "vehicle.type": "Loại xe",
    "vehicle.route": "Lộ trình",
    "vehicle.addDay": "Thêm ngày sử dụng xe",
    "vehicle.estimatedPrice": "Giá ước tính",
    "vehicle.select": "Chọn",
    
    // Vehicle Types
    "vehicle.7_seater": "SUV 7 chỗ",
    "vehicle.16_seater": "Xe van 16 chỗ",
    "vehicle.9_limo": "Limousine 9 chỗ",
    "vehicle.9_lux_limo": "Limousine cao cấp 9 chỗ",
    "vehicle.12_lux_limo": "Limousine cao cấp 12 chỗ",
    "vehicle.16_lux_limo": "Limousine cao cấp 16 chỗ",
    "vehicle.29_seater": "Xe buýt 29 chỗ",
    "vehicle.45_seater": "Xe buýt 45 chỗ",
    
    // Routes
    "route.city": "Tham quan TP Vũng Tàu",
    "route.oneway": "TP.HCM ↔ Vũng Tàu (Một chiều)",
    "route.hocham_oneway": "TP.HCM ↔ Hồ Tràm (Một chiều)",
    "route.phanthiet_oneway": "TP.HCM ↔ Phan Thiết (Một chiều)",
    "route.roundtrip": "TP.HCM ↔ Vũng Tàu (Khứ hồi)",
    "route.city_pickup_drop": "Đón/trả HCM + Nội thành Vũng Tàu",
    
    // Golf Section
    "golf.title": "Chơi golf",
    "golf.viewMore": "Xem thông tin sân golf",
    "golf.info": "Thông tin dịch vụ golf",
    "golf.included": "[Bao gồm]",
    "golf.includedItems": "Phí green, phí caddy, phí xe điện|Tủ đồ và phòng tắm",
    "golf.notIncluded": "[Không bao gồm]",
    "golf.notIncludedItems": "Tiền tip caddy (khuyến nghị $15-20/người)|Ăn uống",
    "golf.date": "Ngày",
    "golf.course": "Sân golf",
    "golf.courseSelect": "Chọn sân golf",
    "golf.players": "Số người",
    "golf.addDay": "Thêm lịch golf",
    "golf.person": "người",
    
    // Golf Courses
    "golf.paradise": "Paradise CC",
    "golf.twin_doves": "Twin Doves GC",
    "golf.sonadezi": "Sonadezi CC",
    "golf.the_bluffs": "The Bluffs GC",
    "golf.jw_marriott": "JW Marriott GC",
    "golf.mamason": "Mamason GC",
    
    // Eco Girl Section
    "ecoGirl.title": "Dịch vụ Eco Girl",
    "ecoGirl.viewMore": "Xem thông tin Eco Girl",
    "ecoGirl.count": "Số người",
    "ecoGirl.nights": "Số đêm",
    "ecoGirl.info": "Thông tin dịch vụ Eco Girl",
    "ecoGirl.infoText": "Giá mỗi người mỗi đêm. Chọn số người và số đêm.",
    "ecoGirl.person": "người",
    "ecoGirl.night": "đêm",
    
    // Guide Section
    "guide.title": "Hướng dẫn viên tiếng Hàn",
    "guide.viewMore": "Xem thông tin hướng dẫn viên",
    "guide.days": "Số ngày",
    "guide.groupSize": "Số người trong đoàn",
    "guide.info": "Thông tin dịch vụ hướng dẫn",
    "guide.infoText": "Giá mỗi người thay đổi theo số lượng đoàn.",
    "guide.estimatedPrice": "Giá ước tính",
    "guide.baseRate": "Phí cơ bản (tối đa 4 người)",
    "guide.perDay": "ngày",
    "guide.extraCharge": "Phí thêm",
    "guide.daysTotal": " ngày tổng cộng",
    "guide.day": "ngày",
    "guide.person": "người",
    
    // Quote Summary
    "quote.title": "Báo giá ước tính",
    "common.exchangeRate": "Tỷ giá hiện tại",
    "quote.villa": "Biệt thự hồ bơi",
    "quote.vehicle": "Dịch vụ xe",
    "quote.golf": "Chơi golf",
    "quote.ecoGirl": "Hướng dẫn Eco",
    "quote.guide": "Hướng dẫn tiếng Hàn",
    "quote.note": "Giá thực tế có thể thay đổi tùy theo điều kiện địa phương.",
    "quote.actualLower": "Báo giá thực tế thấp hơn ước tính.",
    "quote.save": "Lưu báo giá",
    "quote.ready": "Bạn đã sẵn sàng?",
    "quote.readyDesc": "Điều chỉnh các tùy chọn bên trái để xem báo giá du lịch tùy chỉnh theo thời gian thực.",
    "quote.calculating": "Đang tính báo giá...",
    
    // Contact Section
    "contact.title": "Liên hệ",
    "contact.vietnam": "Việt Nam",
    "contact.korea": "Hàn Quốc",
    "contact.kakao": "KakaoTalk",
    "contact.blog": "Blog",
    
    // Dialog
    "dialog.customerName": "Tên khách hàng",
    "dialog.saveQuote": "Lưu báo giá",
    "dialog.cancel": "Hủy",
    "dialog.save": "Lưu",
    "dialog.enterName": "Nhập tên khách hàng",
    
    // Language
    "language.select": "Chọn ngôn ngữ",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- SUV 7 chỗ (Khuyến nghị 2-3 người)|• Tối đa 4 hành khách + 4 vali|• Có túi golf: tối đa 3 người (3 túi golf + 3 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.16_seater": "- Xe van 16 chỗ (Khuyến nghị 4-6 người, tối đa 8)|• 6 người (6 túi golf + 6 vali)|• 9 người (9 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.9_limo": "- Xe van 9 chỗ (Khuyến nghị 4-6 người, tối đa 6)|• 4 người (4 túi golf + 4 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.9_lux_limo": "- Limousine sang trọng 9 chỗ (Khuyến nghị 4-6 người, tối đa 6)|• Nội thất VIP, ghế thoải mái|• 4 người (4 túi golf + 4 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.12_lux_limo": "- Limousine VIP 12 chỗ (Khuyến nghị 6-8 người, tối đa 8)|• 6 người (6 túi golf + 6 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.16_lux_limo": "- Xe van 16 chỗ (Khuyến nghị 10+ người, tối đa 16)|• 16 người (16 túi golf + 16 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.29_seater": "- Xe buýt 29 chỗ (Khuyến nghị 10+ người, tối đa 25)|• 15 người (15 túi golf + 15 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    "vehicle.desc.45_seater": "- Xe buýt 45 chỗ (Khuyến nghị 20+ người, tối đa 40)|• 20 người (20 túi golf + 20 vali)|• Đón/trả tại địa điểm yêu cầu|• Bao gồm tài xế, không phụ thu (chậm trễ, chờ đợi, đêm)",
    
    // Golf Info
    "golf.info.included": "* Bao gồm: Phí green, phí xe điện (2 người/xe), phí caddy",
    "golf.info.notIncluded": "* Không bao gồm (trả tại chỗ): Tiền tip caddy (Paradise 400k VND / Chouduc/Ho Tram 500k VND)",
    "golf.info.weekend": "* Giá cuối tuần áp dụng: Thứ Bảy, Chủ Nhật",
    "golf.estimatedPrice": "Giá ước tính",
    "golf.caddyTipNote": "* Tiền tip caddy chưa bao gồm (Paradise: 400K VND/người, Chouduc/Ho Tram: 500K VND/người)",
    "golf.course.paradise": "Paradise",
    "golf.course.chouduc": "Chouduc",
    "golf.course.hocham": "Ho Tram",
    "golf.course.paradise_price": "Paradise (Ngày thường $90 / Cuối tuần $110)",
    "golf.course.chouduc_price": "Chouduc (Ngày thường $80 / Cuối tuần $120)",
    "golf.course.hocham_price": "Ho Tram (Ngày thường $150 / Cuối tuần $200)",
    
    // Footer
    "footer.connect": "Kết nối kênh",
    "footer.visit": "Truy cập",
    "footer.terms": "Điều khoản dịch vụ",
    "footer.privacy": "Chính sách bảo mật",
    
    // File name
    "file.quoteName": "VungTau_Dokkaebi_BaoGia",
    
    // Toast messages
    "toast.saved": "Đã lưu",
    "toast.savedDesc": "Báo giá của bạn đã được lưu thành công",
    "toast.error": "Lỗi",
    "toast.errorDesc": "Có lỗi xảy ra. Vui lòng thử lại",
    
    // Travel Planner
    "nav.planner": "AI Lập kế hoạch",
    "nav.chat": "Phòng chat",
    "nav.board": "Tin Vũng Tàu",
    "nav.diet": "Mua sắm",
    "planner.title": "AI Lập Kế Hoạch Du Lịch",
    "planner.subtitle": "Chọn mục đích và ngày du lịch, AI sẽ tạo lịch trình hoàn hảo cho bạn",
    "planner.purpose": "Mục đích du lịch",
    "planner.purpose.gourmet": "Du lịch ẩm thực",
    "planner.purpose.relaxing": "Nghỉ dưỡng thư giãn",
    "planner.purpose.golf": "Du lịch golf",
    "planner.purpose.adventure": "Khám phá phiêu lưu",
    "planner.purpose.culture": "Văn hóa lịch sử",
    "planner.purpose.family": "Du lịch gia đình",
    "planner.purpose.nightlife": "Cuộc sống về đêm sôi động",
    "planner.purpose.casino": "Casino",
    "planner.startDate": "Ngày bắt đầu",
    "planner.endDate": "Ngày kết thúc",
    "planner.generate": "Tạo lịch trình",
    "planner.generating": "AI đang tạo kế hoạch...",
    "planner.day": "Ngày",
    "planner.tips": "Mẹo du lịch",
    "planner.regenerate": "Tạo lại",
    "planner.selectPurpose": "Chọn mục đích du lịch",
    "planner.selectDates": "Chọn ngày du lịch",
  },
  
  ru: {
    // Header
    "header.title": "Вунгтау Доккаэби",
    "header.subtitle": "Расчет стоимости",
    "header.description": "Проверьте расчет стоимости вашего индивидуального тура: виллы, транспорт и услуги гида в реальном времени.",
    
    // Navigation
    "nav.calculator": "Калькулятор",
    "nav.guide": "Гид",
    "nav.expenses": "Расходы",
    "nav.nearby": "Рядом",
    
    // Nearby Places
    "nearby.title": "Места рядом",
    "nearby.subtitle": "Найдите рестораны, кафе и удобства рядом с вами",
    "nearby.loading": "Загрузка местоположения...",
    "nearby.error": "Не удалось загрузить места",
    "nearby.noResults": "Мест поблизости не найдено",
    "nearby.locationError": "Не удалось определить местоположение.",
    "nearby.noGeolocation": "Этот браузер не поддерживает геолокацию.",
    "nearby.usingDefault": "Поиск от центра Вунгтау.",
    "nearby.open": "Открыто",
    "nearby.closed": "Закрыто",
    "nearby.reviews": "отзывов",
    "nearby.recentReviews": "Недавние отзывы",
    "nearby.openMaps": "Открыть на карте",
    "nearby.category.restaurant": "Ресторан",
    "nearby.category.cafe": "Кафе",
    "nearby.category.pharmacy": "Аптека",
    "nearby.category.atm": "Банкомат",
    "nearby.category.convenience_store": "Магазин",
    "nearby.category.hospital": "Больница",
    "nearby.category.gas_station": "АЗС",
    "nearby.category.hair_care": "Парикмахерская",
    "nearby.category.lodging": "Жильё",
    
    // Villa Section
    "villa.title": "Люксовая вилла с бассейном",
    "villa.checkIn": "Дата заезда",
    "villa.checkOut": "Дата выезда",
    "villa.selectDate": "Выберите дату",
    "villa.weekday": "Будни (Вс-Чт)",
    "villa.friday": "Пятница",
    "villa.saturday": "Суббота",
    "villa.holiday": "Праздник",
    "villa.priceNote": "* Цены могут меняться в зависимости от размера и состояния виллы.",
    "villa.estimatedPrice": "Расчётная цена",
    "villa.nightsTotal": " ночей всего",
    "villa.viewMore": "Больше фото виллы",
    
    // Vehicle Section
    "vehicle.title": "Частный транспорт (по дням)",
    "vehicle.viewMore": "Больше фото транспорта",
    "vehicle.info": "Информация о транспорте",
    "vehicle.included": "[Включено]",
    "vehicle.includedItems": "Водитель, топливо, дорожные сборы и чаевые|Плата за ожидание, ночная надбавка",
    "vehicle.notIncluded": "[Не включено]",
    "vehicle.notIncludedItems": "Индивидуальная туристическая страховка",
    "vehicle.date": "Дата",
    "vehicle.type": "Тип транспорта",
    "vehicle.route": "Маршрут",
    "vehicle.addDay": "Добавить день",
    "vehicle.estimatedPrice": "Ориентировочная цена",
    "vehicle.select": "Выбрать",
    
    // Vehicle Types
    "vehicle.7_seater": "7-местный внедорожник",
    "vehicle.16_seater": "16-местный микроавтобус",
    "vehicle.9_limo": "9-местный лимузин",
    "vehicle.9_lux_limo": "9-местный люкс лимузин",
    "vehicle.12_lux_limo": "12-местный люкс лимузин",
    "vehicle.16_lux_limo": "16-местный люкс лимузин",
    "vehicle.29_seater": "29-местный автобус",
    "vehicle.45_seater": "45-местный автобус",
    
    // Routes
    "route.city": "Экскурсия по Вунгтау",
    "route.oneway": "Хошимин ↔ Вунгтау (в одну сторону)",
    "route.hocham_oneway": "Хошимин ↔ Хо Трам (в одну сторону)",
    "route.phanthiet_oneway": "Хошимин ↔ Фантьет (в одну сторону)",
    "route.roundtrip": "Хошимин ↔ Вунгтау (туда-обратно)",
    "route.city_pickup_drop": "Трансфер Хошимин + город Вунгтау",
    
    // Golf Section
    "golf.title": "Гольф",
    "golf.viewMore": "Информация о гольф-поле",
    "golf.info": "Информация о гольф-услугах",
    "golf.included": "[Включено]",
    "golf.includedItems": "Грин-фи, кэдди, гольф-кар|Раздевалка и душ",
    "golf.notIncluded": "[Не включено]",
    "golf.notIncludedItems": "Чаевые кэдди (рекомендуется $15-20 на человека)|Питание и напитки",
    "golf.date": "Дата",
    "golf.course": "Гольф-поле",
    "golf.courseSelect": "Выберите гольф-поле",
    "golf.players": "Игроков",
    "golf.addDay": "Добавить день гольфа",
    "golf.person": "чел.",
    
    // Golf Courses
    "golf.paradise": "Paradise CC",
    "golf.twin_doves": "Twin Doves GC",
    "golf.sonadezi": "Sonadezi CC",
    "golf.the_bluffs": "The Bluffs GC",
    "golf.jw_marriott": "JW Marriott GC",
    "golf.mamason": "Mamason GC",
    
    // Eco Girl Section
    "ecoGirl.title": "Услуга Eco Girl",
    "ecoGirl.viewMore": "Информация об Eco Girl",
    "ecoGirl.count": "Количество человек",
    "ecoGirl.nights": "Количество ночей",
    "ecoGirl.info": "Информация об услуге Eco Girl",
    "ecoGirl.infoText": "Цена за человека за ночь. Выберите количество человек и ночей.",
    "ecoGirl.person": "чел.",
    "ecoGirl.night": "ночей",
    
    // Guide Section
    "guide.title": "Корейский гид",
    "guide.viewMore": "Информация о гиде",
    "guide.days": "Количество дней",
    "guide.groupSize": "Размер группы",
    "guide.info": "Информация об услуге гида",
    "guide.infoText": "Цена за человека зависит от размера группы.",
    "guide.estimatedPrice": "Расчётная цена",
    "guide.baseRate": "Базовая ставка (до 4 чел.)",
    "guide.perDay": "день",
    "guide.extraCharge": "Доплата",
    "guide.daysTotal": " дней всего",
    "guide.day": "дней",
    "guide.person": "чел.",
    
    // Quote Summary
    "quote.title": "Ориентировочная стоимость",
    "common.exchangeRate": "Текущий курс",
    "quote.villa": "Вилла с бассейном",
    "quote.vehicle": "Транспортные услуги",
    "quote.golf": "Гольф",
    "quote.ecoGirl": "Eco гид",
    "quote.guide": "Корейский гид",
    "quote.note": "Фактические цены могут отличаться в зависимости от местных условий.",
    "quote.actualLower": "Фактическая стоимость ниже расчётной.",
    "quote.save": "Сохранить расчет",
    "quote.ready": "Готовы начать?",
    "quote.readyDesc": "Настройте параметры слева, чтобы увидеть расчет стоимости в реальном времени.",
    "quote.calculating": "Расчет стоимости...",
    
    // Contact Section
    "contact.title": "Связаться с нами",
    "contact.vietnam": "Вьетнам",
    "contact.korea": "Корея",
    "contact.kakao": "KakaoTalk",
    "contact.blog": "Блог",
    
    // Dialog
    "dialog.customerName": "Имя клиента",
    "dialog.saveQuote": "Сохранить расчет",
    "dialog.cancel": "Отмена",
    "dialog.save": "Сохранить",
    "dialog.enterName": "Введите имя клиента",
    
    // Language
    "language.select": "Выберите язык",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- 7-местный внедорожник (Рекомендуется для 2-3 чел.)|• Макс. 4 пассажира + 4 чемодана|• С сумками для гольфа: макс. 3 чел. (3 сумки + 3 чемодана)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.16_seater": "- 16-местный микроавтобус (Рекомендуется для 4-6 чел., макс. 8)|• 6 чел. (6 сумок для гольфа + 6 чемоданов)|• 9 чел. (9 чемоданов)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.9_limo": "- 9-местный микроавтобус (Рекомендуется для 4-6 чел., макс. 6)|• 4 чел. (4 сумки для гольфа + 4 чемодана)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.9_lux_limo": "- 9-местный люкс-лимузин (Рекомендуется для 4-6 чел., макс. 6)|• VIP интерьер, комфортные сиденья|• 4 чел. (4 сумки для гольфа + 4 чемодана)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.12_lux_limo": "- 12-местный VIP лимузин (Рекомендуется для 6-8 чел., макс. 8)|• 6 чел. (6 сумок для гольфа + 6 чемоданов)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.16_lux_limo": "- 16-местный микроавтобус (Рекомендуется для 10+ чел., макс. 16)|• 16 чел. (16 сумок для гольфа + 16 чемоданов)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.29_seater": "- 29-местный автобус (Рекомендуется для 10+ чел., макс. 25)|• 15 чел. (15 сумок для гольфа + 15 чемоданов)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    "vehicle.desc.45_seater": "- 45-местный автобус (Рекомендуется для 20+ чел., макс. 40)|• 20 чел. (20 сумок для гольфа + 20 чемоданов)|• Трансфер по вашему адресу|• Водитель включён, без доплат (задержки, ожидание, ночь)",
    
    // Golf Info
    "golf.info.included": "* Включено: Грин-фи, плата за гольф-кар (2 чел./кар), плата за кэдди",
    "golf.info.notIncluded": "* Не включено (оплата на месте): Чаевые кэдди (Paradise 400 тыс. VND / Chouduc/Ho Tram 500 тыс. VND)",
    "golf.info.weekend": "* Тариф выходного дня: Суббота, Воскресенье",
    "golf.estimatedPrice": "Расчётная цена",
    "golf.caddyTipNote": "* Чаевые кэдди не включены (Парадайз: 400К VND/чел., Чоудук/Хо Трам: 500К VND/чел.)",
    "golf.course.paradise": "Парадайз",
    "golf.course.chouduc": "Чоудук",
    "golf.course.hocham": "Хо Трам",
    "golf.course.paradise_price": "Paradise (Будни $90 / Выходные $110)",
    "golf.course.chouduc_price": "Chouduc (Будни $80 / Выходные $120)",
    "golf.course.hocham_price": "Ho Tram (Будни $150 / Выходные $200)",
    
    // Footer
    "footer.connect": "Подключить канал",
    "footer.visit": "Посетить",
    "footer.terms": "Условия использования",
    "footer.privacy": "Политика конфиденциальности",
    
    // File name
    "file.quoteName": "VungTau_Dokkaebi_Расчёт",
    
    // Toast messages
    "toast.saved": "Сохранено",
    "toast.savedDesc": "Ваш расчёт успешно сохранён",
    "toast.error": "Ошибка",
    "toast.errorDesc": "Произошла ошибка. Попробуйте ещё раз",
    
    // Travel Planner
    "nav.planner": "AI Планировщик",
    "nav.chat": "Чат",
    "nav.board": "Новости Вунгтау",
    "nav.diet": "Магазин",
    "planner.title": "AI Планировщик путешествий",
    "planner.subtitle": "Выберите цель и даты путешествия, AI создаст идеальный маршрут",
    "planner.purpose": "Цель путешествия",
    "planner.purpose.gourmet": "Гастрономический тур",
    "planner.purpose.relaxing": "Спокойный отдых",
    "planner.purpose.golf": "Гольф-тур",
    "planner.purpose.adventure": "Приключения",
    "planner.purpose.culture": "Культура и история",
    "planner.purpose.family": "Семейный отдых",
    "planner.purpose.nightlife": "Яркая ночная жизнь",
    "planner.purpose.casino": "Казино",
    "planner.startDate": "Дата начала",
    "planner.endDate": "Дата окончания",
    "planner.generate": "Создать маршрут",
    "planner.generating": "AI создаёт план...",
    "planner.day": "День",
    "planner.tips": "Советы",
    "planner.regenerate": "Создать заново",
    "planner.selectPurpose": "Выберите цель путешествия",
    "planner.selectDates": "Выберите даты путешествия",
  },
  
  ja: {
    // Header
    "header.title": "ブンタウ ドッケビ",
    "header.subtitle": "旅行見積",
    "header.description": "プールヴィラ、車両、ガイドサービスなど、オーダーメイド旅行の見積をリアルタイムで確認できます。",
    
    // Navigation
    "nav.calculator": "見積計算機",
    "nav.guide": "観光ガイド",
    "nav.expenses": "旅費管理",
    "nav.nearby": "周辺",
    
    // Nearby Places
    "nearby.title": "周辺スポット",
    "nearby.subtitle": "現在地周辺のレストラン、カフェ、施設を検索",
    "nearby.loading": "位置情報を読み込み中...",
    "nearby.error": "周辺スポットの読み込みに失敗しました",
    "nearby.noResults": "周辺にスポットが見つかりません",
    "nearby.locationError": "位置情報を取得できません。",
    "nearby.noGeolocation": "このブラウザは位置情報をサポートしていません。",
    "nearby.usingDefault": "ブンタウ中心から検索します。",
    "nearby.open": "営業中",
    "nearby.closed": "閉店",
    "nearby.reviews": "件のレビュー",
    "nearby.recentReviews": "最近のレビュー",
    "nearby.openMaps": "地図で開く",
    "nearby.category.restaurant": "レストラン",
    "nearby.category.cafe": "カフェ",
    "nearby.category.pharmacy": "薬局",
    "nearby.category.atm": "ATM",
    "nearby.category.convenience_store": "コンビニ",
    "nearby.category.hospital": "病院",
    "nearby.category.gas_station": "ガソリンスタンド",
    "nearby.category.hair_care": "美容室",
    "nearby.category.lodging": "宿泊",
    
    // Villa Section
    "villa.title": "ラグジュアリープールヴィラ宿泊",
    "villa.checkIn": "チェックイン日",
    "villa.checkOut": "チェックアウト日",
    "villa.selectDate": "日付選択",
    "villa.weekday": "平日（日～木）",
    "villa.friday": "金曜日",
    "villa.saturday": "土曜日",
    "villa.holiday": "祝日",
    "villa.priceNote": "※ヴィラの広さやコンディションにより価格が変動する場合があります。",
    "villa.estimatedPrice": "見積もり金額",
    "villa.nightsTotal": "泊分の合計金額です",
    "villa.viewMore": "ヴィラ写真をもっと見る",
    
    // Vehicle Section
    "vehicle.title": "プライベート車両（日別選択）",
    "vehicle.viewMore": "車両写真をもっと見る",
    "vehicle.info": "車両サービス情報",
    "vehicle.included": "【含まれるもの】",
    "vehicle.includedItems": "ドライバー、燃料費、通行料、チップ|待機料、夜間割増",
    "vehicle.notIncluded": "【含まれないもの】",
    "vehicle.notIncludedItems": "個人旅行保険",
    "vehicle.date": "日付",
    "vehicle.type": "車種",
    "vehicle.route": "ルート",
    "vehicle.addDay": "車両利用日を追加",
    "vehicle.estimatedPrice": "予想料金",
    "vehicle.select": "選択",
    
    // Vehicle Types
    "vehicle.7_seater": "7人乗りSUV",
    "vehicle.16_seater": "16人乗りバン",
    "vehicle.9_limo": "9人乗りリムジン",
    "vehicle.9_lux_limo": "9人乗りラグジュアリーリムジン",
    "vehicle.12_lux_limo": "12人乗りラグジュアリーリムジン",
    "vehicle.16_lux_limo": "16人乗りラグジュアリーリムジン",
    "vehicle.29_seater": "29人乗りバス",
    "vehicle.45_seater": "45人乗りバス",
    
    // Routes
    "route.city": "ブンタウ市内観光",
    "route.oneway": "ホーチミン ↔ ブンタウ（片道）",
    "route.hocham_oneway": "ホーチミン ↔ ホーチャム（片道）",
    "route.phanthiet_oneway": "ホーチミン ↔ ファンティエット（片道）",
    "route.roundtrip": "ホーチミン ↔ ブンタウ（往復）",
    "route.city_pickup_drop": "ホーチミン送迎 + ブンタウ市内",
    
    // Golf Section
    "golf.title": "ゴルフラウンド",
    "golf.viewMore": "ゴルフ場情報を見る",
    "golf.info": "ゴルフサービス情報",
    "golf.included": "【含まれるもの】",
    "golf.includedItems": "グリーンフィー、キャディフィー、カート代|ロッカー、シャワー施設",
    "golf.notIncluded": "【含まれないもの】",
    "golf.notIncludedItems": "キャディチップ（1人$15〜20推奨）|食事・飲料",
    "golf.date": "日付",
    "golf.course": "ゴルフ場",
    "golf.courseSelect": "ゴルフ場を選択",
    "golf.players": "人数",
    "golf.addDay": "ゴルフ日程を追加",
    "golf.person": "名",
    
    // Golf Courses
    "golf.paradise": "パラダイスCC",
    "golf.twin_doves": "ツインドーブスGC",
    "golf.sonadezi": "ソナデジCC",
    "golf.the_bluffs": "ザ・ブラフスGC",
    "golf.jw_marriott": "JWマリオットGC",
    "golf.mamason": "ママソンGC",
    
    // Eco Girl Section
    "ecoGirl.title": "エコガールサービス",
    "ecoGirl.viewMore": "エコガール情報を見る",
    "ecoGirl.count": "人数",
    "ecoGirl.nights": "宿泊数",
    "ecoGirl.info": "エコガールサービス情報",
    "ecoGirl.infoText": "1泊1名あたりの料金です。人数と泊数を選択してください。",
    "ecoGirl.person": "名",
    "ecoGirl.night": "泊",
    
    // Guide Section
    "guide.title": "韓国語ツアーガイド",
    "guide.viewMore": "ガイド情報を見る",
    "guide.days": "ガイド日数",
    "guide.groupSize": "グループ人数",
    "guide.info": "ガイドサービス情報",
    "guide.infoText": "グループ人数により1人あたりの料金が変わります。",
    "guide.estimatedPrice": "見積もり金額",
    "guide.baseRate": "基本料金（4名まで）",
    "guide.perDay": "日",
    "guide.extraCharge": "追加人数",
    "guide.daysTotal": "日分の合計金額",
    "guide.day": "日",
    "guide.person": "名",
    
    // Quote Summary
    "quote.title": "見積金額",
    "common.exchangeRate": "現在の為替レート",
    "quote.villa": "プールヴィラ宿泊",
    "quote.vehicle": "車両サービス",
    "quote.golf": "ゴルフラウンド",
    "quote.ecoGirl": "エコガイド",
    "quote.guide": "韓国語ガイド",
    "quote.note": "実際の価格は現地の状況により異なる場合があります。",
    "quote.actualLower": "実際の見積金額は予想金額より低くなります。",
    "quote.save": "見積書を保存",
    "quote.ready": "準備はできましたか？",
    "quote.readyDesc": "左のオプションを調整して、カスタマイズした旅行見積をリアルタイムで確認してください。",
    "quote.calculating": "見積を計算中...",
    
    // Contact Section
    "contact.title": "お問い合わせ",
    "contact.vietnam": "ベトナム",
    "contact.korea": "韓国",
    "contact.kakao": "カカオトーク",
    "contact.blog": "ブログ",
    
    // Dialog
    "dialog.customerName": "お客様名",
    "dialog.saveQuote": "見積を保存",
    "dialog.cancel": "キャンセル",
    "dialog.save": "保存",
    "dialog.enterName": "お客様名を入力してください",
    
    // Language
    "language.select": "言語選択",
    
    // Vehicle Descriptions
    "vehicle.desc.7_seater": "- 7人乗りSUV（2-3名推奨）|• 最大4名＋スーツケース4個|• ゴルフバッグあり：最大3名（3バッグ＋3スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.16_seater": "- 16人乗りミニバン（4-6名推奨、最大8名）|• 6名（6ゴルフバッグ＋6スーツケース）|• 9名（9スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.9_limo": "- 9人乗りミニバン（4-6名推奨、最大6名）|• 4名（4ゴルフバッグ＋4スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.9_lux_limo": "- 9人乗りラグジュアリーリムジン（4-6名推奨、最大6名）|• VIPインテリア、快適なシート|• 4名（4ゴルフバッグ＋4スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.12_lux_limo": "- 12人乗りVIPリムジン（6-8名推奨、最大8名）|• 6名（6ゴルフバッグ＋6スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.16_lux_limo": "- 16人乗りミニバン（10名以上推奨、最大16名）|• 16名（16ゴルフバッグ＋16スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.29_seater": "- 29人乗りバス（10名以上推奨、最大25名）|• 15名（15ゴルフバッグ＋15スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    "vehicle.desc.45_seater": "- 45人乗りバス（20名以上推奨、最大40名）|• 20名（20ゴルフバッグ＋20スーツケース）|• ご指定の場所で送迎|• ドライバー込み、追加料金なし（遅延、待機、夜間）",
    
    // Golf Info
    "golf.info.included": "* 含まれるもの：グリーンフィー、カート代（2名1台）、キャディフィー",
    "golf.info.notIncluded": "* 含まれないもの（現地払い）：キャディチップ（Paradise 40万VND / Chouduc/Ho Tram 50万VND）",
    "golf.info.weekend": "* 週末料金適用：土曜日、日曜日",
    "golf.estimatedPrice": "見積もり金額",
    "golf.caddyTipNote": "※キャディチップ別途（パラダイス：40万ドン/人、チョウドゥック/ホーチャム：50万ドン/人）",
    "golf.course.paradise": "パラダイス",
    "golf.course.chouduc": "チョウドゥック",
    "golf.course.hocham": "ホーチャム",
    "golf.course.paradise_price": "パラダイス（平日$90 / 週末$110）",
    "golf.course.chouduc_price": "チョウドゥック（平日$80 / 週末$120）",
    "golf.course.hocham_price": "ホーチャム（平日$150 / 週末$200）",
    
    // Footer
    "footer.connect": "チャンネル接続",
    "footer.visit": "訪問",
    "footer.terms": "利用規約",
    "footer.privacy": "プライバシーポリシー",
    
    // File name
    "file.quoteName": "ブンタウ_ドッケビ_見積書",
    
    // Toast messages
    "toast.saved": "保存完了",
    "toast.savedDesc": "見積書が正常に保存されました",
    "toast.error": "エラー",
    "toast.errorDesc": "問題が発生しました。もう一度お試しください",
    
    // Travel Planner
    "nav.planner": "AI旅行プランナー",
    "nav.chat": "チャットルーム",
    "nav.board": "ブンタウニュース",
    "nav.diet": "ショッピング",
    "planner.title": "AI旅行プランナー",
    "planner.subtitle": "旅行の目的と日程を選ぶと、AIが最適な旅行プランを作成します",
    "planner.purpose": "旅行の目的",
    "planner.purpose.gourmet": "グルメ旅行",
    "planner.purpose.relaxing": "ゆったり癒し旅",
    "planner.purpose.golf": "ゴルフ旅行",
    "planner.purpose.adventure": "観光探検",
    "planner.purpose.culture": "文化・歴史探訪",
    "planner.purpose.family": "家族旅行",
    "planner.purpose.nightlife": "エキサイティングナイトライフ",
    "planner.purpose.casino": "カジノ",
    "planner.startDate": "開始日",
    "planner.endDate": "終了日",
    "planner.generate": "プラン作成",
    "planner.generating": "AIがプランを作成中...",
    "planner.day": "日目",
    "planner.tips": "旅のヒント",
    "planner.regenerate": "再作成",
    "planner.selectPurpose": "旅行の目的を選択してください",
    "planner.selectDates": "旅行日程を選択してください",
  },
};

interface LanguageContextType {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: (key: string) => string;
}

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

export function LanguageProvider({ children }: { children: ReactNode }) {
  const [language, setLanguage] = useState<Language>(() => {
    if (typeof window !== "undefined") {
      const saved = localStorage.getItem("language");
      if (saved && Object.keys(translations).includes(saved)) {
        return saved as Language;
      }
    }
    return "ko";
  });

  const handleSetLanguage = (lang: Language) => {
    setLanguage(lang);
    if (typeof window !== "undefined") {
      localStorage.setItem("language", lang);
    }
  };

  const t = (key: string): string => {
    return translations[language][key] || translations.ko[key] || key;
  };

  return (
    <LanguageContext.Provider value={{ language, setLanguage: handleSetLanguage, t }}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error("useLanguage must be used within a LanguageProvider");
  }
  return context;
}
