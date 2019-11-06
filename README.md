# martin-juul/bootstrap-macos

My personal macOS setup.

## Getting more raw performance

```bash
sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"
```
Type that into your terminal, and reboot. This tweaks sysctl, to allow more connections etc. Fixes Gradle build errors in a lot of cases.

## Credits

This project is heavily inspired from these sources:

[How to Use launchd to Run Scripts on Schedule in macOS](https://www.maketecheasier.com/use-launchd-run-scripts-on-schedule-macos/)

[holman/dotfiles](https://github.com/holman/dotfiles)
