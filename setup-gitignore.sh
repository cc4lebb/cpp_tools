#!/usr/bin/env bash
set -eo pipefail

: "${PROMPT_START:=}"
FORCE=0

for arg in "$@"; do
  case "$arg" in
    -f|--force) FORCE=1 ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Usage: $0 [-f|--force]" >&2
      exit 1
      ;;
  esac
done

if [[ -e ".gitignore" && "$FORCE" -ne 1 ]]; then
  echo ".gitignore already exists in $(pwd). Pass -f or --force to overwrite." >&2
  exit 1
fi

cat << 'GITIGNORE_EOF' > .gitignore
# Executables
/main
*.exe

# Prerequisites
*.d

# Compiled Object files
*.slo
*.lo
*.o
*.obj

# Precompiled Headers
*.gch
*.pch

# Linker / Map files
*.ilk
*.map

# Debugger Files
*.pdb
*.dwo
*.debug

# Compiled Dynamic libraries
*.so
*.so.*
*.dll

# Fortran module files
*.mod
*.smod

# Compiled Static libraries
*.lai
*.la
*.a
*.lib

# Build directories
[Bb]uild/
[Bb]uild-*/
cmake-build-*/

# CMake generated files
CMakeFiles/
CMakeCache.txt
cmake_install.cmake
Makefile
install_manifest.txt
compile_commands.json

# Temporary files
*.tmp
*.log
*.bak
*.swp

# vcpkg
vcpkg_installed/

# Test output & cache
Testing/
.cache/
GITIGNORE_EOF

echo "Wrote .gitignore to $(pwd)/.gitignore"
