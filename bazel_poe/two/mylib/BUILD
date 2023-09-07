cc_library(
  name = "mylib",
  srcs = ["mylib.cc"],
  deps = [
  ],
)

cc_test(
  name = "mylib_test",
  srcs = ["mylib_test.cc", "mylib.h", ],
  deps = [
    ":mylib",
    "@gtest//:gtest_main",
  ],
)

