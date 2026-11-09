-- Supabase 대시보드 → SQL Editor 에 붙여 넣고 Run 하세요.
-- 이미 쓰고 있는 Supabase 프로젝트에 그대로 추가해도 돼요. 테이블 이름이 xmas_stops 라서 기존 테이블과 겹치지 않아요.

create table if not exists public.xmas_stops (
  id          uuid primary key default gen_random_uuid(),
  trip_id     text not null default 'xmas-2026',
  start_time  text not null,              -- 'HH:MM'
  end_time    text not null,              -- 'HH:MM'
  title       text not null,
  memo        text not null default '',
  tip         text not null default '',
  say         text not null default '',   -- 캐릭터 말풍선
  mode        text not null default 'walk' check (mode in ('walk','subway','subway1','subway3','ktx')),
  act         text not null default 'look' check (act in ('arrive','eat','cafe','photo','look','wait','depart')),
  x           double precision not null,  -- 지도 좌표 (페이지에서 탭해서 고름)
  z           double precision not null,
  route       jsonb,                      -- 이전 장소에서 오는 경로 (없으면 직선)
  created_at  timestamptz not null default now()
);

create index if not exists xmas_stops_trip_time on public.xmas_stops (trip_id, start_time);

-- 링크를 가진 사람은 누구나 보고, 추가하고, 지울 수 있게 (로그인 없음)
alter table public.xmas_stops enable row level security;

drop policy if exists "xmas_stops read"   on public.xmas_stops;
drop policy if exists "xmas_stops insert" on public.xmas_stops;
drop policy if exists "xmas_stops update" on public.xmas_stops;
drop policy if exists "xmas_stops delete" on public.xmas_stops;

create policy "xmas_stops read"   on public.xmas_stops for select to anon, authenticated using (true);
create policy "xmas_stops insert" on public.xmas_stops for insert to anon, authenticated with check (true);
create policy "xmas_stops update" on public.xmas_stops for update to anon, authenticated using (true) with check (true);
create policy "xmas_stops delete" on public.xmas_stops for delete to anon, authenticated using (true);

-- 실시간 반영 켜기
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'xmas_stops'
  ) then
    alter publication supabase_realtime add table public.xmas_stops;
  end if;
end $$;
