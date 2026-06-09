"""
moses-sampler — Gradio scaffold.

Empty entry point. Nothing is wired to the processors yet; this is a
placeholder UI so the app boots. The four processor packages live under
`processors/` and will be connected here in a later pass.
"""

import gradio as gr


def build_ui() -> gr.Blocks:
    with gr.Blocks(title="MO§ES Sampler") as demo:
        gr.Markdown("# MO§ES Sampler")
        gr.Markdown(
            "Scaffold only — processors are copied in but not yet wired.\n\n"
            "- `processors/conservation` — commitment conservation harness\n"
            "- `processors/sigarmy` — signal_army + sigsystem\n"
            "- `processors/sigtoken` — sig_token core\n"
            "- `processors/governance` — MO§ES governance plugin"
        )
    return demo


if __name__ == "__main__":
    build_ui().launch()
