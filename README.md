Extracts hrtmon.rom from WinUAE's source file hrtmon.rom.cpp.

Type

```
make extract
```

and it will download hrtmon.rom.cpp from WinUAE Github repository (master), compile the extraction tool and extract hrtmon.rom.

To extract hrtmon.rom from a specific version of hrtmon.rom.cpp you can set the environment variable `HRTMON_ROM_CPP_URL`:

```
HRTMON_ROM_CPP_URL=https://raw.githubusercontent.com/tonioni/WinUAE/e7d6f64da6ab5326c1daefbeab4c66c279006f96/hrtmon.rom.cpp make extract
```
