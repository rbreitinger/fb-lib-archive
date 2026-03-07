# Contributing to fb-lib-archive

First of all — thank you for considering a contribution. This project lives or dies by the community around it, and every tested library, corrected header, or added example makes it more valuable for every FreeBASIC developer out there.

---

## What we need

There are several ways to contribute, from very simple to quite involved:

- **Version info** — open a `.bi` file, find the version it was translated from, report it in an issue or PR so we can fill in `STATUS.md`
- **Binary files** — provide a compiled `.dll`, `.lib`, `.so`, or `.a` for a library listed as open in `STATUS.md`
- **Testing** — try linking an existing bundle against a real `.bas` project and report results
- **Examples** — write a clean, minimal `.bas` file demonstrating a library's basic usage
- **Documentation** — track down an official manual (HTML, PDF, CHM) and include it in a bundle
- **Header translation** — translate a newer library version's C `.h` header to a FreeBASIC `.bi`
- **Bug reports** — report a mismatch, broken link, wrong version, or test failure via an issue

---

## Ground rules

- **Do not include proprietary or non-redistributable binaries.** Check the license of each library before adding files. When in doubt, open an issue and ask first.
- **Do not modify the original FB 1.10.1 `.bi` headers** that live in the `/inc/` reference copies. Those are preserved as-is for version reference.
- **Match the version first.** The primary goal of each bundle is to match the version of the library that was used when the FB 1.10.1 `.bi` header was translated. Additional versions are welcome as secondary bundles.
- **One library per PR** if possible. Smaller, focused PRs are much easier to review.
- **Test before submitting.** If you provide a binary, please confirm it links and runs with a basic `.bas` example. State your platform and FB version in the PR description.

---

## Linux contributions

Linux builds are a **first-class goal** of this project, not an afterthought.

If you run FreeBASIC on Linux and can help with any of the following, please open a PR or issue:

- Providing compiled `.so` / `.a` files for any library listed in `STATUS.md`
- Noting exact package names from common distros (apt, pacman, dnf) that provide the right version
- Documenting build steps or configure flags needed to reproduce a specific version
- Testing that an existing bundle's `.bi` header works correctly under Linux FB

Even partial results are very welcome — a note saying *"libfoo 1.2.3 from Debian Bookworm works fine with the existing header"* is useful information worth recording.

---

## Bundle structure

Each library contribution should follow this folder layout:

```
libraries/
  └── libname/
      ├── README.md                    ← required (see template below)
      └── libname-x.y.z/               ← one folder per library version
          │
          ├── inc/                     ← shared: .bi header(s), all platforms
          │   └── (mirrors FB /inc/ layout exactly, e.g. inc/SDL2/SDL.bi)
          ├── examples/                ← shared: .bas example files
          ├── docs/                    ← shared: manual, PDF, CHM, HTML
          │
          ├── win32/                   ← platform-specific binaries
          │   ├── bin/                 ← .dll
          │   └── lib/                 ← .lib (import or static)
          ├── win64/
          │   ├── bin/
          │   └── lib/
          ├── linux32/
          │   └── lib/                 ← .so / .a
          └── linux64/
              └── lib/
          │
          ├── libname-x.y.z-win32.zip      ← bundle: inc/ + examples/ + docs/ + win32/
          ├── libname-x.y.z-win64.zip      ← bundle: inc/ + examples/ + docs/ + win64/
          ├── libname-x.y.z-linux32.tar.gz ← bundle: inc/ + examples/ + docs/ + linux32/
          └── libname-x.y.z-linux64.tar.gz ← bundle: inc/ + examples/ + docs/ + linux64/
```

**Important rules:**
- `inc/` **must mirror the exact folder structure** of the FreeBASIC 1.10.1 `/inc/` folder. If FB ships the header as `inc/SDL2/SDL.bi`, your bundle must use the same path. This prevents confusion and makes drop-in installation straightforward.
- Some libraries have platform-specific sub-headers (e.g. `inc/crt/win32/` vs `inc/crt/linux/`). In those cases simply include only the relevant sub-headers inside the platform folder's `inc/`, matching the FB structure.
- `examples/` and `docs/` are platform-agnostic and never duplicated inside platform folders.
- Each `.zip` is a self-contained bundle — a user should be able to unzip and drop the contents directly into their FB install. It contains `inc/`, `examples/`, `docs/`, and the binaries for that platform.
- **Bundle format:** Windows bundles use `.zip`, Linux bundles use `.tar.gz`. This is not just convention — `tar.gz` preserves Unix file permissions and symlinks, which Linux shared libraries depend on (e.g. `libz.so` → `libz.so.1` → `libz.so.1.2.13`). Zip does not reliably preserve these, so a zipped Linux bundle may produce a broken library after extraction.
- Not every platform slot needs to be filled before a PR is accepted. A win32-only contribution is perfectly valid — leave the other platform folders absent and mark them as `⬜` in `STATUS.md`.

---

## Library README template

Every library folder needs a `README.md`. Copy this template and fill it in:

```markdown
# LibraryName

Brief one-line description of what this library does.

## Versions in this archive

| Version | Matches FB 1.10.1 header | Win32 | Win64 | Linux32 | Linux64 | Tested |
|---|---|---|---|---|---|---|
| x.y.z | ✅ / ❌ | ✅ / ⬜ | ✅ / ⬜ | ✅ / ⬜ | ✅ / ⬜ | ✅ / ⬜ |

## Official links

- Homepage: 
- Source: 
- License: 

## Notes

Any known quirks, build notes, version mismatches, or linking tips go here.
```

---

## Header version inspection

When inspecting a `.bi` file to find what library version it was translated from, look for:

- A comment block near the top of the file (often says `' Translated from libfoo.h version x.y.z`)
- `#define` constants like `LIBFOO_VERSION` or `LIBFOO_MAJOR` / `LIBFOO_MINOR` / `LIBFOO_MICRO`
- A git commit reference or translator note

If you cannot determine the version from the header alone, note it as `❓` and describe what you found — someone else may be able to cross-reference it.

---

## Submitting a PR

1. Fork the repository
2. Create a branch named after what you're adding, e.g. `add-sqlite3` or `fix-curl-version`
3. Add your files under `libraries/libname/` following the bundle structure above
4. Update `STATUS.md` to reflect the new state of the library you touched
5. Open a pull request with a short description of what you added and how you tested it

If you are not comfortable with git or pull requests, opening an issue with the files attached is also fine — we will take it from there.

---

## Questions?

Open an issue — no question is too small. This is a community project and we would rather help you contribute than lose a contribution to confusion.
