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
export LD_LIBRARY_PATH=.
./prog
```

# Chapter 5. Node Objects
## 5.1. Builder Methods Return Lists of Target Nodes

