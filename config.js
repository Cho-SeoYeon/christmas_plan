// Supabase 연결 정보 (Supabase 대시보드 → Project Settings → API)
// 비워 두면 Supabase 없이 이 기기에만 저장되는 모드로 동작해요.
window.APP_CONFIG = {
  SUPABASE_URL: '',        // 예: 'https://abcdefgh.supabase.co'
  SUPABASE_ANON_KEY: '',   // anon / publishable 키 (공개용 키, service_role 키는 절대 넣지 마세요)
  TRIP_ID: 'xmas-2026'     // 같은 TRIP_ID를 쓰는 사람끼리 일정이 공유돼요
};
