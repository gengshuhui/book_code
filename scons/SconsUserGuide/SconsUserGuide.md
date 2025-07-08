# SCons 4.9.1 User Guide
https://www.scons.org/doc/production/HTML/scons-user.html

# Chapter 1. Building and Installing SCons
```
python3 -m pipx install scons
```

# Chapter 2. Simple Builds
## 2.1. Building Simple C / C++ Programs
```
# 常用命令
scons -Q
scons

# clean build
scons -c

# can not clean .sconsign.dblite
```

## 2.2. Building Object Files
```
Program('hello.c')
```


### 2.5.2. SCons Builders Are Order-Independent
```
print("Reading SConstruct file hello.c")
Program('hello.c')
print("Reading SConstruct file goodbye.c")
Program('goodbye.c')
```

Result is
```
scons: Reading SConscript files ...
Reading SConstruct file hello.c
Reading SConstruct file goodbye.c
scons: done reading SConscript files.
scons: Building targets ...
gcc -o goodbye.o -c goodbye.c
gcc -o goodbye goodbye.o
gcc -o hello.o -c hello.c
gcc -o hello hello.o
scons: done building targets.
```

## 2.6. Making the SCons Output Less Verbose
```
scons -Q
```

# Chapter 3. Less Simple Things to Do With Builds
## 3.1. Specifying the Name of the Target (Output) File
```
Program('new_hello', 'hello.c')
```

## 3.2. Compiling Multiple Source Files
```
Program(['prog.c', 'file1.c', 'file2.c'],)
```

the Result is
```
gcc -o file1.o -c file1.c
gcc -o file2.o -c file2.c
gcc -o prog.o -c prog.c
gcc -o prog prog.o file1.o file2.o
```

## 3.3. Making a list of files with Glob
```
Program('program', Glob('*.c'))
```

## 3.6. Keyword Arguments
```
Program(target='program', source=Glob('*.c'))
src_files = Glob('*.c')
Program(target='program_1', source=src_files)

src_files = ['prog.c', 'file1.c', 'file2.c']
Program(target='program_2', source=src_files)

src_files = Split('prog.c file1.c file2.c')
Program(target='program_3', source=src_files)

src_files = Split("""
    prog.c
    file1.c
    file2.c
""")
Program('program_4', src_files)
  
```

## 3.8. Sharing Source Files Between Multiple Programs
```
src_files = Split('hello.c file1.c file2.c')
Program(target='hello', source=src_files)

src_files = Split('goodbye.c file1.c file2.c')
Program(target='goodbye', source=src_files)
```

the result is
```
gcc -o file1.o -c file1.c
gcc -o file2.o -c file2.c
gcc -o goodbye.o -c goodbye.c
gcc -o goodbye goodbye.o file1.o file2.o
gcc -o hello.o -c hello.c
gcc -o hello hello.o file1.o file2.o
```

# Chapter 4. Building and Linking with Libraries
## 4.1. Building Libraries
## 4.2. Linking with Libraries

```
StaticLibrary(target='sfile', source='file1.c')
SharedLibrary(target='dfile', source='file2.c')
Program(target='prog', source=['prog.c',], LIBS=['sfile', 'dfile'], LIBPATH='.')
```

```
gcc -o file1.o -c file1.c
gcc -o file2.os -c -fPIC file2.c
gcc -o libdfile.so -shared file2.os
ar rc libsfile.a file1.o
ranlib libsfile.a
gcc -o prog.o -c prog.c
gcc -o prog prog.o -L. -lsfile -ldfile
scons: done building targets.
```
```
export LD_LIBRARY_PATH=.
./prog
```

# Chapter 5. Node Objects
```

# 5.1. Builder Methods Return Lists of Target Nodes
f1_list = Object('file1.c')
f2_list = Object('file2.c')

hello_list = Object('hello.c', CCFLAGS='-DHELLO')

Program(hello_list + f1_list)

# 5.2. Explicitly Creating File and Directory Nodes

goodbye_c = File('goodbye.c')
Program(goodbye_c)

# classes = Dir('classes')
# Java(classes, 'src')
# xyzzy = Entry('xyzzy')

# 5.3. Printing Node File Names
object_list = Object('goodbye.c')
program_list = Program(object_list)
print("5.3 The object file is: %s" % object_list[0])
print("5.3 The program file is: %s" % program_list[0])

# 5.4. Using a Node's File Name as a String
import os.path
program_list = Program('goodbye.c')
program_name = str(program_list[0])
if not os.path.exists(program_name):
    print("5.4 %s does not exist!" % program_name)

# 5.5. GetBuildPath: Getting the Path From a Node or String
env=Environment(VAR="value")
n=File("foo.c")
print("5.5", env.GetBuildPath([n, "sub/dir/$VAR"]))
```

