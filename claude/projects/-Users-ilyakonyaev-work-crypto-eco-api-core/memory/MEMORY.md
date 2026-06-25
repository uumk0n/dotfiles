# Project Memory: eco-api-core

## Structure
- Monorepo: `apps/api-core` (NestJS 11, port 3001) + `apps/front-core` (Next.js 16, port 3000)
- CLAUDE.md created at repo root

## Key paths
- api-core modules: `apps/api-core/src/modules/{vacancies,mail,tg,tms,auth,users}/`
- shared infrastructure: `apps/api-core/src/shared/modules/{als,mongo}/`
- configs: `apps/api-core/src/configs/` (app, auth, mongo, redis, tg)
- front-core API client: `apps/front-core/lib/api-client.ts`
- front-core pages: `apps/front-core/app/` (App Router)

## Auth
- Two guards: ApiKeyGuard (x-api-key header) and JwtGuard (Bearer JWT)
- JWT access + refresh tokens, bcrypt password hashing

## Infra
- MongoDB (27017, admin/1111) + Redis (6379) via docker-compose in `apps/api-core/dev/`
- env-cmd with `.env-cmdrc` for environment management (dev port = 3001)
