' SDL2_ttf example - render text using a TrueType font
' FreeBASIC 1.10.1 - fb-lib-archive SDL2-2.0.14
'
' Demonstrates:
'   - TTF_Init / TTF_Quit
'   - TTF_OpenFont to load a TTF file at a given point size
'   - TTF_RenderUTF8_Blended for high-quality antialiased text
'   - SDL_CreateTextureFromSurface + SDL_FreeSurface
'   - Rendering text texture centered on screen
'
' Compile (win32): fbc sdl2_ttf_example.bas -l SDL2 -l SDL2_ttf
' Compile (win64): fbc64 sdl2_ttf_example.bas -l SDL2 -l SDL2_ttf
' Required DLLs:  SDL2.dll, SDL2_ttf.dll, libfreetype-6.dll, zlib1.dll
' Required asset: DejaVuSans.ttf  (place next to the executable)

#include once "SDL2/SDL.bi"
#include once "SDL2/SDL_ttf.bi"

Const SCREEN_W  = 640
Const SCREEN_H  = 480
Const TITLE     = "SDL2_ttf Example"
Const FONT_FILE = "DejaVuSans.ttf"
Const FONT_SIZE = 36

' --- init SDL2 ---
If SDL_Init(SDL_INIT_VIDEO) <> 0 Then
    Print "SDL_Init failed: "; *SDL_GetError()
    End 1
End If

' --- init SDL2_ttf ---
If TTF_Init() <> 0 Then
    Print "TTF_Init failed: "; *TTF_GetError()
    SDL_Quit()
    End 1
End If

Dim As SDL_Window Ptr win = SDL_CreateWindow( _
    TITLE, _
    SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, _
    SCREEN_W, SCREEN_H, _
    SDL_WINDOW_SHOWN)

If win = 0 Then
    Print "SDL_CreateWindow failed: "; *SDL_GetError()
    TTF_Quit()
    SDL_Quit()
    End 1
End If

Dim As SDL_Renderer Ptr ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED Or SDL_RENDERER_PRESENTVSYNC)

If ren = 0 Then
    Print "SDL_CreateRenderer failed: "; *SDL_GetError()
    SDL_DestroyWindow(win)
    TTF_Quit()
    SDL_Quit()
    End 1
End If

' --- load font ---
Dim As TTF_Font Ptr fnt = TTF_OpenFont(FONT_FILE, FONT_SIZE)
If fnt = 0 Then
    Print "TTF_OpenFont failed: "; *TTF_GetError()
    Print "Make sure "; FONT_FILE; " is in the same folder as the executable."
    SDL_DestroyRenderer(ren)
    SDL_DestroyWindow(win)
    TTF_Quit()
    SDL_Quit()
    End 1
End If

' --- render text to texture ---
Dim As SDL_Color clrWhite = Type<SDL_Color>(255, 255, 255, 255)
Dim As SDL_Color clrGold  = Type<SDL_Color>(255, 200,  50, 255)

Dim As SDL_Surface Ptr surf1 = TTF_RenderUTF8_Blended(fnt, "FreeBASIC + SDL2_ttf", clrWhite)
Dim As SDL_Surface Ptr surf2 = TTF_RenderUTF8_Blended(fnt, "SDL2_ttf 2.0.15 works!", clrGold)

Dim As SDL_Texture Ptr tex1 = SDL_CreateTextureFromSurface(ren, surf1)
Dim As SDL_Texture Ptr tex2 = SDL_CreateTextureFromSurface(ren, surf2)

SDL_FreeSurface(surf1)
SDL_FreeSurface(surf2)

' --- position text centered ---
Dim As Long tw1, th1, tw2, th2
SDL_QueryTexture(tex1, 0, 0, @tw1, @th1)
SDL_QueryTexture(tex2, 0, 0, @tw2, @th2)

Dim As SDL_Rect dst1 = Type<SDL_Rect>((SCREEN_W - tw1) \ 2, (SCREEN_H \ 2) - th1 - 10, tw1, th1)
Dim As SDL_Rect dst2 = Type<SDL_Rect>((SCREEN_W - tw2) \ 2, (SCREEN_H \ 2) + 10,        tw2, th2)

' --- main loop ---
Dim As SDL_Event evt
Dim As Long running = 1

Do While running

    Do While SDL_PollEvent(@evt)
        Select Case evt.type
            Case SDL_QUIT_
                running = 0
            Case SDL_KEYDOWN
                If evt.key.keysym.sym = SDLK_ESCAPE Then running = 0
        End Select
    Loop

    SDL_SetRenderDrawColor(ren, 20, 20, 40, 255)
    SDL_RenderClear(ren)
    SDL_RenderCopy(ren, tex1, 0, @dst1)
    SDL_RenderCopy(ren, tex2, 0, @dst2)
    SDL_RenderPresent(ren)
    SDL_Delay(16)

Loop

' --- cleanup ---
SDL_DestroyTexture(tex1)
SDL_DestroyTexture(tex2)
TTF_CloseFont(fnt)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
TTF_Quit()
SDL_Quit()
