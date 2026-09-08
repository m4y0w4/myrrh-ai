#!/usr/bin/env bash
# Myrrh AI — AdonisJS v7 Agent Harness Scaffolder
# Generated for OpenCode, Claude Code, and Bun

set -e
echo "🚀 Installing Myrrh AI Agent Skills (AdonisJS v7)..."

# Non-destructive backup if target file already exists
if [ -f "AGENTS.md" ]; then
  echo "⚠️ Backing up existing AGENTS.md -> AGENTS.md.bak"
  cp "AGENTS.md" "AGENTS.md.bak"
fi
cat << 'EOF' > "AGENTS.md"
# Project Conventions: AdonisJS v7 (Bun Runtime) — Managed by Myrrh AI

## Execution Protocol (Plan First)
Before modifying or creating any files:
1. Formulate a brief implementation spec naming the exact files to create or modify.
2. Verify all subpath import targets exist or need scaffolding.
3. Enforce AdonisJS v7 standards (barrel imports, urlFor, transformers).
4. Request confirmation before applying multi-file changes.

## Invariant Coding Standards
- **Runtime:** Always use Bun (`bun run ace ...`).
- **Subpath Imports:** Exclusively use Node/Bun subpath imports defined in `package.json`:
  - `#controllers/*` (or `#generated/controllers`)
  - `#models/*`
  - `#validators/*`
  - `#transformers/*`
  - `#services/*`
  - `#middleware/*`
  - ❌ NEVER use relative imports (e.g., `../../models/user`).
- **Request Validation:** Never call `request.all()`. Always validate using `await request.validateUsing(validator)`.
- **Serialization:** Models returned to APIs or Inertia views must pass through an explicit Transformer.
EOF

mkdir -p ".opencode/skills/myrrh-lucid"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-lucid/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-lucid/SKILL.md -> .opencode/skills/myrrh-lucid/SKILL.md.bak"
  cp ".opencode/skills/myrrh-lucid/SKILL.md" ".opencode/skills/myrrh-lucid/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-lucid/SKILL.md"
---
name: myrrh-lucid
description: Comprehensive rules, decorators, and query patterns for Lucid ORM v21+ in AdonisJS v7. Use whenever modifying database models, migrations, seeders, or running queries.
---

# Lucid ORM Guardrails (Myrrh AI)

## Recommended Defaults
- Declare column properties explicitly using TypeScript `declare`:
```typescript
import { BaseModel, column, hasMany } from '@adonisjs/lucid/orm'
import type { HasMany } from '@adonisjs/lucid/types/relations'
import { DateTime } from 'luxon'
import Post from '#models/post'

export default class User extends BaseModel {
  @column({ isPrimary: true })
  declare id: number

  @column()
  declare email: string

  @column.dateTime({ autoCreate: true })
  declare createdAt: DateTime

  @hasMany(() =&gt; Post)
  declare posts: HasMany<typeof post="">
}
```
- Eager load relationships using lambda queries:
```typescript
await user.load('posts', (query) =&gt; {
  query.where('published', true)
})
```
- Wrap multi-table updates inside transactions:
```typescript
import db from '@adonisjs/lucid/services/db'

await db.transaction(async (trx) =&gt; {
  const user = await User.create(userData, { client: trx })
  await user.related('posts').create(postData, { client: trx })
})
```

## Avoid by Default
- ❌ Do NOT initialize model columns with assignment defaults (`declare id: number = 1`). Always use `declare`.
- ❌ Do NOT forget `await` on queries (`User.find(1)` returns a Promise).
- ❌ Do NOT run raw SQL queries without parameter bindings.
</typeof>
EOF

mkdir -p ".opencode/skills/myrrh-vinejs"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-vinejs/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-vinejs/SKILL.md -> .opencode/skills/myrrh-vinejs/SKILL.md.bak"
  cp ".opencode/skills/myrrh-vinejs/SKILL.md" ".opencode/skills/myrrh-vinejs/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-vinejs/SKILL.md"
---
name: myrrh-vinejs
description: Form validation schemas and type generation using VineJS in AdonisJS v7. Use whenever creating or updating user input validation schemas or DTOs.
---

# VineJS Validation Guardrails (Myrrh AI)

