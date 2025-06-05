# nvim-input-switch

**Seamless IME switching for Neovim**  
Automatically switches to **Chinese IME in Insert mode** and back to **English IME in Normal mode**—no extra keystrokes required.

---

## ✨ Features

- 🔄 **Auto-toggle IME**  
  - Insert → Chinese (default `2052`)  
  - Normal / Visual / Command → English (default `1033`)
- ⚙️ **Fully configurable** via `opts`  
  - Per-event enable/disable  
  - Per-event language code  
  - Custom path to `im-select.exe`
- 🪄 **Zero-config path detection**  
  - If you keep `im-select.exe` inside the plugin folder, no path is required.
- 💤 **Lazy-load friendly** – loads on first `InsertEnter`

---

## 📦 Requirements

| Platform | Requirement                              |
| -------- | ---------------------------------------- |
| Windows  | [`im-select`](https://github.com/daipeihust/im-select) executable |
| Neovim   | 0.9 or newer (Lua API for `vim.fn` & `vim.api`) |

> **Tip:** `im-select.exe` is bundled inside the plugin if you use the default Lazy.nvim installation path.

---

## 🚀 Installation (Lazy.nvim)

```lua
{
  "396458015/nvim-input-switch",
  event = "InsertEnter",   -- load on first insert
  opts = {
    -- path = "D:/tools/im-select.exe",  -- absolute path if you keep it elsewhere
    VimEnter    = false,   -- IME on Neovim start
    InsertEnter = true,    -- IME on insert
    InsertLeave = true,    -- switch back on leaving insert
    VimLeave    = false,   -- switch back on exit
  },
}

If you use your own 'im-select.exe'

```lua
opts = {
  path = "C:/my-tools/im-select.exe",
  -- …other flags
}
```

