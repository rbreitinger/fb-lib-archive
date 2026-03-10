# SDL2 (suite)

A cross-platform multimedia library providing low-level access to audio, keyboard,
mouse, joystick, and graphics hardware. This bundle packages SDL2 core together with
its official satellite libraries so you have everything needed for a full 2D game or
multimedia application in one place.

## Components in this bundle

| Component | Version | Matches FB 1.10.1 header | Win32 | Win64 | Linux32 | Linux64 | Tested |
|---|---|---|---|---|---|---|---|
| SDL2 core | 2.0.14 | ✅ | ✅ | ✅ | ⬜ | ⬜ | ✅ |
| SDL2_image | 2.0.5 | ✅ | ✅ | ✅ | ⬜ | ⬜ | ✅ |
| SDL2_mixer | 2.0.4 | ✅ | ✅ | ✅ | ⬜ | ⬜ | ✅ |
| SDL2_ttf | 2.0.15 | ✅ | ✅ | ✅ | ⬜ | ⬜ | ✅ |
| SDL2_net | 2.0.1 | ✅ | ❌ | ❌ | ⬜ | ⬜ | ❌ |

> **SDL2_net status:** No prebuilt win32 or win64 binary for 2.0.1 could be found from
> any trusted source. The old libsdl.org project download pages for SDL2_net are no
> longer available and the SDL_net GitHub releases only carry binary assets from
> version 2.2.x onwards. Building from source with MinGW32 is possible but has not
> been done yet. **Help wanted** — see `CONTRIBUTING.md`.

## Official links

| Component | Homepage | Source | License |
|---|---|---|---|
| SDL2 core | https://www.libsdl.org/ | https://github.com/libsdl-org/SDL/releases/tag/release-2.0.14 | zlib |
| SDL2_image | https://www.libsdl.org/projects/SDL_image/ | https://github.com/libsdl-org/SDL_image | zlib |
| SDL2_mixer | https://www.libsdl.org/projects/SDL_mixer/ | https://github.com/libsdl-org/SDL_mixer | zlib |
| SDL2_ttf | https://www.libsdl.org/projects/SDL_ttf/ | https://github.com/libsdl-org/SDL_ttf | zlib |
| SDL2_net | https://www.libsdl.org/projects/SDL_net/ | https://github.com/libsdl-org/SDL_net | zlib |

All SDL2 components are released under the **zlib license** — free for any use
including commercial, no attribution required in binary releases.

## FreeBASIC headers

All headers live under `inc/SDL2/` to mirror FreeBASIC 1.10.1's own `inc/SDL2/` layout:

| Header | Component | Translated from | Binary |
|---|---|---|---|
| `SDL2/SDL.bi` | SDL2 core | SDL2 2.0.14 | ✅ |
| `SDL2/SDL_image.bi` | SDL2_image | SDL2_image 2.0.5 | ✅ |
| `SDL2/SDL_mixer.bi` | SDL2_mixer | SDL2_mixer 2.0.4 | ✅ |
| `SDL2/SDL_ttf.bi` | SDL2_ttf | SDL2_ttf 2.0.15 | ✅ |
| `SDL2/SDL_net.bi` | SDL2_net | SDL2_net 2.0.1 | ❌ header only |
| `SDL2/SDL2_gfx_framerate.bi` | SDL2_gfx | SDL2_gfx 1.0.4 | ❌ header only |
| `SDL2/SDL2_gfx_imageFilter.bi` | SDL2_gfx | SDL2_gfx 1.0.4 | ❌ header only |
| `SDL2/SDL2_gfx_primitives.bi` | SDL2_gfx | SDL2_gfx 1.0.4 | ❌ header only |
| `SDL2/SDL2_gfx_primitives_font.bi` | SDL2_gfx | SDL2_gfx 1.0.4 | ❌ header only |
| `SDL2/SDL2_gfx_rotozoom.bi` | SDL2_gfx | SDL2_gfx 1.0.4 | ❌ header only |

> **SDL2_gfx status:** FreeBASIC 1.10.1 ships five SDL2_gfx headers translated from
> SDL2_gfx 1.0.4, covering drawing primitives, image filters, rotozoom and framerate
> management. SDL2_gfx is a third-party library, not an official SDL satellite.
> No binary is included in this bundle — SDL2_gfx 1.0.4 is a candidate for a
> separate future bundle.

Each component header defines its own `#inclib` directive so no manual `#inclib`
is needed — just `#include once "SDL2/SDL.bi"` etc. and link against the matching
`.dll.a` import library.

## Binary sources