## Recommended Defaults
- Define validators in `#validators/*`.
- Compile schemas at module scope before exporting:
```typescript
import vine from '@vinejs/vine'
import type { Infer } from '@vinejs/vine/types'

export const createUserValidator = vine.compile(
  vine.object({
    fullName: vine.string().trim().minLength(2),
    email: vine.string().email().normalizeEmail(),
    password: vine.string().minLength(8),
  })
)

export type CreateUserDTO = Infer<typeof createuservalidator="">
```
- Validate inputs inside controllers with `request.validateUsing()`:
```typescript
const payload = await request.validateUsing(createUserValidator)
```

## Avoid by Default
- ❌ Do NOT compile schemas inside controller actions (compile once at module scope).
- ❌ Do NOT use Zod, Joi, or class-validator.
- ❌ Do NOT access raw unvalidated inputs using `request.all()`.
</typeof>
EOF

mkdir -p ".opencode/skills/myrrh-http"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-http/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-http/SKILL.md -> .opencode/skills/myrrh-http/SKILL.md.bak"
  cp ".opencode/skills/myrrh-http/SKILL.md" ".opencode/skills/myrrh-http/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-http/SKILL.md"
---
name: myrrh-http
description: Route handling, controllers, HTTP context, and status responses for AdonisJS v7. Use when creating API endpoints, routes, or controllers.
---

# AdonisJS v7 HTTP Routing &amp; Controllers (Myrrh AI)

## Recommended Defaults
- In AdonisJS v7, route definitions use the generated controller barrel:
```typescript
import router from '@adonisjs/core/services/router'
import { controllers } from '#generated/controllers'

router.group(() =&gt; {
  router.get('/posts', [controllers.Posts, 'index']).as('posts.index')
  router.post('/posts', [controllers.Posts, 'store']).as('posts.store')
  router.get('/posts/:id', [controllers.Posts, 'show']).as('posts.show')
}).prefix('/api/v1')
```
- Generate type-safe URLs using `urlFor()`:
```typescript
import { urlFor } from '@adonisjs/core/services/router'

const postUrl = urlFor('posts.show', { params: { id: post.id } })
```
- Controllers receive `HttpContext` as the first argument:
```typescript
import type { HttpContext } from '@adonisjs/core/http'

export default class PostsController {
  async index({ response }: HttpContext) {
    return response.ok({ data: [] })
  }
}
```

## Avoid by Default
- ❌ Do NOT use manual dynamic imports (`const PostsController = () =&gt; import(...)`) in v7 routes. Use `#generated/controllers`.
- ❌ Do NOT use deprecated `router.makeUrl()` or Edge `route()` helpers. Use `urlFor()`.
- ❌ Do NOT use Express syntax (`req`, `res`, `next`).
EOF

mkdir -p ".opencode/skills/myrrh-transformers"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-transformers/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-transformers/SKILL.md -> .opencode/skills/myrrh-transformers/SKILL.md.bak"
  cp ".opencode/skills/myrrh-transformers/SKILL.md" ".opencode/skills/myrrh-transformers/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-transformers/SKILL.md"
---
name: myrrh-transformers
description: Model serialization and API resource transformation in AdonisJS v7. Use whenever returning database models to API clients or Inertia views.
---

# AdonisJS v7 Transformers Guardrails (Myrrh AI)

## Recommended Defaults
- Always transform Lucid models before returning them from controllers:
```typescript
// app/transformers/user_transformer.ts
import { BaseTransformer } from '@adonisjs/core/transformers'
import User from '#models/user'

export default class UserTransformer extends BaseTransformer<user> {
  toObject(user: User) {
    return {
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      createdAt: user.createdAt.toISO(),
    }
  }
}
```
- Using in controllers:
```typescript
import type { HttpContext } from '@adonisjs/core/http'
import User from '#models/user'
import UserTransformer from '#transformers/user_transformer'

export default class UsersController {
  async show({ params, response }: HttpContext) {
    const user = await User.findOrFail(params.id)
    return response.ok(UserTransformer.transform(user))
  }
}
```

## Avoid by Default
- ❌ Do NOT return raw Lucid model instances directly from controllers.
- ❌ Do NOT expose password hashes or sensitive internal flags in responses.
</user>
EOF

