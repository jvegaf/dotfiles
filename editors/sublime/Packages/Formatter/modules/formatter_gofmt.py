from ..core import Module

EXECUTABLES = ['gofmt']
DOTFILES = []
MODULE_CONFIG = {
    'source': 'https://pkg.go.dev/cmd/gofmt',
    'name': 'Gofmt',
    'uid': 'gofmt',
    'type': 'beautifier',
    'syntaxes': ['go'],
    'exclude_syntaxes': None,
    'executable_path': '/path/to/bin/gofmt',
    'args': None,
    'config_path': None,
    'comment': 'Opinionated, no config.'
}


class GofmtFormatter(Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def get_cmd(self):
        executable = self.get_executable(runtime_type=None)
        if not executable:
            return None

        cmd = [executable]

        cmd.extend(self.get_args())

        cmd.extend(['-e', '-s'])

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
