In this readme, i will tell you how to make a USB `AutoRun` a Script:
==================================
> We will use a simple "`echo 'Hello World'`" script as a replacement for an acctual script
---

To create a script that opens a terminal and executes the command `echo "Hello World"` when a USB is plugged into a PC, follow these steps:

1. Create the Script File:
* Open your favorite text editor (e.g., Notepad, Vim, Nano).
* Write the following bash script:

```shell
#!/bin/bash
gnome-terminal -- /bin/bash -c 'echo "Hello World"; exec bash'
```

This script uses `gnome-terminal` to open a new terminal window and runs the `echo "Hello World"` command within it. The `exec bash` at the end keeps the terminal open after executing the command.

2. Save the Script:
* Save the file with a descriptive name like `hello_world.sh`.
* Make sure to save it with Unix line endings (LF) if you're using Windows or another system that doesn't default to LF. You can usually configure your text editor to do this, or you can use a tool like `dos2unix` after transferring the file to a Linux system.

3. Make the Script Executable:
* On a Linux system, open a terminal and navigate to the directory where you saved `hello_world.sh`.
* Run the following command to make the script executable:

```shell
chmod +x hello_world.sh
```

4. Prepare the USB Drive:
* Format the USB drive with a filesystem that is compatible with both the source and target computers (e.g., FAT32 for maximum compatibility).
 
5. Copy the Script to the USB Drive:
* Copy the `hello_world.sh` file onto the root of the USB drive.

6. Configure Auto-Run on Windows:
* If you want the script to run automatically when the USB is inserted on a Windows machine, you need to edit the `autorun.inf` file on the USB drive.
* Create an `autorun.inf` file in the root of the USB drive with the following content:

```shell
[AutoRun]
open=hello_world.sh
```  

* Note that due to security updates in Windows 7 and later, autorun functionality might be disabled. Users may need to manually enable it through the Autorun settings in the Control Panel.

7. Configure Startup on macOS:
* For macOS, you cannot directly execute scripts from a USB drive due to security restrictions. However, you can instruct users to open Terminal and navigate to the USB drive to run the script manually.

> If the system allows auto-run functionality, the script should execute automatically upon insertion. Otherwise, users will have to manually execute the script by opening Terminal and running `./path/to/hello_world.sh`
