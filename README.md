# showmd-vim-plugin

This is a Vim plugin that converts the current Markdown file being viewed into a GitHub style HTML and displays
it in the user's default browser.

To convert and display, hit the `<leader>ll` keys in normal mode. This is the only key map that the plugin defines.

## Install Plugin Dependency

This plugin depends on a Go executable whose source is located [here](https://github.com/kxue43/cli-toolkit/blob/main/cmd/toolkit-show-md/main.go).

To install it, first install Go on your operating system and run the following command.

```bash
go install github.com/kxue43/cli-toolkit/cmd/toolkit-show-md@latest
```

The executable is installed at `GOBIN`, which by default is `GOPATH/bin`. Make sure the installation folder is on
your `PATH`. You can use the following commands to query the Go environment information.

```bash
go env GOBIN
go env GOPATH
```

## Install the Plugin via `vim-plug`

Add the following line between `call plug#begin('/YOUR/PATH')` and `call plug#end()`.

```vimscript
Plug 'kxue43/showmd-vim-plugin', {'for': 'markdown'}
```

Don't forget to run the `:PlugUpdate` Vim command afterwards.
