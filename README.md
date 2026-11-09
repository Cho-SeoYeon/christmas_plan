# 크리스마스 서울 데이트

서울역에서 내려 북촌, 삼청동, 광화문 마켓을 돌고 대전행 열차를 타기까지의 크리스마스 데이트를 3D 지도 위에서 보여주는 페이지예요. 휴대폰에서 열 수 있게 만들었어요.

- 아래 칩을 누르면 그 일정으로 넘어가요. `+` 버튼으로 일정 사이에 동선을 추가할 수 있어요.
- Supabase를 연결하면 링크를 연 모든 사람의 화면에 추가와 삭제가 실시간으로 반영돼요.
- 연결하지 않으면 각자의 기기에만 저장돼요.

## 1. Supabase 연결

1. 이미 있는 Supabase 프로젝트를 그대로 써도 돼요 (테이블 이름이 `xmas_stops`라 기존 테이블과 겹치지 않아요). 새로 만들 필요 없어요.
2. 대시보드의 **SQL Editor**에 `supabase/schema.sql` 내용을 붙여 넣고 **Run**을 눌러요.
3. **Project Settings → API**에서 `Project URL`과 `anon`(publishable) 키를 복사해 `config.js`에 넣어요.
   - `service_role` 키는 절대 넣지 마세요.
4. 처음 열 때 기본 일정 10개가 자동으로 들어가요.

> 로그인 없이 링크만 있으면 누구나 일정을 추가하고 지울 수 있게 설정되어 있어요. 링크는 함께 갈 사람에게만 공유하세요.

## 2. GitHub Pages로 배포

1. 저장소의 **Settings → Pages**로 가요.
2. Source를 `Deploy from a branch`로, Branch를 `main` / `/ (root)`로 고르고 저장해요.
3. 1~2분 뒤 `https://<아이디>.github.io/christmas_plan/` 주소로 열려요.

## 파일

| 파일 | 내용 |
| --- | --- |
| `index.html` | 3D 지도, 캐릭터, 일정 화면 (three.js r128) |
| `config.js` | Supabase 주소와 키 |
| `supabase/schema.sql` | `xmas_stops` 테이블, 접근 권한, 실시간 설정 |
