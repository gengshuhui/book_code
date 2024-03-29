# Stage 1


bazel build --config=clang_config //main:hello-world

要点总结： - 您需要在命令行中指定 --crosstool_top 标志，该标志应指向 cc_toolchain_suite - 您可以使用 .bazelrc 文件为特定配置创建快捷方式 - cc_toolchain_suite 可能会针对不同的 CPU 和编译器列出 cc_toolchains。您可以使用命令行标记（例如 --cpu）来区分。

---
This showcases how to build a single file to create a runnable application.

This BUILD file shows that we want to build a C++ binary using the ```cc_binary``` rule provided by Bazel.
In the ```cc_binary``` rule, name of the binary is specified in ```name``` attribute (in this example, it's ```hello-world```), required source files to be built are provided in ```srcs``` attribute.

```
cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
)
```

To build this example, use
```
bazel build //main:hello-world
```

If the build is successful, Bazel prints the output similar to
```
____Loading complete.  Analyzing...
____Found 1 target...
____Building...
Target //main:hello-world up-to-date:
  C:/tools/msys64/tmp/_bazel_woden/vqeu6v3v/execroot/__main__/bazel-out/msvc_x64-fastbuild/bin/main/hello-world.exe
____Elapsed time: 0,400s, Critical Path: 0,01s
```

In the run log above you can see where the executable was built so you can locate it and use it.

You can also get the output path with the bazel cquery command. For
example, the command below would print the path to the output file. This
is a useful technique for use in scripts, where you do not want to parse the
`bazel build` output.

```
bazel cquery --output=starlark \
  --starlark:expr="' '.join([f.path for f in target.files.to_list()])" \
  //main:hello-world
```
