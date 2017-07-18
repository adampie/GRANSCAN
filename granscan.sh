#!/bin/bash

function HELP {
   cat << EOF
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
  info      Get various information about the current system
  all       Run cpu, memory, network and storage diagnostic tools

EOF
  exit 0;
}

function CPUHELP() {
  cat << EOF
Usage: granscan cpu

Tools:
  top       Display Linux processes
  ps        Report a snapshot of the current processes

EOF
  exit 0;
}
function MEMORYHELP() {
  cat << EOF
Usage: granscan memory

Tools:
  free      Display amount of free and used memory in the system
  vmstat    Report virtual memory statistics

EOF
  exit 0;
}
function NETWORKHELP() {
  cat << EOF
Usage: granscan network

Tools:
  ip        Show / manipulate routing, devices, policy routing and tunnels
  ifconfig  Configure network interface parameters
  netstat   Show network status
  ss        Another utility to investigate sockets
  nicstat   Print network traffic statistics

EOF
  exit 0;
}
function STORAGEHELP() {
  cat << EOF
Usage: granscan storage

Tools:
  df        Report file system disk space usage
  lsblk     List block devices
  lsof      List open files

EOF
  exit 0;
}
function INFOHELP() {
  cat << EOF
Usage: granscan info

Tools:
  uptime    Tell how long the system has been running
  w         Show who is logged on and what they are doing
  lscpu     Display information about the CPU architecture
  lshw      List hardware
  lsscsi    List SCSI devices (or hosts) and their attributes
  lsusb     List USB devices

EOF
  exit 0;
}
function CHECKHELP() {
  cat << EOF
Usage: granscan check

This will check if the tools within this script are installed or not.

EOF
  exit 0;
}

