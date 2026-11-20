Shell script and example header file that I use for my personal C++ code, using Rust's integer type names (e.g., `u32`) instead of `<cstdint>` (`uint32_t`). 

> **Note:** I don't recommend using this in shared or production codebases—only for personal projects where you want the shorthand.

```bash
curl -sL [https://raw.githubusercontent.com/cc4lebb/cpp_tools/main/types.sh](https://raw.githubusercontent.com/cc4lebb/cpp_tools/main/types.sh) | bash
