# lir-mmv

## Installation

```vim
Plug 'tamago324/lir.nvim'
Plug 'tamago324/lir-mmv.nvim'
Plug 'nvim-lua/plenary.nvim'
```

## Requirements

* [mmv](https://github.com/itchyny/mmv)
* [nvr](https://github.com/mhinz/neovim-remote)


## Usage

Used in the `mappings` of `lir.setup()`

```lua
require'lir'.setup {
  -- ...
  mappings = {
    -- ...
    ['M']     = require'lir.mmv.actions'.mmv,
  },
}
```

## License

MIT
