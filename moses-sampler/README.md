# moses-sampler

A staging ground that gathers four MO§ES-lineage processors into one place so
they can be sampled behind a single Gradio app. **Nothing is wired yet** — this
pass only copies and organizes the source material.

## Structure

```
moses-sampler/
├── app.py              # empty Gradio scaffold (boots, does nothing yet)
├── requirements.txt    # scaffold deps only (gradio)
├── processors/
│   ├── conservation/   # commitment conservation harness
│   ├── sigarmy/        # signal_army + sigsystem
│   ├── sigtoken/       # sig_token core
│   └── governance/     # MO§ES governance plugin
└── README.md
```

## Provenance

Files were copied verbatim from their source repositories:

| Processor      | Source repo               | Source path                                              |
|----------------|---------------------------|----------------------------------------------------------|
| `conservation` | `commitment-conservation` | `operational-harness/src/` (entire directory)            |
| `sigarmy`      | `RNS`                      | `2_secondary/sig_army/main/signal_army/signal_army.py`   |
| `sigarmy`      | `RNS`                      | `2_secondary/sig_army/main/sigsystem/sigsystem.py`       |
| `sigtoken`     | `RNS`                      | `2_secondary/sig_army/main/sigtoken/` (core) + `sigtoken_v2/` |
| `governance`   | `moses-governance`         | core plugin files (manifests, hooks, scripts, modes, rules, agents, commands, skills, references) |

## Status

- [x] Copy + organize sources
- [ ] Wire processors into `app.py`
- [ ] Pin per-processor dependencies in `requirements.txt`
