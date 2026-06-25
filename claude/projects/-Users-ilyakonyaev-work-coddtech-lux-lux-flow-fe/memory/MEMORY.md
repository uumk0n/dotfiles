# LuxFlow FE — Project Memory

## Stack
- Next.js App Router, TypeScript, Tailwind CSS, Shadcn/Radix UI
- React Query for data fetching, react-hook-form + Zod for forms
- Biome for linting

## Font Classes (Tailwind)
- `font-new-sans` → DM Sans (body text, labels, buttons in new design)
- `font-new-serif` → Feature Display Web (headings in new design)
- `font-serif` / `font-sans` → old fonts (legacy components)

## New Design System (Redesign Branch)
- Background: `#F5F3EF`
- Border: `#D6D3D1` (cards), `#A8A29E` (inputs)
- Text: `#44403C` (primary), `#A8A29E` (muted/placeholder)
- Modal container: `rounded-2xl border border-[#D6D3D1] bg-[#F5F3EF] shadow-[0px_20px_28px_rgba(0,0,0,0.05)]`
- Input style: `h-12 rounded-[4px] border border-[#A8A29E] px-3 font-new-sans text-sm text-[#44403C]`
- Disabled input: add `bg-[#EDE9E3] opacity-50`
- Primary button: `bg-[#021171] text-[#F5F3EF] rounded-lg h-12 font-new-sans font-medium text-base`
- Cancel button: `bg-[#F5F3EF] border border-[#A8A29E] text-[#44403C] rounded-lg h-12 font-new-sans font-medium text-base`
- Label: `font-new-sans text-sm font-normal leading-[130%] text-[#44403C]`
- Heading: `font-new-serif text-2xl font-light leading-[120%] text-[#44403C]`
- Toggle (active): `bg-[#001A8C] rounded-full`

## New Design Route Mechanism
- `NEW_DESIGN_ROUTES = ["/wallet"]` in `authenticated-layout.tsx` AND `app/(app)/(protected)/layout.tsx`
- New design routes: `Header` + content container (`mx-auto max-w-[1720px] px-4 py-6 min-[1172px]:px-10 min-[1172px]:py-10`) + `Footer`; no AuthenticatedHeader, no sidebar
- Old design routes: `AuthenticatedHeader` + `SidebarProvider` + sidebar
- To add a new redesigned route, add path to `NEW_DESIGN_ROUTES` in BOTH files
- Match logic: `pathname === route || pathname.startsWith(route + "/")`

## Auth Pages (Redesigned)
- Auth layout: `src/widgets/auth-layout/ui/auth-layout.tsx` — uses `Header`, left marketing content (UAE badge, 72px headline, 4 feature callouts), right form card (420px, rounded-2xl, border #D6D3D1, shadow)
- Sign-in page: `app/(auth)/sign-in/page.tsx` — social buttons (disabled UI), OR divider, email+password fields, Login button (`bg-[#021171]`, `rounded-[4px]`, `h-12`)
- Signup form: `src/widgets/signup-form/ui/signup-form.tsx` — firstName+lastName (combined as fullName), UAE phone default (`AE`), UAE residency checkbox, Continue button
- Auth form card padding: `pt-8 px-6 pb-6`, form sections gap: `gap-8`, input height: `h-12 rounded-[4px] border-[#A8A29E]`

## Key File Paths
- Profile page: `src/pages-layer/profile/ui/profile-page.tsx`
- Wallet page (redesigned): `app/(app)/(protected)/wallet/page.tsx`
- Edit profile modal: `src/widgets/edit-profile-modal/ui/edit-profile-modal.tsx`
- Address modal: `src/widgets/address-modal/ui/address-modal.tsx`
- Stripe KYC modal: `src/widgets/stripe-identity-verification/ui/stripe-identity-modal.tsx`
- KYC content: `src/widgets/stripe-identity-verification/ui/stripe-identity-verification.tsx`
- KYC status section: `src/widgets/kyc-status-section/ui/kyc-status-section.tsx`
- Authenticated layout: `src/widgets/authenticated-layout/ui/authenticated-layout.tsx`
- Dialog primitives: `src/shared/ui/dialog/dialog.tsx`

## Patterns
- Profile page modals are loaded via dynamic import in `app/(app)/(protected)/layout.tsx`
- `NEW_DESIGN_ROUTES` in authenticated-layout controls which routes use new header/footer
- Modal structure: `DialogContent` with `p-0 gap-0`, then manual header div + form + footer buttons