All Windows binaries are official releases built by the SDL development team (Valve).
Verified via `pkgconfig` version fields and `.la` file build paths.

**SDL2 core 2.0.14 — win32 + win64**
- Source: https://libsdl.org/release/SDL2-2.0.14-win32-x86.zip (runtime)
- Source: https://libsdl.org/release/SDL2-2.0.14-win32-x64.zip (runtime)
- Devel package: `SDL2-devel-2.0.14-mingw.tar.gz` (import libs)
- Verified: `sdl2.pc` → `Version: 2.0.14`, `.la` libdir → `SDL2-2.0.14`

**SDL2_image 2.0.5 — win32 + win64**
- Devel package: `SDL2_image-devel-2.0.5-mingw.tar.gz`
- Verified: `SDL2_image.pc` → `Version: 2.0.5`, `.la` libdir → `SDL2_image-2.0.5`
- Bundled dependencies: `libjpeg-9.dll`, `libpng16-16.dll`, `libtiff-5.dll`,
  `libwebp-7.dll`, `zlib1.dll`

**SDL2_mixer 2.0.4 — win32 + win64**
- Devel package: `SDL2_mixer-devel-2.0.4-mingw.tar.gz`
- Verified: `SDL2_mixer.pc` → `Version: 2.0.4`, `.la` libdir → `SDL2_mixer-2.0.4`
- Bundled dependencies: `libFLAC-8.dll`, `libmodplug-1.dll`, `libmpg123-0.dll`,
  `libogg-0.dll`, `libopus-0.dll`, `libopusfile-0.dll`, `libvorbis-0.dll`,
  `libvorbisfile-3.dll`

**SDL2_ttf 2.0.15 — win32 + win64**
- Source: https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-2.0.15-mingw.tar.gz
- Verified: `SDL2_ttf.pc` → `Version: 2.0.15`, `.la` libdir → `SDL2_ttf-2.0.15`
- Bundled dependencies: `libfreetype-6.dll`, `zlib1.dll`

**SDL2_net 2.0.1 — not available**
- No trusted prebuilt binary found for this version
- Header included for completeness, no binaries shipped

## Files in this bundle

```
SDL2-2.0.14/
├── inc/
│   └── SDL2/
│       ├── SDL.bi
│       ├── SDL_image.bi
│       ├── SDL_mixer.bi
│       ├── SDL_ttf.bi
│       ├── SDL_net.bi              <- header only, no binary
│       ├── SDL2_gfx_framerate.bi   <- header only, no binary
│       ├── SDL2_gfx_imageFilter.bi <- header only, no binary
│       ├── SDL2_gfx_primitives.bi  <- header only, no binary
│       ├── SDL2_gfx_primitives_font.bi
│       └── SDL2_gfx_rotozoom.bi    <- header only, no binary
├── examples/
│   ├── sdl2_core_example.bas
│   ├── sdl2_image_example.bas
│   ├── sdl2_mixer_example.bas
│   ├── sdl2_ttf_example.bas
│   ├── test.png                    <- test asset for sdl2_image_example
│   ├── test.wav                    <- test asset for sdl2_mixer_example
│   └── DejaVuSans.ttf              <- test asset for sdl2_ttf_example
├── docs/
│   ├── LICENSE.FLAC.txt
│   ├── LICENSE.freetype.txt
│   ├── LICENSE.jpeg.txt
│   ├── LICENSE.modplug.txt
│   ├── LICENSE.mpg123.txt
│   ├── LICENSE.ogg-vorbis.txt
│   ├── LICENSE.opus.txt
│   ├── LICENSE.opusfile.txt
│   ├── LICENSE.png.txt
│   ├── LICENSE.tiff.txt
│   ├── LICENSE.webp.txt
│   └── LICENSE.zlib.txt
├── win32/
│   ├── bin/
│   │   ├── SDL2.dll
│   │   ├── SDL2_image.dll
│   │   ├── SDL2_mixer.dll
│   │   ├── SDL2_ttf.dll
│   │   ├── libfreetype-6.dll       <- SDL2_ttf dependency
│   │   ├── libFLAC-8.dll           <- SDL2_mixer dependency
│   │   ├── libjpeg-9.dll           <- SDL2_image dependency
│   │   ├── libmodplug-1.dll        <- SDL2_mixer dependency
│   │   ├── libmpg123-0.dll         <- SDL2_mixer dependency
│   │   ├── libogg-0.dll            <- SDL2_mixer dependency
│   │   ├── libopus-0.dll           <- SDL2_mixer dependency
│   │   ├── libopusfile-0.dll       <- SDL2_mixer dependency
│   │   ├── libpng16-16.dll         <- SDL2_image dependency
│   │   ├── libtiff-5.dll           <- SDL2_image dependency
│   │   ├── libvorbis-0.dll         <- SDL2_mixer dependency
│   │   ├── libvorbisfile-3.dll     <- SDL2_mixer dependency
│   │   ├── libwebp-7.dll           <- SDL2_image dependency
│   │   └── zlib1.dll               <- SDL2_image + SDL2_ttf dependency
│   └── lib/
│       ├── libSDL2.dll.a
│       ├── libSDL2.a
│       ├── libSDL2main.a
│       ├── libSDL2_image.dll.a
│       ├── libSDL2_image.a
│       ├── libSDL2_mixer.dll.a
│       ├── libSDL2_mixer.a
│       ├── libSDL2_ttf.dll.a
│       └── libSDL2_ttf.a
├── win64/
│   ├── bin/                        <- same DLL set as win32, 64-bit builds
│   └── lib/                        <- same import libs as win32, 64-bit builds
├── SDL2-2.0.14-win32.zip
└── SDL2-2.0.14-win64.zip
```

