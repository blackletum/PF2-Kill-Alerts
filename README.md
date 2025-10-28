# PF2-Kill-Alerts

A kill alert plugin for **Pre-Fortress 2** (intended for 0.7.4) that announces unique kills in chat.

---

### Changes

- Fixed **telefrag alerts** not working
- Added **Goomba stomp alerts**
- Included the compiled `.smx` file
- Included the `pf2.inc` file (needed for compiling on SM 1.12 due to definition issues with **Demoman** and **Heavy**)

---

### Requirements

- **SourceMod 1.12+** is required to run the included plugin, along with the included `pf2.inc` file.
- If you have 1.11, it works fine as long as you compile it yourself (no inc file change required)

---

### Future Plans

- Add alerts for when players use the `kill` or `explode` commands.  
  I haven’t been able to get those working yet, so if anyone knows how to properly detect those events, help would be appreciated.

---

### Included Files

| `killalert.smx` | Precompiled plugin ready to use |
| `killalert.sp` | Source file for editing or contributing |

---

Suggestions, fixes, and pull requests are always welcome.
