---
name: avr
description: Send files or uncommitted changes to the user so they can see them on remote control, without committing anything.
disable-model-invocation: true
---

Send the requested output to the user with the SendUserFile tool (load it with ToolSearch if needed), using absolute paths and `status: normal`.

Decide what to send from the arguments:

- **Paths:** send those files.
- **A description** (e.g. "the spec"): find the matching file. If more than one matches, ask which.
- **`diff`:** save all uncommitted changes, including untracked files, as one `.patch` file in the scratchpad and send it.
- **No arguments:** send the last file you changed in this conversation. If you changed none, send the repo's uncommitted files.

Rules:

- Never send secrets (`.env` files, credentials, private keys). Say what you skipped.
- Never commit or push.
- If a path doesn't exist, say so instead of guessing.
- Reply with one short line after sending.
