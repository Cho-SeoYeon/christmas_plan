// Supabase 연결 정보 (Supabase 대시보드 → Project Settings → API)
// 비워 두면 Supabase 없이 이 기기에만 저장되는 모드로 동작해요.
window.APP_CONFIG = {
  SUPABASE_URL: 'https://ifakdqgpnrccqwzegswu.supabase.co',        // 예: 'https://abcdefgh.supabase.co'
  SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmYWtkcWdwbnJjY3F3emVnc3d1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTQxOTYwNzksImV4cCI6MjEwOTc3MjA3OX0.VCH0hGfhvr6sCuvVAgymwfFUueIIR09LNS1E7mkmN5M',   // anon / publishable 키 (공개용 키, service_role 키는 절대 넣지 마세요)
  TRIP_ID: 'xmas-2026'     // 같은 TRIP_ID를 쓰는 사람끼리 일정이 공유돼요
};
