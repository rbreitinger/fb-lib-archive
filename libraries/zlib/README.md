# zlib

A general purpose lossless data compression library.
zlib is free, legally unencumbered, and available on virtually every platform.

## Versions in this archive

| Version | Matches FB 1.10.1 header | Win32 | Win64 | Linux32 | Linux64 | Tested |
|---|---|---|---|---|---|---|
| 1.2.8 | ✅ | ✅ | ❌ | ⬜ | ⬜ | ✅ |

> **Win64 status:** No verified 1.2.8 win64 binary could be found or built.
> The NSIS package labelled `Zlib-1.2.8-win64-AMD64.zip` actually contains a 1.2.11 DLL.
> FreeBASIC 1.10.1's own `bin/win64/zlib1.dll` is also 1.2.11.
> Building from source requires a full MinGW64 toolchain — FB's bundled `bin/win64/gcc.exe`
> has no C standard library headers and cannot compile C source directly.
> A win64 1.2.8 build is open for contribution from anyone with a proper MinGW64 setup.

## Official links

- Homepage: https://zlib.net/
- Source: https://github.com/madler/zlib/releases/tag/v1.2.8
- License: zlib/libpng license (free, no restrictions on use)
- Manual: https://zlib.net/manual.html

## FreeBASIC header

`inc/zlib.bi` — translated by the FreeBASIC development team
based on `zlib.h` version 1.2.8, April 28th, 2013.

The header defines `#inclib "z"` so no explicit `#inclib` is needed in your code —
just `#include once "zlib.bi"` and link against `libz.dll.a` (dynamic) or `libz.a` (static).

## Binary sources

**Win32** — built from unmodified 1.2.8 source:
- Source: https://github.com/madler/zlib/archive/refs/tags/v1.2.8.tar.gz
- Built with: MinGW32 (CodeBlocks) using `mingw32-make -f win32/Makefile.gcc`
- Built by: rbreitinger
- Verified: `file zlib1.dll` → `PE32 executable Intel 80386`
- Self-test: `example.exe` passed all tests (`*** zlib test OK ***`)

**Win64** — not available for 1.2.8
- No prebuilt 1.2.8 win64 binary found from any trusted source
- NSIS `Zlib-1.2.8-win64-AMD64.zip` contains a 1.2.11 DLL despite its name
- FreeBASIC 1.10.1's own `bin/win64/zlib1.dll` is also 1.2.11
- Building from source requires a full MinGW64 toolchain (not included in FB or CodeBlocks/MinGW32)
- **Help wanted** — see `CONTRIBUTING.md`

## Files in this bundle

```
zlib-1.2.8/
├── inc/
│   └── zlib.bi               ← FB 1.10.1 header (unmodified)
├── examples/
│   └── zlib_example.bas      ← compress/uncompress roundtrip example
├── docs/
│   └── (see zlib manual link above — no redistributable manual available)
└── win32/
    ├── bin/zlib1.dll
    └── lib/libz.a            ← static lib
        libz.dll.a            ← import lib (use this for dynamic linking)
```

## Linking notes

**Dynamic linking (recommended):**
```
fbc yourfile.bas -l z
```
Place `zlib1.dll` next to your executable or in your PATH.

**Static linking:**
```
fbc yourfile.bas win32/lib/libz.a
```
No DLL needed at runtime when linking statically.

## Notes

- The `uLong_` and `Byte_` types in the header are renamed from the C originals
  (`uLong` → `uLong_`, `Byte` → `Byte_`) to avoid conflicts with FB reserved keywords.
- The `.lib` files shipped inside the official FreeBASIC 1.10.1 `/lib/` folder produce
  undefined reference errors when linking against `zlib.bi`. The builds provided in this
  bundle have been verified to link and run correctly — this is precisely why this archive exists.
- Linux builds are open for contribution — see `CONTRIBUTING.md` in the repo root.
