#!/usr/bin/env bash
set -euo pipefail

FORCE=0
CREATE_SRC=0

for arg in "$@"; do
  case "$arg" in
    -f|--force) FORCE=1 ;;
    --with-src) CREATE_SRC=1 ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Usage: $0 [-f|--force] [--with-src]" >&2
      exit 1
      ;;
  esac
done

if [[ -e "Makefile" && "$FORCE" -ne 1 ]]; then
  echo "Makefile already exists in $(pwd). Pass -f or --force to overwrite." >&2
  exit 1
fi

if [[ "$CREATE_SRC" -eq 1 ]]; then
  mkdir -p src
fi

cat << 'MAKEFILE_EOF' > Makefile
# Compiler and flags
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -Werror -O2 -g -MMD -MP
LDFLAGS  :=
LDLIBS   :=

# Project structure
SRCDIR := src
OBJDIR := build
TARGET := main

# Recursively discover all .cpp files (handles new folders/files on creation)
SRCS := $(shell find $(SRCDIR) -name '*.cpp' 2>/dev/null) $(wildcard *.cpp)
OBJS := $(patsubst %.cpp, $(OBJDIR)/%.o, $(SRCS))

# Default target
all: $(TARGET)

# Link the final binary
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

# Compile source files into object files (auto-creates subdirectories)
$(OBJDIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -I. -c -o $@ $<

# Clean build artifacts
clean:
	rm -rf $(OBJDIR) $(TARGET)

# Run the compiled binary
run: $(TARGET)
	./$(TARGET)

# Auto-dependency tracking (pulled in after first build)
-include $(OBJS:.o=.d)

# Phony targets
.PHONY: all clean run
MAKEFILE_EOF

echo "Wrote Makefile to $(pwd)/Makefile"
