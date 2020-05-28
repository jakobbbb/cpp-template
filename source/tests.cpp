#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>

TEST_CASE("hello", "[hello]") {
  SECTION("42 is 42", "[42]") {
    REQUIRE(42 == 42);
  }
}
