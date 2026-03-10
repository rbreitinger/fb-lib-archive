' SDL2_image example - load and display a PNG with blend animation
' FreeBASIC 1.10.1 - fb-lib-archive SDL2-2.0.14
'
' Demonstrates:
'   - IMG_Init / IMG_Quit with PNG support
'   - IMG_Load to load a PNG from disk
'   - SDL_CreateTextureFromSurface
'   - SDL_QueryTexture to get image dimensions
'   - SDL_SetTextureBlendMode for PNG alpha transparency
'   - SDL_SetTextureAlphaMod for animated texture fade
'   - Animated background cycling white to black and back
'   - Rendering the image centered on screen
'
' Compile (win32): fbc sdl2_image_example.bas -l SDL2 -l SDL2_image
' Compile (win64): fbc64 sdl2_image_example.bas -l SDL2 -l SDL2_image
' Required DLLs:  SDL2.dll, SDL2_image.dll, libpng16-16.dll, libjpeg-9.dll,
'                 libtiff-5.dll, libwebp-7.dll, zlib1.dll
' Required asset: test.png  (place next to the executable)

#include once "SDL2/SDL.bi"
#include once "SDL2/SDL_image.bi"

Const SCREEN_W   = 640
Const SCREEN_H   = 480
Const TITLE      = "SDL2_image Example"
Const IMAGE_FILE = "test.png"

' --- init SDL2 ---
If SDL_Init(SDL_INIT_VIDEO) <> 0 Then
    Print "SDL_Init failed: "; *SDL_GetError()
    End 1
End If

' --- init SDL2_image with PNG support ---
If (IMG_Init(IMG_INIT_PNG) And IMG_INIT_PNG) = 0 Then
    Print "IMG_Init failed: "; *IMG_GetError()
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
    IMG_Quit()
    SDL_Quit()
    End 1
End If

Dim As SDL_Renderer Ptr ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED Or SDL_RENDERER_PRESENTVSYNC)

If ren = 0 Then
    Print "SDL_CreateRenderer failed: "; *SDL_GetError()
    SDL_DestroyWindow(win)
    IMG_Quit()
    SDL_Quit()
    End 1
End If

' --- load image ---
Dim As SDL_Surface Ptr surf = IMG_Load(IMAGE_FILE)
If surf = 0 Then
    Print "IMG_Load failed: "; *IMG_GetError()
    Print "Make sure "; IMAGE_FILE; " is in the same folder as the executable."
    SDL_DestroyRenderer(ren)
    SDL_DestroyWindow(win)
    IMG_Quit()
    SDL_Quit()
    End 1
End If

Dim As SDL_Texture Ptr tex = SDL_CreateTextureFromSurface(ren, surf)
SDL_FreeSurface(surf)

If tex = 0 Then
    Print "SDL_CreateTextureFromSurface failed: "; *SDL_GetError()
    SDL_DestroyRenderer(ren)
    SDL_DestroyWindow(win)
    IMG_Quit()
    SDL_Quit()
    End 1
End If

' --- enable alpha blending on the texture ---
SDL_SetTextureBlendMode(tex, SDL_BLENDMODE_BLEND)

' --- get image size and center it ---
Dim As Long imgW, imgH
SDL_QueryTexture(tex, 0, 0, @imgW, @imgH)

Dim As SDL_Rect dst
dst.x = (SCREEN_W - imgW) \ 2
dst.y = (SCREEN_H - imgH) \ 2
dst.w = imgW
dst.h = imgH

' --- animation state ---
' bg oscillates 0..255 (white to black and back)
' alpha oscillates 0..255 (texture fade in/out)
' both run at different speeds for an interesting offset
Dim As Long bgVal    = 255   ' start white
Dim As Long bgDir    = -1    ' stepping down first
Dim As Long alphaVal = 0     ' start invisible
Dim As Long alphaDir = 1     ' stepping up first

' --- main loop ---
Dim As SDL_Event evt
Dim As Long running = 1

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

    ' --- animate background (step 2 per frame - slower) ---
    bgVal += bgDir * 2
    If bgVal <= 0 Then
        bgVal = 0
        bgDir = 1
    ElseIf bgVal >= 255 Then
        bgVal = 255
        bgDir = -1
    End If

    ' --- animate texture alpha (step 3 per frame - slightly faster) ---
    alphaVal += alphaDir * 3
    If alphaVal <= 0 Then
        alphaVal = 0
        alphaDir = 1
    ElseIf alphaVal >= 255 Then
        alphaVal = 255
        alphaDir = -1
    End If

    ' --- render ---
    SDL_SetRenderDrawColor(ren, bgVal, bgVal, bgVal, 255)
    SDL_RenderClear(ren)

    SDL_SetTextureAlphaMod(tex, alphaVal)
    SDL_RenderCopy(ren, tex, 0, @dst)

    SDL_RenderPresent(ren)
    SDL_Delay(16)

Loop

' --- cleanup ---
SDL_DestroyTexture(tex)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
IMG_Quit()
SDL_Quit()
