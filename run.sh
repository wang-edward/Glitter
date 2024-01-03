#!/bin/bash

# ANSI escape codes for colors and styles
RED='\033[1;31m'
BOLD='\033[1m'
RESET='\033[0m'

# Change to the "build" directory
if [ -d "build" ]; then
    cd build || { echo -e "${RED}${BOLD}Error: Unable to change to 'build' directory${RESET}"; exit 1; }
else
    echo -e "${RED}${BOLD}Error: 'build' directory not found${RESET}"
    exit 1
fi

# Run CMake
cmake ..
if [ $? -ne 0 ]; then
    echo -e "${RED}${BOLD}Error: CMake configuration failed${RESET}"
    exit 1
fi

# Run Make
make
if [ $? -ne 0 ]; then
    echo -e "${RED}${BOLD}Error: Make failed${RESET}"
    exit 1
fi

# Change to the "Glitter" directory
if [ -d "Glitter" ]; then
    cd Glitter || { echo -e "${RED}${BOLD}Error: Unable to change to 'Glitter' directory${RESET}"; exit 1; }
else
    echo -e "${RED}${BOLD}Error: 'Glitter' directory not found${RESET}"
    exit 1
fi

# Run the Glitter executable
./Glitter
