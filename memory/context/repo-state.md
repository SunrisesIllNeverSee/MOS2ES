# Repo State — MO§ES™ Working Context

## Current Session (March 6, 2026)
- Full repo read complete (84+ files)
- REPO_REVIEW.md written with code review, system design, and documentation audit
- Walking through everything file by file with Luthen
- Goal: notes captured, automation designed, everything accounted for

## Open Issues (from REPO_REVIEW.md)

### Critical / Legal
1. Acronym inconsistency — "Modus Operandi" vs "Modular Operating" — needs one canonical choice
2. 5 broken links in README.md
3. `gitignore` missing leading dot in Signal Vault

### High Priority Content
4. Codex Fragments are empty shells (blackhole-law.md, ai-instability.md, fragment-001.md, towers.md)
5. `ii_Artifacts/` is empty — described as proof layer but has nothing
6. `x*Table_of_Content.md` is empty and has wildcard in filename

### Architecture / Automation
7. Circular checksums.sha256 commit issue
8. Seed pipeline not formally documented or automated
9. IP boilerplate in 38+ files — needs meta/NOTICE.md consolidation

## Planned Additions
- `meta/GLOSSARY.md` — central vocabulary (in progress via this memory system)
- `WORKFLOW.md` in Signal Vault — formalizes seed pipeline
- `scripts/seed-graduate.sh` — graduation automation
- `i_Seeds_Prep/SEED_TEMPLATE.md` — standardized seed format
- `CHANGELOG.md` — prior art timeline
- `.github/workflows/seed-intake.yml` — validation on Prep pushes

## Seed Pipeline Design (agreed)
```
i_Seeds_Prep/  →  [seed-graduate.sh]  →  i_Seeds/S-XXXX_[name].md
                                      →  checksums.sha256 updated
                                      →  ii_Artifacts/ stub if flagged
                                      →  standardized git commit
```

## File Drop Automation (future goal)
Drop file or folder → auto-seed into archive
- Needs: seed template + graduation script + intake workflow
- Will assign S-XXXX, hash, file, and commit automatically
