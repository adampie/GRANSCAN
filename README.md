# granscan
A simplified way to run various Linux diagnostic tools

```
Usage: granscan [OPTION] [COMMAND]

A simplified way to run various Linux diagnostic tools

Options:
  -h        Print usage
  -a        Run all diagnostic tools

Commands:
  help      Print usage
  check     Check what tools can be run and what missing tools can be installed
  cpu       Run CPU diagnostic tools
  memory    Run memory diagnostic tools
  network   Run network diagnostic tools
  storage   Run storage diagnostic tools
  all       Run cpu, memory, network and storage diagnostic tools
  info      Get various information about the current system
```

## How to use
```
git clone https://github.com/adampie/granscan
cd granscan && chmod +x granscan
./granscan
```
or
```
sudo wget https://raw.githubusercontent.com/adampie/granscan/master/granscan /usr/bin
sudo chmod +x /usr/bin/granscan
granscan
```
