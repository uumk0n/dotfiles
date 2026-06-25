# Project: crypto/front-core

## Stack
- Next.js App Router, TypeScript, SCSS (BEM-like classes)
- i18n: react-i18next, namespaces: `common`, `signUp`, `dashboard`, `accounts`
- State: Zustand (`useSessionStore` in `@/entities/session`)
- API: custom fetch wrapper at `@/shared/api` — `post<T>()`, `fetcher<T>()`, `ApiError`

## Route → Page mapping
- `/` → sign-in (`src/app/page.tsx` → `src/views/sign-in/ui/SignInPage.tsx`)
- `/sign-up` → multi-step sign-up flow
- `/forgot-password` → `src/views/forgot-password/ui/ForgotPasswordPage.tsx`
- `/reset-password?token=...` → `src/views/reset-password/ui/ResetPasswordPage.tsx`
- `/(dashboard)/accounts` → dashboard accounts page

## Conventions
- Pages use `dynamic(..., { ssr: false })` in app route files; `useSearchParams` requires `<Suspense>` wrapper
- Auth features in `src/features/auth/` (one function per file, exported via index.ts)
- SCSS: BEM-like with page-scoped prefixes (e.g. `.sign-in-*`, `.forgot-pw-*`, `.reset-pw-*`)
- i18n keys live in `src/shared/i18n/locales/{en,ru}/signUp.json`
- Sign-in page is at `/` (not `/signin`)

## Auth API endpoints
- POST `/public/auth/signin` — sign in
- POST `/public/auth/register` — register
- POST `/public/auth/forgot-password` → `{ email }` — always returns success
- POST `/public/auth/reset-password` → `{ token, password }` — 400 if token expired/used
- POST `/public/auth/refresh` — refresh tokens
