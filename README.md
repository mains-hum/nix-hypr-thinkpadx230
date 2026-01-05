<div align="center">

# :volcano: [mains-hum] / nix-nord
`My main configuration on hyprland NixOS`

<p align="center">
  <img src="https://img.shields.io/github/repo-size/mains-hum/nix-tokyonight?style=for-the-badge&logo=github&color=81a1c1&logoColor=white" alt="Repo Size" />
  <img src="https://img.shields.io/badge/NixOS-Unstable-5277C3?style=for-the-badge&logo=nixos&logoColor=white" alt="NixOS" />
  <img src="https://img.shields.io/badge/WM-Hyprland-00ADD8?style=for-the-badge&logo=wayland&logoColor=white" alt="Hyprland" />
  <img src="https://img.shields.io/github/license/mains-hum/nix-tokyonight?style=for-the-badge&color=ebcb8b" alt="License" />
</p>

---
</div>

## 📸 Screenshot
<p align="center">
  <img src="screenshot/1.png" width="48%" />
  <img src="screenshot/2.png" width="48%" />
  <br />
  <img src="screenshot/3.png" width="48%" />
  <img src="screenshot/4.png" width="48%" />
</p>

---

## 🎯 Core Stack

| Component | Software |
| :--- | :--- |
| **Compositor** | `Hyprland` |
| **Shell** | `Zellij -> NuShell` |
| **Terminal** | `Alacritty` |
| **IDE** | `NFV` |
| **Bar** | `Waybar` |
| **Launcher** | `Rofi` |
| **File Manager** | `Joshuto` |

---

## ⌨️ Navigation
| Keybind | Action | Keybind | Action |
| :--- | :--- | :--- | :--- |
| `Caps Lock + E/Ret` | Alacritty | `Caps Lock + Q` | Kill |
| `Caps Lock + R` | Rofi | `Caps Lock + F` | Fullscreen |
| `Super + Alt + Shift + Q` | PowerOff | `Caps Lock + W` | Firefox |
| `Caps Lock + Space` | Layout | `Alt + Shift + S` | Screenshot |
| `Caps Lock + D` | Telegram | `Caps Lock + A` | Steam |

---

## 📦 Installation

### Prerequisites

- Fresh NixOS installation
- Username: `nixos` **(recommended)**
- Basic understanding of Nix flakes

```bash
# Install git
> sudo nano /etc/nixos/configuration.nix

# Add to systemPackages: git
> sudo nixos-rebuild switch

# Clone this repository
> mkdir Pictures
> git clone https://github.com/mains-hum/nix-hypr.git
> cd ~/nix-paradise/nixos

# Copy configuration files
> sudo rm -rf /etc/nixos/configuration.nix
> sudo cp -a home/ img/ modules/ configuration.nix flake.lock flake.nix /etc/nixos

# Rebuild
> sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Reboot your system
> reboot
```

---

### ⚠️ Important Notes

- Configure your monitor in Hyprland:

```bash
> sh /etc/nixos/home/programs/hyprland.nix
```

```conf
monitor = DP-1, 1920x1080@165, 0x0, 1
# For multiple monitors:
# monitor = HDMI-A-1, 1920x1080@60, 1920x0, 1
```

-  Use username **`nixos`** for best compatibility
-  **Do not change** the layout switch from `ALT + SHIFT` (breaks keybindings)
-  For multiple monitors, add additional `monitor` lines
-  Convert wallpaper to gtk gtk theme
```bash
> gowall convert ~/wallpaper -t custom-ocean
```

---

<div align="center">
⭐ Star this repo if you find it helpful!
Made with by mains-hum
</div>

---

## 📝 License

nix-dotf  Copyright (C) 2025-2040  mains-hum

See the [LICENSE](LICENSE) file for details.

</div>


