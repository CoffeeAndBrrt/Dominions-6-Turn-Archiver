# Dominions-6-Turn-Archiver
Back up your Dominions 6 Turns into the format Gamename-TurnXX with a powershell script. This can be useful for keeping track of previous turns for multiplayer games, or for testing in single player games. 

# Installation
Copy this file into your Dominions 6 saved games directory. Open Dominions 6, choose Tools & Manuals, and then Choose Open User Data Directory. Navigate to savedgames, and place the `Dom6Backup.ps1` file in that folder, beside your saved games. 

Alternatively, you can you can enter `%appdata%\Dominions6\savedgames` into Explorer and copy your download there. 

# Running the file
By default, Microsoft does not let you execute powershell scripts by double-clicking them, so we will create a shortcut on our desktop.

1. From your saved games folder, rightclick and drag the file onto your desktop, and choose "Create Shortcut Here".
1. Right click the shortcut and choose "Properties".
1. In the line where it says "Target", prefix the command with the word "powershell -File".
1. In the line where it says "Target", suffix the command with the name of your game.

Example: if your username was TedH, and your game was named EA_Dreamers, Target should resemble the following:

`powershell -File C:\Users\TedH\AppData\Roaming\Dominions6\savedgames\Dom6Backup.ps1 EA_Dreamers`

If you have more than one game, you can copy and paste the shortcut, ignore everything at the front, and change the gamename at the end of Target.

# Cross Platform support
I have not tested this on Linux or Macintosh platforms. I understand that powershell has both [Linux Support](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.5) and [macOS Support](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.5) by the name of `pwsh`. Feedback is welcome. 

# Common Issues
## Running the file just opens notepad!
By default, Microsoft Windows does not allow Powershell scripts to be executed by double clicking them. Refer to the Running the file section of this document.

## I just started a game and the script doesn't work
Ensure that at least the first turn has been saved.
