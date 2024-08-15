local python = require("util.python")

python.remove_pyenv_shims_from_path()
python.add_virtual_env_bin_to_path()