mkdir -p ".opencode/skills/myrrh-auth"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-auth/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-auth/SKILL.md -> .opencode/skills/myrrh-auth/SKILL.md.bak"
  cp ".opencode/skills/myrrh-auth/SKILL.md" ".opencode/skills/myrrh-auth/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-auth/SKILL.md"
---
name: myrrh-auth
description: Session and Access Token authentication using @adonisjs/auth in AdonisJS v7. Use when implementing user registration, logins, token generation, or authentication guards.
---

# AdonisJS v7 Authentication Guardrails (Myrrh AI)

## Recommended Defaults
- Verify user credentials using `User.verifyCredentials()`:
```typescript
import type { HttpContext } from '@adonisjs/core/http'
import User from '#models/user'
import UserTransformer from '#transformers/user_transformer'

export default class AuthController {
  async login({ request, response }: HttpContext) {
    const { email, password } = request.only(['email', 'password'])

    const user = await User.verifyCredentials(email, password)

    const token = await User.accessTokens.create(user, ['*'], {
      expiresIn: '30 days',
    })

    return response.ok({
      type: 'bearer',
      token: token.value!.release(),
      user: UserTransformer.transform(user),
    })
  }

  async me({ auth, response }: HttpContext) {
    const user = auth.getUserOrFail()
    return response.ok(UserTransformer.transform(user))
  }
}
```
- Protect routes in `start/routes.ts` with `middleware.auth()`:
```typescript
import router from '@adonisjs/core/services/router'
import { middleware } from '#start/kernel'
import { controllers } from '#generated/controllers'

router.get('/dashboard', [controllers.Dashboard, 'index']).use(middleware.auth())
```

## Avoid by Default
- ❌ Do NOT manually compare passwords using `bcrypt.compare()`. Use `User.verifyCredentials()`.
- ❌ Do NOT create custom JWT signers unless strictly required. Use official Access Tokens or Session guards.
EOF

mkdir -p ".opencode/skills/myrrh-bouncer"
# Non-destructive backup if target file already exists
if [ -f ".opencode/skills/myrrh-bouncer/SKILL.md" ]; then
  echo "⚠️ Backing up existing .opencode/skills/myrrh-bouncer/SKILL.md -> .opencode/skills/myrrh-bouncer/SKILL.md.bak"
  cp ".opencode/skills/myrrh-bouncer/SKILL.md" ".opencode/skills/myrrh-bouncer/SKILL.md.bak"
fi
cat << 'EOF' > ".opencode/skills/myrrh-bouncer/SKILL.md"
---
name: myrrh-bouncer
description: Fine-grained authorization, pre-validation checks, and policies using @adonisjs/bouncer in AdonisJS v7. Use whenever enforcing user roles, resource ownership, or permissions.
---

# AdonisJS v7 Bouncer Authorization Guardrails (Myrrh AI)

## Recommended Defaults
- Define policies inside `app/policies/*`:
```typescript
import User from '#models/user'
import Post from '#models/post'
import { BasePolicy } from '@adonisjs/bouncer'

export default class PostPolicy extends BasePolicy {
  view(user: User, post: Post): boolean {
    return post.isPublished || user.id === post.userId
  }

  edit(user: User, post: Post): boolean {
    return user.id === post.userId
  }

  delete(user: User, post: Post): boolean {
    return user.id === post.userId || user.isAdmin
  }
}
```
- Authorize requests before validating payloads:
```typescript
import type { HttpContext } from '@adonisjs/core/http'
import PostPolicy from '#policies/post_policy'
import Post from '#models/post'

export default class PostsController {
  async destroy({ bouncer, params, response }: HttpContext) {
    const post = await Post.findOrFail(params.id)

    // Abort early with 403 Forbidden
    await bouncer.with(PostPolicy).authorize('delete', post)

    await post.delete()
    return response.noContent()
  }
}
```

## Avoid by Default
- ❌ Do NOT validate request bodies before checking authorization. Always authorize first.
- ❌ Do NOT hardcode role checks (`if (user.role === 'admin')`) inside controller bodies. Use Policies or Abilities.
EOF

echo "✅ Successfully installed all 7 Myrrh AI skills!"
