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

## 6.8. The AlwaysBuild Function
- 确保某个目标在每次构建时都被构建，无论其依赖关系是否已满足。
- 只影响目标本身的构建，而不影响其依赖关系的构建。

```
hello = Program('hello.c')
AlwaysBuild(hello)
```

```
# scons -Q
gcc -o hello.o -c hello.c
gcc -o hello hello.o

# scons -Q
gcc -o hello hello.o

# scons -Q hello.o
scons: `hello.o' is up to date.
```

# Chapter 7. Environments
- External Environment  外部环境: 
  > 用户运行 SCons 时其环境中已有的一组变量。这些变量不会自动成为 SCons 构建的一部分，但可以根据需要进行检查
- Construction Environment 
  > 在 SConscript 文件中创建的一个独立对象
- Execution Environment  执行环境
  > SCons 在执行外部命令（例如编译器或链接器）时设置的值

> 与 Make 不同， SCons 不会自动在不同环境之间复制或导入值（ 构造环境的显式克隆除外， 它们从其父级继承值）,避免了构建过程中出现的一系列问题环境不一致问题.
>  SConscript 编写器可以轻松地安排在环境之间复制或导入变量,构建系统的实现者 做出有意识的选择 关于如何以及何时导入 从一个环境到另一个环境的变量

## 7.1. Using Values From the External Environment
> Python os.environ 字典中找到

## 7.2. Construction Environments
> SCons 允许你创建和配置多个构造环境来控制软件的构建方式，从而满足不同的构建需求

### 7.2.1. 创建构造环境 ： Environment 函数

```
env = Environment()
```
每个新的构建环境由两部分组成:
- 根据它在你的系统上找到的工具构造一组变量
- 默认的构建器方法集

构造环境时可以指定一组变量来覆盖默认值或添加新变量
```
env = Environment(CC='gcc', CCFLAGS='-O2')
env.Program('hello.c')
```

```
gcc -o hello.o -c -O2 hello.c
gcc -o hello hello.o
```

### 7.2.3. 从构造环境中扩展值： subst 方法
```
env = Environment(CCFLAGS='-DFOO')
print("CCCOM is:", env['CCCOM'])

# 调用 subst 方法将递归扩展所有以 $ （美元符号）为前缀的构造变量 
env = Environment(CCFLAGS='-DFOO')
print("CCCOM is:", env.subst('$CCCOM'))
```

结果:
```
CC is: gcc
CCCOM is: $CC -o $TARGET -c $CFLAGS $CCFLAGS $_CCCOMCOM $SOURCES
CCCOM is: gcc -o -c -DFOO
scons: `.' is up to date.
```

### 7.2.4 处理值扩展问题（高级主题）
```
env = Environment()
print("1 value is:", env.subst('->$MISSING<-'))


AllowSubstExceptions(IndexError, NameError, ZeroDivisionError)
env = Environment()
print("2 value is:",  env.subst('->${1 / 0}<-'))

# 如果多次调用 AllowSubstExceptions ，则每次调用 完全覆盖先前允许的例外列表。

# 不带参数遇到异常即停止 scons,下面的打印会异常
AllowSubstExceptions()
env = Environment()
print("3 value is:", env.subst('->$MISSING<-'))
```
结果:
```
1 value is: -><-
2 value is: -><-

scons: *** NameError `name 'MISSING' is not defined' trying to evaluate `$MISSING'
File "/data/book_code/scons/SconsUserGuide/7.2.4HandProbWithValueException/SConstruct", line 13, in <module>
```

### 7.2.5 控制默认构造环境 ： DefaultEnvironment 函数
```
# 默认构造环境该构造环境包含 SCons 默认配置的各种编译器和其他工具的设置，或者以其他方式在您的系统上发现并识别这些工具。
# 该环境的默认设置通常足以编译大多数 C/C++ 程序。
# DefaultEnvironment 函数返回已初始化的默认构造环境对象，
# （注意，默认环境的工作方式类似于单例 - 它只能有一个实例）
# 函数的一个非常常见的用途是加速 SCons 初始化，一旦初始化，后面就不再搜索了
def_env = DefaultEnvironment()
print("0 CC is:", def_env['CC'])

