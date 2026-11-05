# Install
# IMPORTANTE (macOS): use o Python do python.org, não o do Homebrew.
# O Homebrew python@3.14 não inclui _tkinter; o python.org inclui.
# Baixe em https://www.python.org/downloads/mac-osx/
/usr/local/bin/python3.14 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Exec
# Cli
python aleapp.py -t <zip | tar | fs | gz> -i <path_to_extraction> -o <path_for_report_output>

# gui
python aleappGUI.py
python aleapp.py --help

## macOS GUI troubleshooting

If `python aleappGUI.py` raises `ModuleNotFoundError: _tkinter`, install a macOS Python distribution that includes Tcl/Tk (for example, the official python.org installer for your Python version) or install `tcl-tk` through Homebrew before reinstalling Homebrew Python so `_tkinter` is built.

```
brew install tcl-tk
brew reinstall python@3.14
```

Afterwards run `python3 -m tkinter` to confirm Tk support and recreate the virtual environment if needed so the GUI starts successfully.

# Compile
pyinstaller /scripts/pyinstaller/aleapp_macos.spec
pyinstaller /scripts/pyinstaller/aleappGUI_macos.spec




python aleapp.py -t <zip | tar | fs | gz> -i <path_to_extraction> -o <path_for_report_output>
python aleappGUI.py
python aleapp.py --help