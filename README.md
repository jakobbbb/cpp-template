# cpp-template

Template repository for a C++ project with `cmake`, `catch2` and
`OpenMP` support.

## Building Binaries and Running Tests

Run `make` to run the default Makefile target.  It builds the entire
project.  Binaries will be in `./build/source`.

The following other Makefile targets may be of use:

* `build` (default)
* `test`:
    Compile and run tests.
* `lint`:
    Check code formatting with `clang-format`.
* `codeformat`:
    Auto-format code with `clang-format`.
* `clean`:
    Remove build files.

You can also execute multiple targets.  For example, run `make clean
build-all test` to re-build everything and then run tests.

Note that Clang 10 is required for linting.
