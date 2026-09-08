# **Myrrh AI — AdonisJS Agent Harness**

> Teaching your AI agent to write clean, idiomatic AdonisJS v7. Token-optimized agent skills and guardrails designed for **OpenCode**, **Claude Code**, and autonomous AI coding assistants.

## **🧭 Live Web Workbench**

An interactive visual builder and single-click bundle generator is available directly in this repository:

👉 [**Open the Myrrh AI Interactive Harness Guide**](https://m4y0w4.github.io/myrrh-ai/)]

## **🧠 Why This Architecture? (The Just-In-Time Context Strategy)**

Dumping monolithic documentation bundles or uncompressed repository dumps (200,000+ tokens) directly into your agent's context window leads to severe engineering bottlenecks:

1. **High Token Inefficiency & Cost:** Burning millions of window tokens on irrelevant API pages that the model doesn't need for the immediate task.  
2. **"Lost in the Middle" Hallucinations:** LLMs lose track of strict architectural boundaries when overloaded with massive walls of positive documentation.  
3. **Absence of Negative Constraints:** Standard documentation explains how APIs work, but rarely defines negative space—telling the model exactly what *not* to do.

### **The Myrrh AI Solution**

Myrrh AI splits the AdonisJS v7 knowledge base into **modular, on-demand skill units**. The agent only loads the skill relevant to its immediate task (e.g., loading myrrh-lucid only when touching migrations or models), preserving up to **90% of your context window** for your actual application logic while strictly enforcing v7 invariants.

## **📂 Repository Structure**

.  
├── AGENTS.md                                \# Root invariant rules and dynamic import maps  
├── .opencode/  
│   └── skills/  
│       ├── myrrh-lucid/  
│       │   └── SKILL.md                     \# ORM, models, migrations & relations  
│       ├── myrrh-vinejs/  
│       │   └── SKILL.md                     \# Validation schemas & inferred DTOs  
│       ├── myrrh-http/  
│       │   └── SKILL.md                     \# Routing, generated barrel controllers & urlFor  
│       ├── myrrh-transformers/  
│       │   └── SKILL.md                     \# Model serialization & API response schemas  
│       ├── myrrh-auth/  
│       │   └── SKILL.md                     \# Access tokens, sessions & verifyCredentials  
│       └── myrrh-bouncer/  
│           └── SKILL.md                     \# Pre-validation authorization & policies  
├── setup-myrrh-ai-harness.sh                \# Non-destructive install script  
├── index.html                               \# Interactive builder (GitHub Pages ready)  
├── README.md                                \# Project documentation  
└── LICENSE                                  \# MIT License

## **⚡ Quick Start**

### **Option A: Automated Installation (Single Command)**

Run the automated bundle script generated from the workbench:

chmod \+x setup-myrrh-ai-harness.sh  
./setup-myrrh-ai-harness.sh

*Note: The script is non-destructive. If any file already exists, it creates a .bak copy before writing.*

### **Option B: Manual Installation**

1. Copy AGENTS.md into the root of your AdonisJS v7 project.  
2. Copy the .opencode/skills/ directory into your project root.  
3. Verify your agent recognizes the new skills by prompting:*"Show me your active skills for AdonisJS v7."*

## **🛠 Skills Matrix**

| Skill                  | Trigger / Description                      | Key Invariant Enforced                                                 |
|:---------------------- |:------------------------------------------ |:---------------------------------------------------------------------- |
| **AGENTS.md**          | Root project anchor                        | Plan-first execution; Bun runtime; \# subpath aliases.                 |
| **myrrh-lucid**        | Models, migrations, seeders, queries       | TypeScript declare properties; no assignment defaults; transactions.   |
| **myrrh-vinejs**       | Form validation, request validation, DTOs  | Module-scope compiled schemas; validateUsing(); no Zod or Joi.         |
| **myrrh-http**         | Endpoints, routes, controllers, middleware | \#generated/controllers barrel imports; urlFor() URL generator.        |
| **myrrh-transformers** | API responses, Inertia props               | Always transform models; never leak hashes or internal fields.         |
| **myrrh-auth**         | User login, token issuance, session guards | User.verifyCredentials(); official Access Tokens; middleware.auth().   |
| **myrrh-bouncer**      | Access control, resource permissions       | Pre-validation authorization; Policies and Abilities; early 403 exits. |

## **🤝 Community Contributions & Tips**

We actively encourage contributions, edge-case rules, and tips from developers using AI coding agents with AdonisJS v7\!

### **Ways to Contribute**

* **Submit Agent Edge-Cases:** Did Claude Code or OpenCode hallucinate an older v5/v6 pattern? Open an issue or PR with the exact prompt and the negative guardrail that fixes it.  
* **Propose New Skills:** We are actively accepting skill templates for:  
  * myrrh-inertia (Inertia.js v2 integration & SSR)  
  * myrrh-tuyau (End-to-end type-safe RPC client)  
  * myrrh-queues (BullMQ and background job workflows)  
* **Improve Token Efficiency:** If you find ways to express rules with fewer tokens without losing precision, we want your PR\!

## **👏 Acknowledgements**

Special thanks and appreciation to **Harminder Virk** and the **AdonisJS core team** for building one of the most cohesive, elegant, and enjoyable web frameworks in the TypeScript ecosystem.

## **⚖️ Legal Disclaimers & Fair Use**

* **Independent Project:** Myrrh AI is an independent, community-driven open-source project. It is not affiliated with, sponsored by, or endorsed by Harminder Virk, the AdonisJS core team, or AdonisJS Plus.  
* **Nominative Fair Use:** Any use of the trademark "AdonisJS" is strictly for descriptive, nominative purposes to indicate software compatibility and target environment.  
* **Clean-Room Implementation:** All skills, instructions, and guardrails were independently authored based exclusively on publicly accessible documentation, official releases, and standard TypeScript best practices.  
* **AI-Generated Code Disclaimer:** These skills provide heuristic guidance for AI models. You are solely responsible for auditing, testing, and verifying the security of all AI-generated code prior to deployment.

## **📄 License & Warranty Disclaimer**

Released under the **MIT License**.

MIT License

Copyright (c) 2026 Myrrh AI Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
