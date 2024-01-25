Want to make a Kernal panic `Automatically`?
============================================

How to do such
--------------
(This requires a terminal)
> Step one:
* Download the `git` package using `pkg install git`

> Step two:
* Clone this repository using git - `git clone https://CPScript/Kernal-panic` 

> Step three:
* cd into the repo `cd Kernel-panic`

> Step five:
* Run the script. Type `bash panic.sh` into the terminal

Want to make your Kernel panic `Manualy`?
=========================================

How to do such
--------------
> Step one:
* Your going to need to boot into your Linux Distro's OS(Operating System)

> Step two:
* Your going to need to load into tty5, to do this press `ctrl + alt + F5` on your keyboard (<a href='https://www.computerhope.com/jargon/c/ctrl-alt-f5.htm'>Click for more info</a>) 
<details closed>
<summary>Im confused! (click me)</summary>
<br>

This keyboard shortcut switches from your GUI virtual terminal to the 5th TUI Virtual terminal. (Its basicly just a full screen terminal.)

  <details closed>
  <summary>Im Still confused! (click me)</summary>
  <br>
  
  In Linux, using the keyboard shortcut `Ctrl + Alt + F5` switches your view from the graphical user interface (GUI) to a virtual terminal, specifically tty5. This is a text-only console where you can login and work in text mode. Linux systems typically have multiple virtual terminals accessible via `Ctrl + Alt` and a function key (`F1` through `F6` for text consoles, with `F7 returning to the GUI`). If you press `Ctrl + Alt + F5` and your screen goes blank, it could be due to issues with your VGA settings for non-graphical screens. Although in some Linux distributions, only `Alt + F7` might be needed. If you're using a more modern Linux distribution, the GUI may be on the first virtual terminal instead of the seventh, so you might need to try different function keys (like `F1` or `F2`) in combination with Ctrl+Alt to get back to the GUI!

  </details>

</details>

> Step three:
* Type `echo 'c' | tee -a /proc/sysrq-trigger`. This command is used to trigger a kernel panic on a Linux system.
<details closed>
<summary>How does this work?</summary>
<br>

* `echo 'c'`: This command outputs the letter 'c', which is the input to the subsequent command.
* `tee -a /proc/sysrq-trigger`: The `tee` command reads from standard input and writes to standard output and files. The `-a` flag is used to append the output to the file instead of overwriting it. `/proc/sysrq-trigger` is a special file that allows you to trigger various system functions by writing command characters to it, provided the `sysrq` option is enabled in the kernel.
* When `'c'` is written to `/proc/sysrq-trigger`, it triggers a kernel panic, which is an action used to simulate a system crash. This can be useful for testing the system's behavior in a crash situation, such as ensuring that <a href='https://l8liliang.github.io/2021/07/13/kdump.html'>kdump</a> (a kernel crash dumping mechanism) is properly configured and able to capture a vmcore (memory dump) for post-mortem analysis.

</details>

Can i do this on Windows?
=========================
On Windows, the concept of multiple TUI terminals like in Linux (accessed via Ctrl+Alt+F1-F6) does not exist in the same way. Windows uses a single graphical user interface (GUI) for user interaction, and command-line operations are performed within this environment using tools like Command Prompt, PowerShell, or Windows Terminal.

But am i still able to cause the kernel to panic?
-------------------------------------------------

Yes your able to replicate a kernel crash (Also know as a `BSOD`(Blue Screen Of Death)) Using a feature Windows themselfs added that allow developers and system administrators to intentionally cause a crash for debugging.
One such feature is the "Crash on Ctrl + Scroll Lock" facility, which can be enabled by modifying the registry. 

Here's how you can set it up:
-----------------------------
> Step 1 (Modify the Registry):
* First Open the Registry Editor by typing `regedit` in the Run dialog (Win + R).
* Next navigate to `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\i8042prt\Parameters`.
* Then add a new DWORD value named `CrashOnCtrlScroll` and set its value to `1`.
* Once your done restart your computer for the change to take effect.

> 2 Trigger the Crash:
* First hold down the right `Ctrl` key on your keyboard.
* Then press the `Scroll Lock` key twice.

This will cause an immediate kernel crash and a subsequent BSOD. The system will collect a memory dump if it is configured to do so, which can be analyzed later using debugging tools like WinDbg.

Another method is to use a tool provided by Microsoft called NotMyFault, which is part of the Sysinternals Suite. This tool can be used to deliberately crash a system in various ways for testing purposes.

# WARNING!
> Replicating what is in this ReadMe.md might hurt your computer, please execute with caution
