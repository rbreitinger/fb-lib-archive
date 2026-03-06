' zlib 1.2.8 - basic usage example for FreeBASIC 1.10.1
' demonstrates: compress and uncompress a string in memory
'
' compile: fbc zlib_example.bas
' requires: zlib1.dll in the same folder or in your PATH

#include once "zlib.bi"

' --- compress a string into a buffer ---
Dim As String src_str = "Hello from FreeBASIC! zlib compression test. " & _
                        "The quick brown fox jumps over the lazy dog."

Dim As uLong_  src_len  = Len(src_str)
Dim As uLong_  dest_len = compressBound(src_len)

Dim As ubyte Ptr src_buf  = Allocate(src_len)
Dim As ubyte Ptr comp_buf = Allocate(dest_len)

fb_MemCopy(src_buf, StrPtr(src_str), src_len)

Dim As Long res = compress(comp_buf, @dest_len, src_buf, src_len)

If res <> Z_OK Then
    Print "compress() failed with code: " & res
    DeAllocate(src_buf)
    DeAllocate(comp_buf)
    End 1
End If

Print "Original size  : " & src_len  & " bytes"
Print "Compressed size: " & dest_len & " bytes"

' --- uncompress back and verify ---
Dim As uLong_  uncomp_len = src_len
Dim As ubyte Ptr uncomp_buf = Allocate(uncomp_len)

res = uncompress(uncomp_buf, @uncomp_len, comp_buf, dest_len)

If res <> Z_OK Then
    Print "uncompress() failed with code: " & res
    DeAllocate(src_buf)
    DeAllocate(comp_buf)
    DeAllocate(uncomp_buf)
    End 1
End If

Dim As String uncomp_str = String(uncomp_len, 0)
fb_MemCopy(StrPtr(uncomp_str), uncomp_buf, uncomp_len)

If uncomp_str = src_str Then
    Print "Roundtrip OK   : original and uncompressed strings match"
Else
    Print "Roundtrip FAIL : mismatch!"
End If

Print "zlib version   : " & *zlibVersion()

DeAllocate(src_buf)
DeAllocate(comp_buf)
DeAllocate(uncomp_buf)

Sleep