function CPU() {
  echo "#######################################################################"
  echo "#                              CPU                                    #"
  echo "#######################################################################"
  echo ""
  if [[ -x "$(command -v top)" ]]; then
    echo "############################# top ####################################"
    if [[ $OSTYPE == darwin* ]]; then
      top -l 1
    else
      top -bn1;
    fi
    echo "";
  fi
  if [[ -x "$(command -v ps)" ]]; then
    echo "############################### ps ####################################"
    ps;
    echo "";
  fi
}
function MEMORY() {
  echo "#######################################################################"
  echo "#                             MEMORY                                  #"
  echo "#######################################################################"
  echo ""
  if [[ -x "$(command -v free)" ]]; then
    echo "############################# free ###################################"
    free -h;
    echo "";
  fi
  if [[ -x "$(command -v vmstat)" ]]; then
    echo "############################ vmstat ##################################"
    vmstat;
    echo "";
  fi
}
function NETWORK() {
  echo "#######################################################################"
  echo "#                             NETWORK                                 #"
  echo "#######################################################################"
  echo ""
  if [[ -x "$(command -v ip)" ]]; then
    echo "############################# ip #################################"
    ip a;
    echo "";
  fi
  if [[ -x "$(command -v ifconfig)" ]]; then
    echo "############################# ifconfig #################################"
    ifconfig;
    echo "";
  fi
  if [[ -x "$(command -v netstat)" ]]; then
    echo "############################# netstat #################################"
    netstat;
    echo "";
  fi
  if [[ -x "$(command -v ss)" ]]; then
    echo "############################### ss ####################################"
    ss;
    echo "";
  fi
  if [[ -x "$(command -v nicstat)" ]]; then
    echo "############################# nicstat ####################################"
    nicstat;
    echo "";
  fi
}
function STORAGE() {
  echo "#######################################################################"
  echo "#                             STORAGE                                 #"
  echo "#######################################################################"
  echo ""
  if [[ -x "$(command -v df)" ]]; then
    echo "############################### df ####################################"
    df -h;
    echo "";
  fi
  if [[ -x "$(command -v lsblk)" ]]; then
    echo "############################## lsblk ###################################"
    lsblk;
    echo "";
  fi
  if [[ -x "$(command -v lsof)" ]]; then
    echo "############################## lsof ####################################"
    lsof;
    echo ""
  fi
}
function ALL() {
  CPU;
  MEMORY;
  NETWORK;
  STORAGE;
}
function INFO() {
  echo "#######################################################################"
  echo "#                              INFO                                   #"
  echo "#######################################################################"
  echo ""
  if [[ -x "$(command -v uptime)" ]]; then
    echo "############################ uptime ###################################"
    uptime;
    echo "";
  fi
  if [[ -x "$(command -v w)" ]]; then
    echo "############################## w ######################################"
    w;
    echo "";
  fi
  if [[ -x "$(command -v lscpu)" ]]; then
    echo "############################## lscpu ##################################"
    lscpu;
    echo "";
  fi
  if [[ -x "$(command -v lshw)" ]]; then
    echo "############################## lshw ###################################"
    lshw -short;
    echo "";
  fi
  if [[ -x "$(command -v lsscsi)" ]]; then
    echo "############################# lsscsi ##################################"
    lsscsi;
    echo "";
  fi
  if [[ -x "$(command -v lsusb)" ]]; then
    echo "############################# lsusb ###################################"
    lsusb;
    echo "";
  fi
}
function CHECK() {
  echo "granscan tools check"
  echo ""
  echo "CPU:"
  if [[ -x "$(command -v top)" ]]; then
    echo "  top         Installed"
  else
    echo "  top         Missing"
  fi
  if [[ -x "$(command -v ps)" ]]; then
    echo "  ps          Installed"
  else
    echo "  ps          Missing"
  fi
  echo ""
  echo "MEMORY:"
  if [[ -x "$(command -v free)" ]]; then
    echo "  free        Installed"
  else
    echo "  free        Missing"
  fi
  if [[ -x "$(command -v vmstat)" ]]; then
    echo "  vmstat      Installed"
  else
    echo "  vmstat      Missing"
  fi
  echo ""
  echo "NETWORK:"
  if [[ -x "$(command -v ip)" ]]; then
    echo "  ip          Installed"
  else
    echo "  ip          Missing"
  fi
  if [[ -x "$(command -v ifconfig)" ]]; then
    echo "  ifconfig    Installed"
  else
    echo "  ipconfig    Missing"
  fi
  if [[ -x "$(command -v netstat)" ]]; then
    echo "  netstat     Installed"
  else
    echo "  netstat     Missing"
  fi
  if [[ -x "$(command -v ss)" ]]; then
    echo "  ss          Installed"
  else
    echo "  ss          Missing"
  fi
  if [[ -x "$(command -v nicstat)" ]]; then
    echo "  nicstat     Installed"
  else
    echo "  nicstat     Missing"
  fi
  echo ""
  echo "STORAGE:"
  if [[ -x "$(command -v df)" ]]; then
    echo "  df          Installed"
  else
    echo "  df          Missing"
  fi
  if [[ -x "$(command -v lsblk)" ]]; then
    echo "  lsblk       Installed"
  else
    echo "  lsblk       Missing"
  fi
  if [[ -x "$(command -v lsof)" ]]; then
    echo "  lsof        Installed"
  else
    echo "  lsof        Missing"
  fi
  if [[ -x "$(command -v uptime)" ]]; then
    echo "  uptime      Installed"
  else
    echo "  uptime      Missing"
  fi
  echo ""
  echo "INFO:"
  if [[ -x "$(command -v w)" ]]; then
    echo "  w           Installed"
  else
    echo "  w           Missing"
  fi
  if [[ -x "$(command -v lscpu)" ]]; then
    echo "  lscpu       Installed"
  else
    echo "  lscpu       Missing"
  fi
  if [[ -x "$(command -v lshw)" ]]; then
    echo "  lshw        Installed"
  else
    echo "  lshw        Missing"
  fi
  if [[ -x "$(command -v lsscsi)" ]]; then
    echo "  lsscsi      Installed"
  else
    echo "  lsscsi      Missing"
  fi
  if [[ -x "$(command -v lsusb)" ]]; then
    echo "  lsusb       Installed"
  else
    echo "  lsusb       Missing"
  fi
}

while getopts ":ha" opt; do
  case $opt in
    h)
      if [[ $# == "1" ]]; then
        HELP;
      elif [[ $2 == "cpu" ]]; then
        CPUHELP
      elif [[ $2 == "memory" ]]; then
        MEMORYHELP
      elif [[ $2 == "network" ]]; then
        NETWORKHELP
      elif [[ $2 == "storage" ]]; then
        STORAGEHELP
      elif [[ $2 == "info" ]]; then
        INFOHELP
      elif [[ $2 == "check" ]]; then
        CHECKHELP
      fi
      ;;
    a)
      ALL;
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      echo "Check usage with: granscan -h" >&2
      ;;
  esac
done

if [[ $# == "0" ]]; then
  HELP;
elif [[ $1 == "help" ]]; then
  if [[ $# == "1" ]]; then
    HELP;
  elif [[ $2 == "cpu" ]]; then
    CPUHELP
  elif [[ $2 == "memory" ]]; then
    MEMORYHELP
  elif [[ $2 == "network" ]]; then
    NETWORKHELP
  elif [[ $2 == "storage" ]]; then
    STORAGEHELP
  elif [[ $2 == "info" ]]; then
    INFOHELP
  fi
elif [[ $1 == "cpu" ]]; then
  CPU;
elif [[ $1 == "memory" ]]; then
  MEMORY;
elif [[ $1 == "network" ]]; then
  NETWORK;
elif [[ $1 == "storage" ]]; then
  STORAGE;
elif [[ $1 == "all" ]]; then
  ALL;
elif [[ $1 == "info" ]]; then
  INFO;
elif [[ $1 == "check" ]]; then
  CHECK;
fi
