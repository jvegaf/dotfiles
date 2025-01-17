from ..core import Module, log

DOTFILES = []
MODULE_CONFIG = {
    'source': 'build-in',
    'name': 'Sf PUNYCODE (encode)',
    'uid': 'sfpunycodeenc',
    'type': 'converter',
    'syntaxes': ['*'],
    'exclude_syntaxes': None,
    'executable_path': None,
    'args': ['--idna', False],
    'config_path': None,
    'comment': 'Build-in, no "executable_path", no "config_path", use "args" instead.'
}


class SfpunycodeencFormatter(Module):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def format(self):
        try:
            text = self.get_text_from_region(self.region)
            args = self.parse_args(convert=True)
            idna = args.get('--idna', True)

            return text.encode('idna' if idna else 'punycode').decode('ascii')
        except Exception as e:
            log.status('Formatting failed due to error: %s', e)

        return None
