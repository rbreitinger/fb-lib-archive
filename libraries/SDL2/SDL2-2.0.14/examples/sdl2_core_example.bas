' SDL2 core example - window, renderer, event loop
' FreeBASIC 1.10.1 - fb-lib-archive SDL2-2.0.14
'
' Demonstrates:
'   - SDL_Init / SDL_Quit
'   - SDL_CreateWindow / SDL_CreateRenderer
'   - SDL_SetRenderDrawColor / SDL_RenderFillRect
'   - SDL_PollEvent event loop (quit on window close or Escape)
'   - SDL_RenderPresent with capped framerate via SDL_Delay
'
' Compile (win32): fbc sdl2_core_example.bas -l SDL2
' Compile (win64): fbc64 sdl2_core_example.bas -l SDL2
' Required DLLs:  SDL2.dll

#include once "SDL2/SDL.bi"

Const SCREEN_W = 640
Const SCREEN_H = 480
Const TITLE    = "SDL2 Core Example"

' --- init ---
If SDL_Init(SDL_INIT_VIDEO) <> 0 Then
    Print "SDL_Init failed: "; *SDL_GetError()
    End 1
End If

Dim As SDL_Window Ptr win = SDL_CreateWindow( _
    TITLE, _
    SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, _
    SCREEN_W, SCREEN_H, _
    SDL_WINDOW_SHOWN)

If win = 0 Then
    Print "SDL_CreateWindow failed: "; *SDL_GetError()
    SDL_Quit()
    End 1
End If

Dim As SDL_Renderer Ptr ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED Or SDL_RENDERER_PRESENTVSYNC)

If ren = 0 Then
    Print "SDL_CreateRenderer failed: "; *SDL_GetError()
    SDL_DestroyWindow(win)
    SDL_Quit()
    End 1
End If

' --- main loop ---
Dim As SDL_Event evt
Dim As Long running = 1

Dim As SDL_Rect rects(3)

' four colored rectangles arranged in corners
rects(0) = Type<SDL_Rect>(40,  40,  160, 120)
rects(1) = Type<SDL_Rect>(440, 40,  160, 120)
rects(2) = Type<SDL_Rect>(40,  320, 160, 120)
rects(3) = Type<SDL_Rect>(440, 320, 160, 120)

Do While running

    ' --- events ---
    Do While SDL_PollEvent(@evt)
        Select Case evt.type
            Case SDL_QUIT_
                running = 0
            Case SDL_KEYDOWN
                If evt.key.keysym.sym = SDLK_ESCAPE Then running = 0
        End Select
    Loop

    ' --- render ---
    ' clear to dark grey
    SDL_SetRenderDrawColor(ren, 30, 30, 30, 255)
    SDL_RenderClear(ren)

    ' top-left  — red
    SDL_SetRenderDrawColor(ren, 220, 50, 50, 255)
    SDL_RenderFillRect(ren, @rects(0))

    ' top-right - green
    SDL_SetRenderDrawColor(ren, 50, 200, 80, 255)
    SDL_RenderFillRect(ren, @rects(1))

    ' bottom-left - blue
    SDL_SetRenderDrawColor(ren, 60, 120, 220, 255)
    SDL_RenderFillRect(ren, @rects(2))

    ' bottom-right - yellow
    SDL_SetRenderDrawColor(ren, 220, 200, 50, 255)
    SDL_RenderFillRect(ren, @rects(3))

    ' cross-hair lines through center
    SDL_SetRenderDrawColor(ren, 180, 180, 180, 255)
    SDL_RenderDrawLine(ren, SCREEN_W \ 2, 0, SCREEN_W \ 2, SCREEN_H)
    SDL_RenderDrawLine(ren, 0, SCREEN_H \ 2, SCREEN_W, SCREEN_H \ 2)

    SDL_RenderPresent(ren)
    SDL_Delay(16)

Loop

' --- cleanup ---
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
