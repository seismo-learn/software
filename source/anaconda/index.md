# Anaconda/Miniconda

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（审稿）
- 最近更新时间：2023-04-30

---

[Anaconda](https://www.anaconda.com/download/) 是一个跨平台的、用于科学计算的 Python 发行版，
其提供了 Python、包管理器 `conda` 并内置了几百个科学计算相关的软件包。
[Miniconda](https://docs.conda.io/en/latest/miniconda.html) 可以看做是
Anaconda 的精简版，其只提供了 Python、包管理器 `conda` 以及相关的必须依赖包。

与 Anaconda 相比，Miniconda 安装包更小，安装速度更快，且安装后占用的硬盘空间更小。
Anaconda 内置的数百个软件包也都可以很容易通过 `conda` 安装。因而，
**建议所有 Python 用户使用 Miniconda，而非 Linux 或 macOS 系统自带的 Python。**

## 安装

1. 下载 Miniconda

   根据自己使用的系统，从 [Miniconda 官方下载页面](https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links)
   或 [清华大学 Miniconda 镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/) 下载对应的安装包。

   - Linux 64 位系统：
     [官方链接](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh)
   - Windows 64 位系统：
     [官方链接](https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Windows-x86_64.exe)
   - macOS (Intel 芯片):
     [官方链接](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh) |
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-MacOSX-x86_64.sh)
   - macOS (M1 芯片):
     [官方链接](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh)
     [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-MacOSX-arm64.sh)

2. 安装 Miniconda

    ::::{tab-set}

    :::{tab-item} Windows
    直接双击安装包即可安装。
    :::

    :::{tab-item} Linux
    ```
    $ bash Miniconda3-latest-Linux-x86_64.sh
    ```
    Content 2
    :::

    :::{tab-item} macOS
    ```
    # Intel 芯片
    $ bash Miniconda3-latest-MacOSX-x86_64.sh
    # M1 芯片
    $ bash Miniconda3-latest-MacOSX-arm64.sh
    ```
    :::

    ::::

   Miniconda 默认会安装到 {file}`${HOME}/miniconda3` 下，在安装过程中可以
   设置为其他路径。

   安装通常只需要十几秒，在安装的最后会出现:

   ```
   Do you wish the installer to initialize Miniconda3 by running conda init? [yes|no]
   [yes] >>>
   ```

   建议输入 `yes`，此时安装包会向当前 SHELL 的配置文件（如 {file}`~/.bashrc`
   或 {file}`~/.zshrc`）中写入 `conda` 初始化语句。

3. 测试安装

   打开一个新的终端，在终端中输入 `python`，输出中看到 **Anaconda, Inc.**
   字样即代表安装完成:

   ```
   $ python
   Python 3.8.5 (default, Sep  4 2020, 02:22:02)
   [Clang 10.0.0 ] :: Anaconda, Inc. on darwin
   Type "help", "copyright", "credits" or "license" for more information.
   >>>
   ```

# 配置 `conda`

Anaconda/Miniconda 中提供的 `conda` 命令可以用于安装 Python 包、管理虚拟环境，
此外，也可以使用 Python 自带的工具 `pip` 来安装 Python 包，其详细用法见
[pip 官方文档](https://pip.pypa.io/en/stable/)。我们建议尽可能使用 `conda` 来安装 Python 包，
仅在 conda 没有提供需要的程序包时才使用 `pip` 来安装。

在使用 `conda` 前需要对 `conda` 做简单的配置。

[conda-forge](https://conda-forge.org/) 是一个由社区维护的大量 Python 包的通道。
为 conda 增加 conda-forge 通道，可以安装更多的软件包：
```
$ conda config --add channels conda-forge
```

设置通道优先级为 strict。当一个包同时位于 conda-forge 和 main 通道时，总是使用 conda-forge 提供的包，
以避免混用 conda-forge 和 main 通道导致环境依赖关系解析变慢： 
```
$ conda config --set channel_priority true
```

显示通道 URL，以更清楚地知道每个包是从哪个通道安装的：
```
$ conda config --set show_channel_urls true
```

配置使用国内清华源以加快软件包下载速度：
```
$ conda config --add default_channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
$ conda config --set 'custom_channels.conda-forge' https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

设置 `conda` 使用更快的 libmamab solver：
```
$ conda install -n base conda-libmamba-solver
$ conda config --set solver libmamba
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

- <https://docs.anaconda.com/anaconda/install/>
- <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>
- <https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html>
- <https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/>
- <https://mirrors.tuna.tsinghua.edu.cn/help/pypi/>