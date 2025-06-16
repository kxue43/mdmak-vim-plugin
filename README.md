# mdmak-vim-plugin

This is a Vim plugin that converts the current Markdown file being viewed into a GitHub style HTML and displays
it in a browser.

To convert and display, hit the `<leader>ll` keys in normal mode. This is the only key map that the plugin defines.

Currently this plugin only works on Linux and macOS. 

## Install Plugin Dependency

This plugin uses a Python CLI program [mdmak], which must be installed to a Python (virtual) environment that is
guaranteed to exist longer than the plugin itself. The best way to achieve this is to dedicate either a Python interpreter
or a virtual environment to this plugin.

If you use [pyenv](https://github.com/pyenv/pyenv) to manage Python interpreters on your developer machine, the following
are detailed steps for creating such a dedicated environment.

Below we suppose `PYENV_ROOT` is `~/.pyenv` and the interpreter version we use is `3.11.12`. Substitute accordingly
if your settings are different.

Install [mdmak] from its GitHub release asset.

```bash
~/.pyenv/versions/3.11.12/bin/python -m pip install "mdmak@https://github.com/kxue43/mdmak/releases/download/1.0.0/mdmak-1.0.0-py3-none-any.whl"
```

Now the absolute path to the installed `mdmak` binary is `~/.pyenv/versions/3.11.12/bin/mdmak`.
The absolute path to the Python interpreter is `~/.pyenv/versions/3.11.12/bin/python`.

Note down these two paths as we will use them to configure this Vim plugin.

## Install the Plugin via `vim-plug`

Add the following line between `call plug#begin('/YOUR/PATH')` and `call plug#end()`.

```vimscript
Plug 'kxue43/mdmak-vim-plugin', {'for': 'markdown'}
```

Don't forget to run the `:PlugUpdate` Vim command afterwards.

## Configure the Plugin

This plugin has three configuration variables and all are required.

| Variable Name | Description |
| :----         |  :---       |
| `g:mdmak_executable` | Absolute path to the installed `mdmak` binary. |
| `g:mdmak_python_executable` | Absolute path to the Python interpreter. |
| `g:mdmak_plugin_dir` | Absolute path to the folder where this plugin is installed. |

Example snippet for your VIMRC file looks like below.

```vimscript
let g:mdmak_executable = '~/.pyenv/versions/3.11.12/bin/mdmak'
let g:mdmak_python_executable = '~/.pyenv/versions/3.11.12/bin/python'
let g:mdmak_plugin_dir = '~/.vim/plugged/mdmak-vim-plugin'
```

## Notes

On macOS, set the default app for opening HTML files to one of your browsers. Otherwise the generated
HTML won't be displayed in your browser correctly.

[mdmak]: https://github.com/kxue43/mdmak
