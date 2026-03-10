' SDL2_mixer example - load and play audio
' FreeBASIC 1.10.1 - fb-lib-archive SDL2-2.0.14
'
' Demonstrates:
'   - Mix_OpenAudio to open the audio device
'   - Mix_LoadWAV to load a WAV or OGG sound chunk
'   - Mix_PlayChannel to play on any free channel
'   - Mix_Playing to wait until playback finishes
'   - Mix_FreeChunk / Mix_CloseAudio / Mix_Quit cleanup
'
' Compile (win32): fbc sdl2_mixer_example.bas -l SDL2 -l SDL2_mixer
' Compile (win64): fbc64 sdl2_mixer_example.bas -l SDL2 -l SDL2_mixer
' Required DLLs:  SDL2.dll, SDL2_mixer.dll, libFLAC-8.dll, libmodplug-1.dll,
'                 libmpg123-0.dll, libogg-0.dll, libopus-0.dll,
'                 libopusfile-0.dll, libvorbis-0.dll, libvorbisfile-3.dll
' Required asset: test.wav  (place next to the executable)
'                 OGG files work too — just change AUDIO_FILE below

#include once "SDL2/SDL.bi"
#include once "SDL2/SDL_mixer.bi"

Const AUDIO_FILE  = "test.wav"
Const AUDIO_FREQ  = MIX_DEFAULT_FREQUENCY  ' 22050 Hz
Const AUDIO_FMT   = MIX_DEFAULT_FORMAT     ' signed 16-bit native endian
Const AUDIO_CHANS = 2                      ' stereo
Const AUDIO_CHUNK = 2048                   ' buffer size in samples

' --- init SDL2 audio subsystem ---
If SDL_Init(SDL_INIT_AUDIO) <> 0 Then
    Print "SDL_Init failed: "; *SDL_GetError()
    End 1
End If

' --- init SDL2_mixer ---
If Mix_OpenAudio(AUDIO_FREQ, AUDIO_FMT, AUDIO_CHANS, AUDIO_CHUNK) <> 0 Then
    Print "Mix_OpenAudio failed: "; *Mix_GetError()
    SDL_Quit()
    End 1
End If

' --- load sound ---
Dim As Mix_Chunk Ptr snd = Mix_LoadWAV(AUDIO_FILE)
If snd = 0 Then
    Print "Mix_LoadWAV failed: "; *Mix_GetError()
    Print "Make sure "; AUDIO_FILE; " is in the same folder as the executable."
    Mix_CloseAudio()
    Mix_Quit()
    SDL_Quit()
    End 1
End If

' --- play on first free channel, once ---
Print "Playing "; AUDIO_FILE; " ..."
Dim As Long ch = Mix_PlayChannel(-1, snd, 0)

If ch = -1 Then
    Print "Mix_PlayChannel failed: "; *Mix_GetError()
Else
    ' wait for playback to finish
    Do While Mix_Playing(ch)
        SDL_Delay(50)
    Loop
    Print "Done."
End If

' --- cleanup ---
Mix_FreeChunk(snd)
Mix_CloseAudio()
Mix_Quit()
SDL_Quit()
