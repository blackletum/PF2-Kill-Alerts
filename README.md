# PF2-Kill-Alerts

A kill alert plugin for **Pre-Fortress 2** (intended for 0.7.4) that announces unique kills in chat.

Check `#releases` for the newest version, auto-compiled!

---

### Changes
- Fixed **telefrag alerts** not working
- Included the compiled `.smx` file (check releases)
- Included the `pf2.inc` file, in case it is needed (was previously needed for compiling on SM 1.12 due to definition issues with **Demoman** and **Heavy**).
- Pulled PR that automates compiling of plugin (thank you!), which pulls the pf2.inc from the main repository of PF2:
  - https://github.com/Pre-Fortress-2/PF2-Tools
  

---

### Requirements
- **SourceMod 1.12+** is required to run the included plugin (the included `pf2.inc` file is only necessary if you compile yourself).
- If you have 1.11, it works fine as long as you compile it yourself (no inc file change required)

---

### Future Plans
- Add alerts for when players use the `kill` or `explode` commands.  
  - I haven’t been able to get those working yet, so if anyone knows how to properly detect those events, help would be appreciated.
- Goomba stomp issues
  - Goomba stomp unfortunately tells the game it was killed by "player", which apparently also includes when someone is "finished off". So for now, I have removed the Goomba functionality, but maybe somebody can help me fix that in the future. 

---

### Included Files
| `killalert.smx` | Precompiled plugin ready to use, in releases |

| `killalert.sp` | Source file for editing or contributing |

| `pf2.inc` | Include file used to resolve definition errors, only if needing to compile locally |

---

Suggestions, fixes, and pull requests are always welcome.
