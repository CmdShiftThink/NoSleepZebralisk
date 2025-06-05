# 🦓 NoSleepZebralisk

> A savage-silent macOS background utility that keeps your **ZEB-JUKE BAR 1000** soundbar from slipping into standby every 8 minutes. Stealthy. Smart. Unstoppable.

---

## 🎯 What It Does

**NoSleepZebralisk** silently monitors your Mac’s active audio output. If it detects the **ZEB-JUKE BAR 1000**, it plays an inaudible audio ping every 7.5 minutes. This keeps the soundbar alive without affecting your audio experience.

---

## 🚀 Features

- ✅ Automatically detects when **ZEB-JUKE BAR 1000** is the active output
- 🔇 Plays a silent `.wav` every 7.5 minutes (before the 8 min timeout)
- 🧠 Runs as a LaunchAgent in the background
- 🔒 Doesn't interfere with other audio playback
- 🧼 Includes a clean, dedicated `.pkg` uninstaller
- 🖋️ Signed `.zip` for safe distribution

---

## 📦 Installation

1. **Install audio device switcher** (required):

   ```bash
   brew install switchaudio-osx
   ```

2. **Run the installer** :
   ```bash
   ./zeb_keepalive_installer.pkg
   ```

#### This will:

- Copy the background script, silent audio, and plist to appropriate locations
- Automatically load the service using launchctl

3. **Verify it’s working** :

   ```bash
   launchctl list | grep keepzebawake
   ```

4. **To uninstall, just run** :
   ```bash
   ./zeb_keepalive_uninstaller.pkg
   ```

---

## 🌀 Why the Name?

The name NoSleepZebralisk combines:

- **ZEB** – for your ZEB-JUKE BAR 1000 soundbar
- **Zebralisk** – a fictional beast evoking power and stamina (think Ultralisk + Zebra)
- **NoSleep** – because your soundbar shouldn’t

It’s weird, memorable, and exactly what this tool is.

---

## 🛠 Manual Build

To build the installer and uninstaller yourself:

1. **Clone the repository** :

   ```bash
   git clone https://github.com/CmdShiftThink/NoSleepZebralisk.git
   cd nosleepzebralisk
   ```

2. **Make the build script executable** :

   ```bash
   chmod +x build_installers.sh
   ```

3. **Run the build** :
   ```bash
   ./build_installers.sh
   ```

#### This creates:

- /tmp/zeb_keepalive_installer.pkg
- /tmp/zeb_keepalive_uninstaller.pkg

---

## 📁 File Structure

```
nosleepzebralisk/
├── README.md
├── build_installers.sh
├── source/
│   ├── payload/
│   │   ├── keep_zeb_awake.sh             # Main script
│   │   ├── com.user.keepzebawake.plist   # LaunchAgent plist
│   │   └── silent_ping.wav               # Silent audio file
│   ├── scripts/
│   │   └── postinstall                   # Runs post-install config
│   ├── uninstall_payload/
│   └── uninstall_scripts/
│       └── postinstall                   # Cleans files on uninstall
```

---

## 📜 License

### MIT License

- You’re free to use, modify, and distribute. Just don’t put your soundbar to sleep.
- See [LICENSE](LICENSE) for full details.

---

## 🙏 Credits

- **ZEB-JUKE BAR 1000** – the reason this exists
- **switchaudio-osx** – by @deweller
- macOS _launchctl_, _pkgbuild_, and _productbuild_ — for making things work like magic
- **You** — for needing a solution cool enough to be called **NoSleepZebralisk**

---

## ❤️ Contributing

#### PRs welcome!

- **Ideas**: make the ping interval configurable
- **Extras**: menubar toggle, GUI for launchctl management
- **Fixes**: edge-case bug reports for specific macOS versions

To contribute:

```bash
git clone https://github.com/CmdShiftThink/NoSleepZebralisk.git
git checkout -b my-fix
```

Then submit a pull request!

---

## 🦓 Stay loud. Stay alive. Stay Zebralisk.
