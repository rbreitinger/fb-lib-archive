#include once "zip.bi"

' ------------------------------------------------------------
' ziptest.bas - libzip 1.0.1 example for FreeBASIC
' Demonstrates: create archive, add files from memory buffers,
' close, reopen, list entries, read file content back.
'
' Compile (dynamic - requires libzip.dll + zlib1.dll at runtime):
'   fbc ziptest.bas -p ../win32/lib -p [path-to-zlib]/win32/lib
'
' Compile (static - standalone exe, no DLLs needed):
'   fbc ziptest.bas -p ../win32/lib -p [path-to-zlib]/win32/lib -Wl,-Bstatic,-lzip,-lz,-Bdynamic
' ------------------------------------------------------------

dim as long zerr = 0
dim as zip_t ptr za
dim as zip_source_t ptr src
dim as zip_file_t ptr zf
dim as zip_int64_t entry_idx
dim as zip_int64_t entry_count
dim as zip_int64_t nread
dim as zip_int64_t n
dim as zstring * 512 readbuf

' --- create archive ------------------------------------------
za = zip_open("test.zip", ZIP_CREATE or ZIP_TRUNCATE, @zerr)
if za = 0 then
    print "zip_open failed, error code: "; zerr
    end 1
end if

print "Created test.zip"

' --- add first file from memory buffer -----------------------
dim as string txt1 = "Hello from libzip! This text lives inside a zip archive."

src = zip_source_buffer(za, strptr(txt1), culngint(len(txt1)), 0)
if src = 0 then
    print "zip_source_buffer failed: "; *zip_strerror(za)
    zip_discard(za)
    end 1
end if

entry_idx = zip_file_add(za, "hello.txt", src, ZIP_FL_OVERWRITE)
if entry_idx < 0 then
    print "zip_file_add (hello.txt) failed: "; *zip_strerror(za)
    zip_source_free(src)
    zip_discard(za)
    end 1
end if

print "Added hello.txt at index "; entry_idx

' --- add second file from memory buffer ----------------------
dim as string txt2 = "libzip version: " & LIBZIP_VERSION & " - built with FreeBASIC"

src = zip_source_buffer(za, strptr(txt2), culngint(len(txt2)), 0)
if src = 0 then
    print "zip_source_buffer failed: "; *zip_strerror(za)
    zip_discard(za)
    end 1
end if

entry_idx = zip_file_add(za, "info.txt", src, ZIP_FL_OVERWRITE)
if entry_idx < 0 then
    print "zip_file_add (info.txt) failed: "; *zip_strerror(za)
    zip_source_free(src)
    zip_discard(za)
    end 1
end if

print "Added info.txt at index "; entry_idx

' --- close archive (flushes to disk) -------------------------
if zip_close(za) <> 0 then
    print "zip_close failed"
    end 1
end if

print "Archive written to disk."
print ""

' --- reopen for reading --------------------------------------
za = zip_open("test.zip", ZIP_RDONLY, @zerr)
if za = 0 then
    print "zip_open (read) failed, error code: "; zerr
    end 1
end if

' --- list all entries ----------------------------------------
entry_count = zip_get_num_entries(za, 0)
print "Entries in test.zip: "; entry_count

for n = 0 to entry_count - 1
    dim as const zstring ptr fname = zip_get_name(za, culngint(n), 0)
    print "  ["; n; "] "; *fname
next n

print ""

' --- read hello.txt back -------------------------------------
zf = zip_fopen(za, "hello.txt", 0)
if zf = 0 then
    print "zip_fopen failed: "; *zip_strerror(za)
    zip_discard(za)
    end 1
end if

nread = zip_fread(zf, @readbuf, 511)
if nread < 0 then
    print "zip_fread failed"
else
    readbuf[nread] = 0
    print "Content of hello.txt:"
    print "  "; readbuf
end if

zip_fclose(zf)

' --- read info.txt back --------------------------------------
zf = zip_fopen(za, "info.txt", 0)
if zf = 0 then
    print "zip_fopen failed: "; *zip_strerror(za)
    zip_discard(za)
    end 1
end if

nread = zip_fread(zf, @readbuf, 511)
if nread < 0 then
    print "zip_fread failed"
else
    readbuf[nread] = 0
    print "Content of info.txt:"
    print "  "; readbuf
end if

zip_fclose(zf)
zip_close(za)

print ""
print "Done."
