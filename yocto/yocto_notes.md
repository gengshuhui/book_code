  
# 0. code path
- code root path
  ```
  #code root path
  /data/poky/
  ```
- 确定版本
  `cat ./meta-poky/conf/distro/poky.conf | grep DISTRO`
  当前版本：4.0.7
  
#  1. oe-init-build-env
main file path: `/data/poky/oe-init-build-env`
> 总结：导出关键变量 OEROOT

- **export OEROOT**
  `OEROOT='declare -x OEROOT="/data/poky"'`
- 调用另一个脚本：
  `. "$OEROOT"/scripts/oe-buildenv-internal`
- 调用另一个脚本
  `"$OEROOT"/scripts/oe-setup-builddir`
  
## 1.1 oe-buildenv-internal
`scripts/oe-buildenv-internal`

> 总结：导出关键变量：BBPATH PYTHONPATH BUILDDIR PATH BB_ENV_PASSTHROUGH_ADDITIONS集合;
> PATH中加入BB相关路径:/data/poky/scripts:/data/poky/bitbake/bin:

- 检查SKD/ADT是已经初始化过
    ```shell
    if [ -z "$OE_SKIP_SDK_CHECK" ] && [ -n "$OECORE_SDK_VERSION" ]; then
        return  1
    fi
    ```
- 检查 python版本
- **export BBPATH**
    'declare -x BBPATH="/data/poky/build"'
- **export PYTHONPATH**，将BB的lib目录加到 PYTHONPATH 前面
  ```
  PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
  declare -x PYTHONPATH="/data/poky/bitbake/lib:"
  ```
    当前有如下目录
  ```
    bb/
    bblayers/
    bs4/
    codegen.py
    hashserv/
    layerindexlib/
    ply/
    progressbar/
    prserv/
    pyinotify.py
    simplediff/
    toaster/
  ```
- **export BUILDDIR**
- **export PATH**:将如下PATH加入系统PATH最前面
  - 'declare -- newpath="/data/poky/bitbake/bin"'
    ```
    bitbake*
    bitbake-diffsigs*
    bitbake-dumpsig -> bitbake-diffsigs*
    bitbake-getvar*
    bitbake-hashclient*
    bitbake-hashserv*
    bitbake-layers*
    bitbake-prserv*
    bitbake-selftest*
    bitbake-server*
    bitbake-worker*
    git-make-shallow*
    toaster*
    toaster-eventreplay*
    ```
  - 'declare -- newpath="/data/poky/scripts"'
    ```
    bitbake*
    oe-***
    runqemu*
    yocto-*
    ...
    ```
  - **export BB_ENV_PASSTHROUGH_ADDITIONS**
    ```
    'declare -- BB_ENV_PASSTHROUGH_ADDITIONS="ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy "'
    ```
    列表如下
    ```
    ALL_PROXY
    BBPATH_EXTRA
    BB_LOGCONFIG
    BB_NO_NETWORK
    BB_NUMBER_THREADS
    BB_SETSCENE_ENFORCE
    BB_SRCREV_POLICY
    DISTRO
    FTPS_PROXY
    FTP_PROXY
    GIT_PROXY_COMMAND
    HTTPS_PROXY
    HTTP_PROXY
    MACHINE
    NO_PROXY
    PARALLEL_MAKE
    SCREENDIR
    SDKMACHINE
    SOCKS5_PASSWD
    SOCKS5_USER
    SSH_AGENT_PID
    SSH_AUTH_SOCK
    STAMPS_DIR
    TCLIBC
    TCMODE
    all_proxy
    ftp_proxy
    ftps_proxy
    http_proxy
    https_proxy
    no_proxy
    ```

## 1.2 oe-setup-builddir
"$OEROOT"/scripts/oe-setup-builddir
调用：
```
TEMPLATECONF="$TEMPLATECONF"  "$OEROOT"/scripts/oe-setup-builddir
```

### 1.2.1 总结：

- 创建目录 build/conf; 
- 创建:"$BUILDDIR/conf/templateconf.cfg" -- 通过 TEMPLATECONF 
- 从模板创建："$BUILDDIR/conf/local.conf"，"$BUILDDIR/conf/bblayers.conf

### 1.2.2 详细过程
- **创建目录 build/conf**
  - mkdir -p "$BUILDDIR/conf"
- $BUILDDIR/conf/templateconf.cfg
  - 如果build/conf/templateconf.cfg 还在的话，读取 TEMPLATECONF 的值， -- 由第一次设置bb时生成
    ```
    if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
        TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
    fi
    ```
    如果有其值为：
    'declare -- TEMPLATECONF="meta-poky/conf"'
  
  - 运行 `. "$OEROOT"/.templateconf` 重新计算 TEMPLATECONF 的值
    - /data/poky/.templateconf 内容
    ```
    # 如果之前用户设置了，使用用户的配置，如果没有则使用默认的值`meta-poky/conf`
    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
    ```
    基值为`meta-poky/conf`，可以是个快捷方式
  - 如果文件"$BUILDDIR/conf/templateconf.cfg"不存在，则将 TEMPLATECONF 写入文件。
- local.conf和bblayers.conf
  - 如果值为`meta-poky/conf`，即是个快捷方式（非目录），将其扩展为完整路径，后面使用。
    'declare -- TEMPLATECONF="/data/poky/meta-poky/conf"'
  - TEMPLATECONF不为空，设置模板文件
    - 'declare -- OECORELAYERCONF="/data/poky/meta-poky/conf/bblayers.conf.sample"'
    - 'declare -- OECORELOCALCONF="/data/poky/meta-poky/conf/local.conf.sample"'
    - 'declare -- OECORENOTESCONF="/data/poky/meta-poky/conf/conf-notes.txt"'
  - 如果 "$BUILDDIR/conf/local.conf" 不存在，打印提示从"/data/poky/meta-poky/conf/local.conf.sample"创建。并设置参考文档打印信息
  - 如果 "$BUILDDIR/conf/bblayers.conf"不存在，打印提示从“/data/poky/meta-poky/conf/bblayers.conf.sample”创建 
- 最后提示'/data/poky/meta-poky/conf/conf-notes.txt'



## 1.3 unset OEROOT 并进入 build目录
