from ..core import Module

INTERPRETERS = ['python3', 'python']
EXECUTABLES = ['yapf']
DOTFILES = ['.style.yapf', 'setup.cfg', 'pyproject.toml']
MODULE_CONFIG = {
    'source': 'https://github.com/google/yapf',
    'name': 'YAPF',
    'uid': 'yapf',
    'type': 'beautifier',
    'syntaxes': ['python'],
    'exclude_syntaxes': None,
    'executable_path': '/path/to/bin/yapf',
    'args': None,
    'config_path': {
        'default': 'yapf_rc.yapf'
    },
    'comment': 'Requires "environ": {"PYTHONPATH": ["/lib/python3.7/site-packages"]}. Omit "interpreter_path" if python already on PATH.'
}


class YapfFormatter(Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def get_cmd(self):
        cmd = self.get_combo_cmd(runtime_type='python')
        if not cmd:
            return None

        path = self.get_config_path()
        if path:
            cmd.extend(['--style=' + path])

        cmd.extend(['--'])

        return cmd

    def format(self):
        cmd = self.get_cmd()

        try:
            exitcode, stdout, stderr = self.exec_cmd(cmd)

            if exitcode > 0:
                self.print_exiterr(exitcode, stderr)
            else:
                return stdout
        except Exception as e:
            self.print_oserr(cmd, e)

        return None
