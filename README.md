# cpp-template

Template repository for a C++17 project with CMake, Catch2 and OpenMP
support.

Tests are run using GitHub Actions on Linux and macOS.  Windows is not
supported yet.

## Customization

### Use System Catch2

If you don't want to include `catch.hpp` in the Git repo, simply remove
the `external/catch2` directory.  This will use use your locally
installed version of Catch2.

### Upgrading Catch2

A script to upgrade Catch2 is provided at `external/catch2/upgrade.sh`.

### Make OpenMP Optional or Remove It

The root `CMakeLists.txt` may be adapted to
* make OpenMP optional by removing the `REQUIRED` keyword in
  `find_package(OpenMP REQUIRED)` or
* OpenMP support may be removed entirely by removing the lines relating
  to OpenMP.

### Adding Targets

To add new targets, adapt `source/CMakeLists.txt`.  By default, the CI
is supposed to check if the binaries don't crash, so remember to add one
or more example invocations to the `Run Binaries` step in
`.github/workflows/test.yml`.

### Don't Require Linting in CI

If you don't want the CI to fail because your code is not formatted
properly, feel free to remove the `Lint` step from
`.github/workflows/test.yml`.

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
build test` to re-build everything and then run tests.

Note that Clang 10 is required for linting.
