# fish-regex-rename-files

Sharing a few fish functions that I have found useful when having to deal with batch name changes on a lot of files in the awesome [Fish Shell](https://fishshell.com/).

**renr** renames all the files and directories in the optionally provided dir (default: CWD) according to the provided `sed -E` [acceptable regex](https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html) replace pattern.

**recr** recurses through all subdirectories in the optionally provided dir (default: CWD) and renames only files according to the provided `sed -E` compatible regex replace pattern. 

## Installation

Download the .fish files and save into your `/Users/yourname/.config/fish/functions` directory. Restart your console instance and the functions will be available. If you need them in a current session, you can `source /Users/yourname/.config/fish/functions/*.fish` them in.

If you would like to enhance the scripts in your own repo, I recommend cloning this repo locally and soft-linking them into the above functions directory.

## Usage

```fish
⟩ renr [dir] "regex"
```
where `dir` is optional and regex is in the form `"s/old/new/g"` -- note that the regex must be in quites to avoid Fish interpretation. Example:

```fish
⟩ renr subdir "s/^([0-9]+\./\1/g"
```
This will rename all files and directories in the dir `subdir` that start with the format N*. to N*, where N* is any count of whole numbers, so `01. Fly Me to the Moon.mp3` will be renamed `01 Fly Me to the Moon.mp3`.

```fish
⟩ recr [dir] "regex"
```
where `dir` is optional and regex is in the form `"s/old/new/g"`. As above, make sure to enclose the regex in quotes. Example:

```fish
⟩ recr "s/\.js\$/\.jsx/g"
```
where this time we have omitted the directory (so it defaults to the CWD) and it changes all files in the current and sub directories that end with `.js` to the `.jsx` extension. It is important to note that `$` within the regex must be escaped with a `\` to avoid Fish interpretation.

## Important!!

<div style="background-color:red; color: white;">As it is easy to make mistakes when playing with sed's regex, it is strongly recommended that you create a backup of all the files you wish to rename before attempting to use these tools.</div>
