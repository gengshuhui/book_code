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
## 5.1. Builder Methods Return Lists of Target Nodes

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

## 6.3. Caching Implicit Dependencies
只使用上一次构建的隐式依赖关系，新增加同名文件也不会检测出来---慎用

SCons will ignore any changes that may have been made to search paths (like $CPPPATH or $LIBPATH). 
```
scons -Q --implicit-cache 
```
set as defult 
```
SetOption('implicit_cache', 1)
```

### 6.3.1. The --implicit-deps-changed Option
重新扫描
```
scons -Q --implicit-deps-changed
```
### 6.3.2. The --implicit-deps-unchanged Option
在你知道更改了代码也不影响 结果的情况下使用（如改了源文件，但没有改include行）
```
scons -Q ----implicit-deps-unchanged
```

## 6.4. Explicit Dependencies: the Depends Function
```
hello = Program('hello.c')
goodbye = Program('goodbye.c')
Depends(hello, goodbye)
```

修改goodbye.C
```
scons -Q hello
```
结果：
```
gcc -o goodbye.o -c goodbye.c
scons: `hello' is up to date.
```

## 6.5. Dependencies From External Files: the ParseDepends Function
处理SCons的built-in C scanner不能提取出隐式头文件依赖关系的场景，如：
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