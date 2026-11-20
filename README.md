## Overview
Shell script and example header file that I use for my personal C++ code, using Rust's integer type names (e.g., `u32`) instead of `<cstdint>` (`uint32_t`). 

> **Note:** I don't recommend using this in shared or production codebases—only for personal projects where you want the shorthand.

## Types
```bash
curl -sL https://raw.githubusercontent.com/cc4lebb/cpp_tools/main/types.sh | bash
```

| Alias | Underlying C++ Type | Category |
| :--- | :--- | :--- |
| `i8` | `std::int8_t` | Signed fixed-width integer |
| `i16` | `std::int16_t` | Signed fixed-width integer |
| `i32` | `std::int32_t` | Signed fixed-width integer |
| `i64` | `std::int64_t` | Signed fixed-width integer |
| `u8` | `std::uint8_t` | Unsigned fixed-width integer |
| `u16` | `std::uint16_t` | Unsigned fixed-width integer |
| `u32` | `std::uint32_t` | Unsigned fixed-width integer |
| `u64` | `std::uint64_t` | Unsigned fixed-width integer |
| `isize` | `std::ptrdiff_t` | Pointer-sized signed integer |
| `usize` | `std::size_t` | Pointer-sized unsigned integer |
| `f32` | `float` | 32-bit IEEE 754 floating-point |
| `f64` | `double` | 64-bit IEEE 754 floating-point |