def_env = DefaultEnvironment(CC='/usr/local/bin/gcc')
print("1 CC is:", def_env['CC'])

def_env = DefaultEnvironment()
print("2 CC is:", def_env['CC'])

def_env['CC'] = '/usr/local/bin/gcc_1'
print("3 CC is:", def_env['CC'])

def_env = DefaultEnvironment()
print("4 CC is:", def_env['CC'])
```

结果:
```
0 CC is: gcc
1 CC is: gcc
2 CC is: gcc
3 CC is: /usr/local/bin/gcc_1
4 CC is: /usr/local/bin/gcc_1
scons: `.' is up to date.
```

### 7.2.6 多个构造环境
```
opt = Environment(CCFLAGS='-O2')
dbg = Environment(CCFLAGS='-g')

o = opt.Object('hello-opt', 'hello.c')
opt.Program(o)

d = dbg.Object('hello-dbg', 'hello.c')
dbg.Program(d)
```
结果:
```
gcc -o hello-dbg.o -c -g hello.c
gcc -o hello-dbg hello-dbg.o
gcc -o hello-opt.o -c -O2 hello.c
gcc -o hello-opt hello-opt.o
```

### 7.2.7 克隆构造环境
```
env = Environment(CC='gcc')
opt = env.Clone(CCFLAGS='-O2')
dbg = env.Clone(CCFLAGS='-g')

o = opt.Object('hello-opt', 'hello.c')
opt.Program(o)

d = dbg.Object('hello-dbg', 'hello.c')
dbg.Program(d)
```
结果:
```
gcc -o hello-dbg.o -c -g hello.c
gcc -o hello-dbg hello-dbg.o
gcc -o hello-opt.o -c -O2 hello.c
gcc -o hello-opt hello-opt.o
```

### 7.2.8 替换值： Replace 方法
```
env = Environment(CCFLAGS='-DDEFINE1')
print("CCFLAGS = %s" % env['CCFLAGS'])
env.Program('hello.c')

env.Replace(CCFLAGS='-DDEFINE2')
print("CCFLAGS = %s" % env['CCFLAGS'])
env.Program('goodbye.c')

# 读取 SConscript 文件时发生替换为不同的值, 但构建目标时却是最终的值 DEFINE2（相同的env）
# 因为变量直到实际使用构造环境来构建目标时才会展开，并且因为 SCons 函数和方法调用 与顺序无关， 最后一个替换者“获胜” 并用于构建所有目标
```
结果:
```
scons: Reading SConscript files ...
CCFLAGS = -DDEFINE1
CCFLAGS = -DDEFINE2
scons: done reading SConscript files.
scons: Building targets ...
gcc -o goodbye.o -c -DDEFINE2 goodbye.c
gcc -o goodbye goodbye.o
gcc -o hello.o -c -DDEFINE2 hello.c
gcc -o hello hello.o
scons: done building targets.
```
多个替换值可以这样写
```
newvalues = {
    "F77PATH": ['foo', '$FOO/bar', blat],
    "INCPREFIX": 'foo ',
    "INCSUFFIX": 'bar',
    "FOO": 'baz',
}
env.Replace(**newvalues)
```

### 7.2.9 仅当值尚未定义时才设置值： SetDefault 方法

```
# 仅当构造环境尚未定义该变量时，才能够指定构造变量应设置为某个值
# 这在编写自己的 Tool 模块以将变量应用于构造环境时特别有用。
env.SetDefault(SPECIAL_FLAG='-extra-option')
```

### 7.2.10 附加到值的末尾： Append 方法
```
env = Environment(CPPDEFINES=['MY_VALUE'])
env.Append(CPPDEFINES=['LAST'])
env.Program('hello.c')

# 如果构造变量尚不存在， Append 方法将创建它：
env.Append(NEW_VARIABLE = 'added')
print("NEW_VARIABLE = %s"%env['NEW_VARIABLE'])
```
结果：
```
NEW_VARIABLE = added
gcc -o hello.o -c -DMY_VALUE -DLAST hello.c
gcc -o hello hello.o
```

### 7.2.11 附加唯一值： AppendUnique 方法

