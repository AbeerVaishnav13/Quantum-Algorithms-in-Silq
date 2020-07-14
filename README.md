# Quantum-Algorithms-in-Silq
Trying some quantum algorithms the latest language for Quantum Computers: `Silq`.

I have also included the files made by me to set proper indentation and syntax highlighting for using SILQ in `Vim editor`.

## Installing Silq language
### For Command-line users
Follow the instructions mentioned [here](https://github.com/AbeerVaishnav13/silq).

### For VS-Code extension
Follow the instructions mentioned [here](https://silq.ethz.ch/install).

## Installing Vim indention and syntax highlighting files
Copy and and paste the following code in your `.vimrc` file.

**NOTE:** Change the variable ```g:path_to_silq_files``` to the  location where you have downloaded this repository in your system.

```
let g:path_to_silq_files = "<path/to/cloned/Quantum-Algorithms-in-Silq/repo>"
augroup filetypedetect
	au BufNewFile,BufRead *.slq		setf silq
	au BufNewFile,BufRead *.slq		exec "source" g:path_to_silq_files . "vim_silq_extensions/silq_indent.vim"
	au BufNewFile,BufRead *.slq		exec "source" g:path_to_silq_files . "vim_silq_extensions/silq_syntax_highlight.vim"
augroup END
```