```
5.3 The object file is: goodbye.o
5.3 The program file is: goodbye
5.4 goodbye does not exist!
5.5 ['foo.c', 'sub/dir/value']
gcc -o file1.o -c file1.c
gcc -o file2.o -c file2.c
gcc -o goodbye.o -c goodbye.c
gcc -o goodbye goodbye.o
gcc -o hello.o -c -DHELLO hello.c
gcc -o hello hello.o file1.o
```


# Chapter 6. Dependencies
## 6.1. Deciding When an Input File Has Changed: the Decider Function
### 6.1.1. Using Content Signatures to Decide if a File Has Changed
### 6.1.2. Using Time Stamps to Decide If a File Has Changed
### 6.1.3. Deciding If a File Has Changed Using Both MD Signatures and Time Stamps
todo:

### 6.1.4. Extending SCons: Writing Your Own Custom Decider Function
todo:

### 6.1.5. Mixing Different Ways of Deciding If a File Has Changed
todo:

## 6.2. Implicit Dependencies: The $CPPPATH Construction Variable
- 头文件依赖变化时,SCons会自动重新构建目标文件

```
#include <stdio.h>
#include <hello.h>
int main()
{
    printf("Hello, %s!\n", string);
}
```


```
Program('hello.c', CPPPATH='.')
Program('hello_1', 'hello.c', CPPPATH=['include', '.'])
```


## 6.3. Caching Implicit Dependencies
- 只使用上一次构建的隐式依赖关系, 新增加同名文件也不会检测出来---慎用
- SCons will ignore any changes that may have been made to search paths (like $CPPPATH or $LIBPATH). 

```
scons -Q --implicit-cache 
```

- 设置成默认值
```
SetOption('implicit_cache', 1)
```

### 6.3.1. The --implicit-deps-changed Option
- 重新扫描之前缓存的隐式依赖

```
scons -Q --implicit-deps-changed
```
### 6.3.2. The --implicit-deps-unchanged Option
- 在你知道更改了代码也不影响 结果的情况下使用(如改了源文件,但没有改include行)

```
scons -Q ----implicit-deps-unchanged
```

## 6.4. Explicit Dependencies: the Depends Function
- 一个文件依赖于另一个未被 SCons 扫描器检测到的文件

```
hello = Program('hello.c')
goodbye = Program('goodbye.c')
Depends(hello, goodbye)
```

修改goodbye.C
```
scons -Q hello
```

结果
```
gcc -o goodbye.o -c goodbye.c
scons: `hello' is up to date.
```

## 6.5. Dependencies From External Files: the ParseDepends Function
- 处理SCons的built-in C scanner不能提取出隐式头文件依赖关系的场景，如：

```
#define FOO_HEADER <hello.h>
#include FOO_HEADER

int main() {
    return FOO;
}
```

`scons goodbye -Q --debug=explain`

change  hello.h

`scons goodbye -Q --debug=explain`

```
scons: rebuilding `goodbye.o' because `hello.h' changed
gcc -o goodbye.o -c -MD -MF goodbye.d -I. goodbye.c
scons: `goodbye' is up to date.
```

## 6.6. Ignoring Dependencies: the Ignore Function
- 多个系统之间共享的目录 拥有不同的副本 stdio.h 包含文件，如果不想让SCons跟踪某个文件或目录的更改，可以使用Ignore函数。
- 阻止动态生成的文件被默认构建
```
hello_obj=Object('hello.c')
hello = Program(hello_obj)
Ignore('.',[hello,hello_obj])
```
不指定目录，修改hello.c不会重新构建
```
gcc -o hello.o -c hello.c
gcc -o hello hello.o

# change hello.c
scons -Q
scons: `.' is up to date.
```

指定具体目标构建还是会构建的
```
scons -Q hello
gcc -o hello.o -c hello.c

# change hello.c
scons -Q hello
scons: `hello' is up to date.
```

## 6.7. Order-Only Dependencies: the AlwaysBuild Function
- 指定某个文件/目录必在构建其他目标之前构建或创建，但对该文件/目录的更改不会要求重建目标本身

```
import time

version_c_text = """
char *date = "%s";
""" % time.ctime(time.time())
open('version.c', 'w').write(version_c_text)

hello = Program(['hello.c', 'version.c'])

# ----------------------------
version_obj = Object('version.c')
goodbye = Program('goodbye.c',
                LINKFLAGS = str(version_obj[0]))

Requires(goodbye, version_obj)
```
结果：
```
# scons -Q hello
gcc -o hello.o -c hello.c
gcc -o version.o -c version.c
gcc -o hello hello.o version.o

# scons -Q hello
gcc -o version.o -c version.c
gcc -o hello hello.o version.o

# scons -Q goodbye
gcc -o version.o -c version.c
gcc -o goodbye.o -c goodbye.c
gcc -o goodbye version.o goodbye.o

# scons -Q goodbye
gcc -o version.o -c version.c
scons: `goodbye' is up to date.
```


