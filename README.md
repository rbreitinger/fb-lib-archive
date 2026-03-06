# FreeBASIC Lib Vault 🗄️

A curated repository of **precompiled libraries** for use with
[FreeBASIC 1.10.1](https://www.freebasic.net), including matching `.bi` headers,
documentation, and ready-to-run examples.

---

## Goals

- Preserve and bundle libraries that match the header versions shipped with
  **FreeBASIC 1.10.1** (`/inc/`)
- Provide `.dll` / `.lib` (Windows) and `.so` / `.a` (Linux) where possible
- Include translated `.bi` headers for newer library versions where feasible
- Collect reference documentation (HTML, PDF, CHM) alongside each library
- Offer well-sorted, practical FreeBASIC code examples

---

## Repository Structure

| Folder | Contents |
|---|---|
| `libraries/` | Completed library bundles, one subfolder per library, zipped packages per version |
| `help/` | Reference manuals — FreeBASIC, OpenGL, WinAPI, and more |
| `examples/` | Standalone `.bas` example programs, sorted by topic |
| `tools/` | Maintenance scripts (header scanning, version extraction, etc.) |

---

## Library Bundle Contents

Each library version folder aims to include:

- ✅ `.bi` — FreeBASIC header(s)
- ✅ `.dll` / `.so` — Dynamic library
- ✅ `.lib` / `.a` — Static/import library
- ✅ `.bas` — Usage examples
- ✅ `README.md` — Version notes, build info, official links
- ⬜ `docs/` — Manual or reference (if available)

See `STATUS.md` for current completion status per library.

---

## Priority

The **primary target** for each library is the version whose headers were
translated and shipped with the official **FreeBASIC 1.10.1** release.
Additional versions are included as secondary bundles where available.

---

## Platform Support

| Platform | Status |
|---|---|
| Windows 32-bit | ✅ Primary target |
| Windows 64-bit | ✅ Included where available |
| Linux 32-bit | 🔧 Help wanted — see CONTRIBUTING.md |
| Linux 64-bit | 🔧 Help wanted — see CONTRIBUTING.md |

---

## Contributing

See `CONTRIBUTING.md`.  
If you have a compiled library, a tested `.bi`, or know of a version mismatch —
pull requests and issues are very welcome.

## Linux Contributions

Linux builds (.so / .a) are a first-class goal of this project.
If you run FreeBASIC on Linux and can compile or test any of the
libraries listed in STATUS.md, please open a PR or issue.
Even partial results (tested .so, notes on build steps, known issues)
are valuable and very welcome.

---

## License

Each bundled library remains under its own original license.
Example code and FreeBASIC headers in this repo: **MIT**.