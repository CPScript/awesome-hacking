Want to make your Kernel panic?
===============================

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
im looking into that at this moment
