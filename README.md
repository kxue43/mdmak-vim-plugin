# mdmak-vim-plugin

This is a Vim plugin that converts the current Markdown file being viewed into a GitHub style HTML and displays
it in a browser.

Currently this plugin only works on macOS. 

## Install Plugin Dependency

This plugin uses a Python CLI program [mdmak], which must be installed to a Python (virtual) environment that is
guaranteed to exist longer than the plugin itself. 

There are two options to do this on macOS.

1. Create a standalone virtual environment using `venv`. Install `mdmak` into it. Keep the virtual environment
   there as long as the plugin is used, and don't install anything else into it.

2. On a macOS developer machine, the system Python interpreter is usually not used directly. Therefore we can use
   the global environment of the system Python interpreter as a "durable" Python environment. This environment is
   obviously always there as long as the system Python doesn't have a version upgrade. Similarly, either don't install
   anything else into it afterwards or make sure other installations don't interfere with [mdmak] or
   its dependency [marko].

Below are the detailed steps of the 2nd approach above.

- Make sure the system Python is version 3.9 or above.

  ```bash
  /usr/bin/python3 -V
  ```

- Install [mdmak] from its GitHub release asset.

  ```bash
  /usr/bin/python3 -m pip install "mdmak@https://github.com/kxue43/mdmak/releases/download/1.0.0/mdmak-1.0.0-py3-none-any.whl"
  ```

- Get the absolute path to the installed `mdmak` binary. This is needed to configure the Vim plugin.

  ```bash
  echo "$(/usr/bin/python3 -c 'import site; print(site.getuserbase());')/bin/mdmak"
  ```

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
| `g:mdmak_executable` | Absolute path to the installed `mdmak` binary. See above for how to retrieve it. |
| `g:mdmak_plugin_dir` | Absolute path to the folder where this plugin is installed. |
| `g:mdmak_browser` | E.g. `'Safari'`, `'Firefox'`, `'Google Chrome'` |

Example snippet for your VIMRC file looks like below.

```vimscript
let g:mdmak_executable = '/Users/kxue43/Library/Python/3.9/bin/mdmak'
let g:mdmak_plugin_dir = '/Users/kxue43/.vim/plugged/mdmak-vim-plugin'
let g:mdmak_browser = 'Safari'
```

## Port to Other OS

To port this plugin to operating systems other than macOS, it only takes the following steps.

- Figuring out the CLI command that opens a file in a browser.
  Update it in [mdmak-plugin.vim](./plugin/mdmak-plugin.vim).

- Figuring out how to install the [mdmak] CLI program in a durable Python (virtual) environment and how to get the
  absolute path to the installed `mdmak` binary. This will be the value for `g:mdmak_executable`.

- Update configuration variables accordingly.

[mdmak]: https://github.com/kxue43/mdmak
[marko]: https://github.com/frostming/marko
