# OneNote Paste Fix

When you copy text from OneNote and paste it into another app — like Microsoft Teams, GitHub, Slack, or a browser — the text sometimes appears as an embedded image instead of actual text you can read, edit, or search.

This is a known OneNote behaviour: it adds image data to the clipboard alongside plain text, and many apps pick up the image instead of the text.

This AutoHotkey script fixes that. It intercepts your Ctrl+C while OneNote is active and strips the image data from the clipboard, leaving only plain text. Paste into any app and you'll get real text every time.

---

## Requirements

- Windows
- [AutoHotkey v1.1](https://www.autohotkey.com/download/) (free, open source)

---

## Installation

1. **Install AutoHotkey**
   Download and install from https://www.autohotkey.com/download/

2. **Download the script**
   Download `onenote-paste-fix.ahk` from this repo (or clone it).

3. **Run the script**
   Double-click `onenote-paste-fix.ahk`.
   A small AutoHotkey icon will appear in your system tray — that means it's running.

---

## Run on Startup (Recommended)

So you don't have to start the script manually every time:

1. Press `Win + R`, type `shell:startup`, and press Enter.
2. Copy a **shortcut** to `onenote-paste-fix.ahk` into that folder.

From now on the script will start automatically when you log in.

---

## How It Works

Every time you press `Ctrl+C` while OneNote is the active window, the script:

1. Lets the copy happen normally.
2. Checks if plain text is available on the clipboard.
3. If it is, replaces the clipboard contents with just the plain text — discarding the image data OneNote added alongside it.

It works with both:
- **Desktop OneNote** (`ONENOTE.EXE`)
- **Microsoft Store / UWP OneNote** (`ApplicationFrameHost.exe`)

Outside of OneNote, `Ctrl+C` works exactly as normal — nothing is changed.

---

## Usage

1. Start the script (or let it start automatically on login).
2. Copy text from OneNote as usual with `Ctrl+C`.
3. Paste anywhere — Teams, GitHub, Slack, a browser, wherever — and you'll get plain text.

---

## Stopping the Script

Right-click the AutoHotkey icon in the system tray and select **Exit**.

---

## Troubleshooting

**The icon doesn't appear in the tray**
Make sure AutoHotkey is installed. Try right-clicking the `.ahk` file and selecting "Run Script".

**It's still pasting as an image**
Make sure the script is running (check the system tray). If you're using the Store version of OneNote, verify your window title contains "OneNote" — the script checks for this.

**I want to temporarily disable it**
Right-click the tray icon and select **Suspend Hotkeys**, then resume it when needed.

---

## License

MIT
