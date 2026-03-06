# fb-lib-archive — Library Status

> **FreeBASIC target:** 1.10.1 — all bundles in this table live under `libraries/freebasic-1-10-1/`  
> **Legend:**  
> ✅ Done &nbsp;|&nbsp; 🔧 In progress &nbsp;|&nbsp; ⬜ Open / help wanted &nbsp;|&nbsp; ❌ Not available &nbsp;|&nbsp; ❓ Unknown  
> **Target version** = version the FB 1.10.1 `.bi` header was translated from (to be filled by inspecting each `.bi`)

---

## External Libraries (require DLL / .lib / .so gathering)

### 🔊 Audio

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| OpenAL | `AL/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| BASS | `bass.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| BASSmod | `bassmod.bi` | ❓ | ⬜ | ⬜ | ❌ | ⬜ | ⬜ |
| FMOD | `fmod.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| ModPlug | `modplug.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| mpg123 | `mpg123.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libogg | `ogg/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| PortAudio | `portaudio.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libsndfile | `sndfile.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| SoLoud | `soloud_c.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libvorbis | `vorbis/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🎨 Graphics / 2D

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| Allegro 4 | `allegro.bi`, `allegro/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Allegro 5 | `allegro5/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Cairo | `cairo/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Canvas Draw (CD) | `cd/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| FreeImage | `FreeImage.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libgd | `gd.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| DevIL | `IL/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| IM (image lib) | `im/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libart | `libart_lgpl/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libpng | `png.bi`, `png12-16.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| giflib | `gif_lib.bi`, `gif_lib4.bi`, `gif_lib5.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libjpeg | `jpeglib.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Raylib | `raylib.bi`, `raymath.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| SDL 1.x (+ GFX/image/mixer/net/ttf) | `SDL/` | ❓ | ⬜ | ❌ | ⬜ | ⬜ | ⬜ | ⬜ |
| SDL 2.x (+ GFX/image/mixer/net/ttf) | `SDL2/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| TinyPTC | `tinyptc.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GDK / GDK-PixBuf | `gdk/`, `gdk-pixbuf/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🟦 OpenGL / Window context

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| OpenGL (system) | `GL/gl.bi`, `GL/glext.bi`, `GL/glu.bi` | — | ✅ | ✅ | ⬜ | ⬜ | ⬜ | ⬜ |
| freeglut | `GL/freeglut*.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GLFW 2 | `GL/glfw.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GLFW 3 | `GLFW/glfw3.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GtkGLExt | `gtkgl/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Mesa (GL headers) | `GL/mesa/` | — | — | — | ⬜ | ⬜ | ⬜ | ⬜ |

### 🖼️ GUI Toolkits

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| CGUI | `cgui.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| DISLIN | `dislin.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Glade | `glade/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GooCanvas | `goocanvas.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GTK 2/3 | `gtk/`, `atk/`, `gio/`, `glib*.bi`, `gmodule.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| IUP | `IUP/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| JAPI | `japi.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| wxWidgets (wx-c) | `wx-c/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🔤 Fonts / Text rendering

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| Flite TTS | `flite/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| fontconfig | `fontconfig/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| FreeType 2 | `freetype2/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Pango | `pango/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### ⚙️ Physics

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| Chipmunk | `chipmunk/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| Newton | `Newton.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| ODE | `ode/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 📦 Compression

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| bzip2 | `bzlib.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| LZMA / liblzma | `lzma.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| LZO | `lzo/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| QuickLZ | `quicklz.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libzip | `zip.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| zlib | `zlib.bi` | 1.2.8 | ✅ | ❌ | ⬜ | ⬜ | ✅ | ✅ |

### 🗄️ Databases

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| GDBM | `gdbm.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| MariaDB | `mariadb.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| MySQL | `mysql/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| PostgreSQL | `postgresql/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| SQLite 2 | `sqlite2.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| SQLite 3 | `sqlite3.bi`, `sqlite3ext.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🌐 Networking / Web / IPC

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| CGI-util | `cgi-util.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libcurl | `curl.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| FastCGI | `fastcgi/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| ZeroMQ | `zmq/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 📜 Scripting engines

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| Lua | `Lua/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| SpiderMonkey (JS) | `spidermonkey/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 📄 XML / JSON / Data formats

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| Expat | `expat.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| JSON-C | `json-c/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libxml2 | `libxml/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libexslt | `libexslt/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libxslt | `libxslt/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| MiniXML | `mxml.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| XMP toolkit | `xmp.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🔢 Math / Science

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| BigInt | `big_int/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GMP | `gmp.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GSL | `gsl/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🔍 Regular expressions

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| PCRE (v1) | `pcre.bi`, `pcre16.bi`, `pcre32.bi`, `pcre-common.bi`, `pcreposix.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| PCRE2 | `pcre2.bi`, `pcre2posix.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| TRE | `tre/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🎬 Media / Multimedia

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| MediaInfo | `MediaInfo.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libVLC | `vlc/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🔐 Crypto / Security

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| cryptlib | `cryptlib.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🌍 Internationalization / Text encoding

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| aspell | `aspell.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| gettext-po | `gettext-po.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libiconv | `libiconv.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| libintl | `libintl.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| pspell | `pspell.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| utf_conv | `utf_conv.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

### 🛠️ Developer tools / Bindings / Misc

| Library | Inc path(s) | Target version | Win32 | Win64 | Linux32 | Linux64 | Tested | Examples |
|---|---|---|---|---|---|---|---|
| BFD (binutils) | `bfd.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| clang-c | `clang-c.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| CUnit | `CUnit/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| DispHelper | `disphelper/` | ❓ | ⬜ | — | — | — | ⬜ | ⬜ |
| FFI (libffi) | `ffi.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| JAPI | `japi.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| JIT (libjit) | `jit.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| JNI (Java) | `jni.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| LLVM-C | `llvm-c.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| PDFlib | `pdflib.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| UUID | `uuid.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GRX | `grx/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| GDSL (data structures) | `gdsl/` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| caca / libcaca | `caca.bi`, `caca0.bi` | ❓ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

---

## Platform / OS-provided headers (no DLL gathering needed)

These are included for completeness. No binary bundles required — they ship with the OS or are built into the FB runtime.

| Header group | Inc path(s) | Notes |
|---|---|---|
| FB Runtime | `fbgfx.bi`, `fbio.bi`, `fblimits.bi`, `fbprng.bi`, `fbthread.bi`, `fbc-int/` | Built into FB |
| FB Compat helpers | `vbcompat.bi`, `datetime.bi`, `string.bi`, `dir.bi`, `file.bi` | Built into FB |
| C Runtime wrappers | `crt/` | FB's abstraction over the C stdlib |
| Windows API | `win/`, `windows.bi` | Provided by Windows / MinGW |
| X Window System | `X11/`, `xcb/` | Provided by Linux X server packages |
| DOS / DJGPP | `dos/` | DOS platform specific |

---

## Next Steps

1. **Fill in target versions** — open each root `.bi` and look for version comments or `#define` version strings
2. **Start with high-value, easy wins** — `zlib`, `sqlite3`, `libcurl`, `SDL2`, `OpenAL` are widely used and well-preserved
3. **All bundles go under `libraries/freebasic-1-10-1/`** — future FB releases get their own sibling folder
4. **Linux builds needed** — see `CONTRIBUTING.md` for how to contribute `.so` / `.a` builds for any library in this table
