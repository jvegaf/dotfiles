from ..core import Module

INTERPRETERS = ['node']
EXECUTABLES = ['csscomb']
DOTFILES = ['.csscomb.json']
MODULE_CONFIG = {
    'source': 'https://github.com/csscomb/csscomb.js',
    'name': 'CSScomb',
    'uid': 'csscomb',
    'type': 'beautifier',
    'syntaxes': ['css', 'scss', 'sass', 'less'],
    'exclude_syntaxes': None,
    'executable_path': '/path/to/node_modules/.bin/csscomb(.cmd on windows)',
    'args': None,
    'config_path': {
        'default': 'csscomb_rc.json'
    },
    'comment': 'Omit "interpreter_path" as files in /node_modules/.bin/ already point to node.'
}


class CsscombFormatter(Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def get_cmd(self):
        cmd = self.get_combo_cmd(runtime_type='node')
        if not cmd:
            return None

        path = self.get_config_path()
        if path:
            cmd.extend(['--config', path])

        cmd.extend(['-'])

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