## Examples

All examples are in `examples/` and ship with the required test assets.

**sdl2_core_example.bas** — no assets needed
Opens a 640x480 window and renders four colored rectangles in the corners with
crosshair lines through the center. Demonstrates SDL_Init, SDL_CreateWindow,
SDL_CreateRenderer, SDL_SetRenderDrawColor, SDL_RenderFillRect, SDL_RenderDrawLine
and a clean event loop with quit on window close or Escape.

**sdl2_image_example.bas** — requires `test.png`
Loads a PNG with full alpha transparency support and displays it centered on screen.
The background cycles smoothly from white to black and back while the texture
simultaneously fades in and out at a different rate, demonstrating
SDL_SetTextureBlendMode and SDL_SetTextureAlphaMod in action.

**sdl2_mixer_example.bas** — requires `test.wav`
Opens the audio device, loads and plays a WAV file, waits for playback to finish
and exits cleanly. OGG files work too - just update the filename constant.
Demonstrates Mix_OpenAudio, Mix_LoadWAV, Mix_PlayChannel and Mix_Playing.

**sdl2_ttf_example.bas** — requires `DejaVuSans.ttf`
Renders two lines of antialiased TrueType text centered on a dark background -
one in white, one in gold. Demonstrates TTF_OpenFont, TTF_RenderUTF8_Blended
and rendering text via SDL_CreateTextureFromSurface.



**Compile with SDL2 core only (win32):**
```
fbc yourfile.bas -l SDL2
```

**Compile with satellites as needed (win32):**
```
fbc yourfile.bas -l SDL2 -l SDL2_image
fbc yourfile.bas -l SDL2 -l SDL2_mixer
fbc yourfile.bas -l SDL2 -l SDL2_ttf
```

**Compile 64-bit:**
```
fbc64 yourfile.bas -l SDL2
```

Place all DLLs from `win32/bin/` next to your executable. You only strictly need the
DLLs for the components you actually use, but shipping the full set is the easiest
approach and avoids runtime surprises.

## Runtime DLL checklist

| You use | Required DLLs at runtime |
|---|---|
| SDL2 core only | `SDL2.dll` |
| + SDL2_image | `SDL2_image.dll`, `libjpeg-9.dll`, `libpng16-16.dll`, `libtiff-5.dll`, `libwebp-7.dll`, `zlib1.dll` |
| + SDL2_mixer | `SDL2_mixer.dll`, `libFLAC-8.dll`, `libmodplug-1.dll`, `libmpg123-0.dll`, `libogg-0.dll`, `libopus-0.dll`, `libopusfile-0.dll`, `libvorbis-0.dll`, `libvorbisfile-3.dll` |
| + SDL2_ttf | `SDL2_ttf.dll`, `libfreetype-6.dll`, `zlib1.dll` |

## Notes

- `SDL2_image` dynamically loads format-specific DLLs at runtime (libpng, libjpeg etc.)
  — all are bundled here so no separate downloads are needed.
- `SDL2_mixer` dynamically loads audio codec DLLs at runtime (libvorbis, libmpg123 etc.)
  — same, all bundled.
- `zlib1.dll` is shared between SDL2_image and SDL2_ttf — only one copy is needed,
  both components ship the same version.
- `libSDL2main.a` is required for the standard Windows entry point. If you get an
  unresolved `WinMain` or `SDL_main` error, add `-l SDL2main` before `-l SDL2`.
- Linux builds are open for contribution — see `CONTRIBUTING.md` in the repo root.
