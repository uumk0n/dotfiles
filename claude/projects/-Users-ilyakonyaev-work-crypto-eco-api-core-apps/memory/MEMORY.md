# ECO API Core — Project Memory

## Project Structure
- `/apps/api-core` — NestJS backend (port 3001 in dev)
- `/apps/front-core` — Vite + React SPA (migrated from Next.js 16)

## Key Architectural Decisions

### Frontend (front-core)
- **Vite** replaces Next.js. Entry: `index.html` + `src/main.tsx`
- **React Router v7** for routing. `BrowserRouter` in `App.tsx`
- `@/ → src/` path alias configured in `vite.config.ts`
- Env var: `VITE_API_URL` (was `NEXT_PUBLIC_API_URL`)
- Auth via httpOnly cookies (credentials: 'include' in all requests)
- `PrivateRoute` checks `AuthContext` → redirects to `/auth/login`

### Backend (api-core)
- NestJS 11, MongoDB (no Mongoose, raw MongoClient)
- JWT auth via `passport-jwt` + httpOnly cookies (`accessToken`, `refreshToken`)
- Config: `authConfig` registered in root ConfigModule.forRoot load array
- `cookie-parser` added to bootstrap.ts
- CORS enabled with `credentials: true`

## Important Files
- `api-core/src/app/bootstrap.ts` — app bootstrap, cookie-parser
- `api-core/src/root.module.ts` — root module imports
- `api-core/src/configs/auth.config.ts` — JWT config
- `api-core/src/modules/auth/` — auth module (login/refresh/logout/me)
- `api-core/src/modules/users/` — users module (create user via API key)
- `api-core/src/modules/tms/` — TMS module (translations)
- `api-core/.env-cmdrc` — env variables (dev/prod)
- `front-core/src/App.tsx` — routes + PrivateRoute
- `front-core/src/contexts/AuthContext.tsx` — auth state
- `front-core/src/lib/api-client.ts` — API client (401 refresh interceptor)
- `front-core/src/pages/tms/TmsPage.tsx` — TMS UI
- `front-core/Dockerfile` + `front-core/nginx.conf` — deploy

## TMS Model
- `TranslationsModel` has `type: 'text' | 'seo'` field (upsert key: locale+applicationName+type)
- `TranslationItem` has `variables?: string[]` (parsed from `{{varName}}` in frontend)
- GET/PUT endpoints support `?type=text|seo` query param
- PUT + POST application endpoints protected by `JwtGuard`

## Auth Flow
- Login: POST /auth/login → sets `accessToken` + `refreshToken` cookies
- Refresh: POST /auth/refresh (reads refreshToken cookie)
- Logout: POST /auth/logout → clears cookies
- Check: GET /auth/me → returns {id, email, role}

## Dev Commands
- api-core: `npm run start:dev` (uses env-cmd dev profile)
- front-core: `npm run dev` (Vite)
