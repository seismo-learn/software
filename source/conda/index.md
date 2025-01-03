# conda

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（审稿）
- 最近更新时间：2025-01-03

---

[conda](https://docs.conda.io/projects/conda/en/stable/) 是一个跨平台的软件包管理器，可以方便地
安装各种软件包。

对于 Python 用户而言，其可以用于安装各种 Python 软件包并管理虚拟环境。建议所有 Python 用户使用
`conda` 安装和管理 Python 环境，而不使用 Linux 或 macOS 系统自带的 Python。**

## 安装

1. 下载 Miniforge

   Miniforge 是一个精简的 Python 发行版，其内置了 `conda` 命令。

   根据根据自己使用的系统，从 [Miniforge 官方页面](https://conda-forge.org/download/)
   或 [清华大学 Miniforge 镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/)
   下载对应的安装包。

   - Linux 64 位系统：
     [官方链接](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-Linux-x86_64.sh)
   - Windows 64 位系统：
     [官方链接](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-Windows-x86_64.exe)
   - macOS (Intel 芯片):
     [官方链接](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-x86_64.sh) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-MacOSX-x86_64.sh)
   - macOS (Apple Silicon 芯片):
     [官方链接](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh)
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/conda-forge/miniforge/LatestRelease/Miniforge3-MacOSX-arm64.sh)

2. 安装 Miniforge

    ::::{tab-set}

    :::{tab-item} Windows
    直接双击安装包即可安装。
    :::

    :::{tab-item} Linux
    ```
    $ bash Miniforge3-Linux-x86_64.sh
    ```
    :::

    :::{tab-item} macOS
    ```
    # Intel 芯片
    $ bash Miniforge3-MacOSX-x86_64.sh
    # Apple Silicon 芯片
    $ bash Miniforge3-MacOSX-arm64.sh
    ```
    :::

    ::::

   Miniforge 默认会安装到 {file}`${HOME}/miniforge3` 下，在安装过程中可以设置为其他路径。

   安装通常只需要十几秒，在安装的最后会出现:
   ```
   To activate this environment, use:

       micromamba activate /Users/seisman/opt/miniforge

   Or to execute a single command in this environment, use:

       micromamba run -p /Users/seisman/opt/miniforge mycommand

   installation finished.

   Do you wish to update your shell profile to automatically initialize conda?
   This will activate conda on startup and change the command prompt when activated.
   If you'd prefer that conda's base environment not be activated on startup,
   run the following command when conda is activated:

       conda config --set auto_activate_base false

   You can undo this by running `conda init --reverse $SHELL`? [yes|no]
   [no] >>>
   ```

   默认是 `no`，建议输入 `yes`，此时安装包会向当前 SHELL 的配置文件（如 {file}`~/.bashrc` 或
   {file}`~/.zshrc`）中写入 `conda` 初始化语句。

3. 测试安装

   打开一个新的终端，在终端中输入 `python`，输出中看到 `packaged by conda-forge` 字样即代表安装完成:
   ```
   $ python
   Python 3.12.8 | packaged by conda-forge | (main, Dec  5 2024, 14:25:12) [Clang 18.1.8 ] on darwin
   Type "help", "copyright", "credits" or "license" for more information.
   >>>
   ```

# 配置 `conda`

`conda` 命令可以用于安装 Python 包、管理虚拟环境，此外，也可以使用 Python 自带的工具 `pip` 来安装
Python 包，其详细用法见 [pip 官方文档](https://pip.pypa.io/en/stable/)。我们建议尽可能使用 `conda`
来安装 Python 包，仅在 conda 没有提供需要的程序包时才使用 `pip` 来安装。

在使用 `conda` 前可以配置使用国内清华源以加快软件包下载速度：
```
$ conda config --set 'custom_channels.conda-forge' https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

## 使用 conda

以下仅介绍一些 `conda` 的常用命令，其详细用法见
[conda 官方文档](https://docs.conda.io/projects/conda/en/latest/index.html)。

创建虚拟环境:
```
# 虚拟环境名为 seismo-learn，初始 Python 版本与 base 环境相同
$ conda create --name seismo-learn
```

激活虚拟环境:
```
# 激活名为 seismo-learn 的虚拟环境
$ conda activate seismo-learn
```

取消激活当前虚拟环境:
```
$ conda deactivate
```

:::{note}
安装 Anaconda/Miniconda 后，打开终端默认会激活 base 环境。不经常使用
Python 的读者可以通过如下命令取消此默认设置:

```
$ conda config --set auto_activate_base False
```

取消后，可以临时激活 base 环境:
```
$ conda activate base
```

重新激活此默认设置:
```
$ conda config --set auto_activate_base True
```
:::

搜索模块:
```
$ conda search numpy
```

安装模块:
```
$ conda install numpy
```

更新模块:
```
$ conda update numpy
```

使用 pip 安装模块:
```
$ pip install numpy
```

## 参考文档

- <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>
- <https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html>