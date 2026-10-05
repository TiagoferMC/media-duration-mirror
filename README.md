# Media Duration Script
Simple zsh script that calls out to mediainfo to get the duration of a file,
followed by an Awk script to structure the data, and column to entabulate it.

It shows hours, minutes, seconds, and miliseconds, as well as the difference
between the current and previous files.

Files are expected to start with a number, followed by a dash or colon, with
optional spaces, and then a name with an extension.

Any further dashes or colons are stripped from the final output, together withe
everything after them.

Extensions are stripped in all cases.

Resulting file names over 20 characters get trimmed and show ellipsis.

Subdirectories are printed the first time a file inside them is scanned.

# Usage
These scripts are inteded to be used with MediaInfo; make sure you have it
installed.

Do not execute the Awk script directly. Run the provided zsh script which runs
MediaInfo with the required arguments, and pipes the data to it.

Example usage:
```
$ cd media-dir
$ /path/to/media-duration/media-duration.zsh
```
# Note:
I am aware on the zsh dependency. This is due to the easy way in which you can
list files with a natural numbering order.

In the future I will add a bash option.

