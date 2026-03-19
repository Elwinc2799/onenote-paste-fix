; OneNote Plain Text Copy Fix
; Strips image/formatting data from clipboard when copying from OneNote,
; so pasting into other apps gives plain text instead of an image.
;
; Handles both:
;   - Desktop OneNote (ONENOTE.EXE)
;   - Windows Store / UWP OneNote (ApplicationFrameHost.exe)
;
; To use: install AutoHotkey (https://www.autohotkey.com/), then double-click this file.
; To run on startup: place a shortcut to this file in your Startup folder
;   (Win+R -> shell:startup)

$^c::
    Send, ^c
    ClipWait, 1
    if ErrorLevel {
        return
    }
    WinGet, current_application, ProcessName, A
    WinGetTitle, current_window_title, A

    ; Desktop OneNote
    if (current_application = "ONENOTE.EXE") {
        if DllCall("IsClipboardFormatAvailable", "uint", 1) {
            clipboard := clipboard
            ClipWait, 1
        }
        return
    }

    ; Windows Store / UWP OneNote
    if (current_application = "ApplicationFrameHost.exe" && InStr(current_window_title, "OneNote")) {
        if DllCall("IsClipboardFormatAvailable", "uint", 1) {
            clipboard := clipboard
            ClipWait, 1
        }
    }
return
