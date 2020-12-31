安装 Anaconda
=============

**推荐所有 Python 用户安装 Anaconda！**

Python 是一种强大的编程语言，其提供了很多用于科学计算的模块，常见的包括
numpy、scipy 和 matplotlib。要利用 Python
进行科学计算，就需要一一安装所需的模块，
而这些模块可能又依赖于其它的软件包或库，因而安装和使用起来相对麻烦。幸好有人
专门在做这一类事情，将科学计算所需要的模块都编译好，然后打包以发行版的形式
供用户使用，Anaconda 就是最常用的科学计算发行版。

Anaconda 的特点：

-  包含了众多流行的科学、数学、工程、数据分析的 `Python
   包 <https://docs.anaconda.com/anaconda/packages/pkg-docs/>`__
-  完全开源和免费
-  全平台支持：Linux、Windows、macOS
-  支持 Python 2.x 和 3.x，可自由切换

安装
----

1. 下载 Anaconda

   进入清华 Anaconda 镜像:
   https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/

   滚屏拉到最后，根据自己的系统从最后6个文件中下载自己需要的安装文件。

   对于Linux 64位用户，即
   `Anaconda3-5.3.0-Linux-x86_64.sh <https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.3.0-Linux-x86_64.sh>`__

2. 安装 Anaconda

   终端执行如下命令以安装Anaconda:

   ::

      $ bash ./Anaconda3-5.3.0-Linux-x86_64.sh

   默认安装路径为 ``${HOME}/anaconda3`` ，我个人喜欢安装到
   ``${HOME}/.anaconda`` 。

3. 测试安装

   终端输入 ``python`` ， 输出中看到 ``Anaconda, Inc.`` 即代表安装完成:

   ::

      $ python
      Python 3.6.3 |Anaconda, Inc.| (default, Oct 13 2017, 12:02:49)
      [GCC 7.2.0] on linux
      Type "help", "copyright", "credits" or "license" for more information.
      >>>

设置国内镜像
------------

使用 ``conda`` 或 ``pip`` 安装 Python
模块时默认会从官方镜像下载模块包，相对来说速度
比较慢，可以设置使用国内镜像以加快下载速度。

Anaconda 镜像
~~~~~~~~~~~~~

添加清华 Anaconda 镜像以加快 ``conda`` 下载模块的速度:

::

   $ conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
   $ conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
   $ conda config --set show_channel_urls yes

添加第三方源 ``conda-forge`` 并添加清华镜像:

::

   $ conda config --add channels conda-forge
   $ conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/

这几个命令会修改文件 ``~/.condarc`` 。

添加 pip 镜像
~~~~~~~~~~~~~

添加清华 pip 源以加快 ``pip`` 下载模块的速度。

编辑 ``~/.pip/pip.conf`` 文件（如果没有则创建之），将 ``index-url``
开头的一行修改为下面一行：

::

   [global]
   index-url = https://pypi.tuna.tsinghua.edu.cn/simple

升级
----

可以使用如下命令升级所有已安装的模块：

::

   conda update --all

新版本 Anaconda 发布后，可以使用如下命令升级 Anaconda：

::

   conda update conda
   conda update anaconda

Anaconda 可以方便地提供 python2 的运行环境
------------------------------------------

::

   conda create -n python2 python=2.7 anaconda # 设置一个 Python 2.7 的环境，其名称为 python2
   conda activate python2 # 激活 Python 2.7 的环境

如果遇到一些报错，按报错中的提示修改环境变量即可。

参考
----

-  https://mirror.tuna.tsinghua.edu.cn/help/anaconda/
-  https://mirror.tuna.tsinghua.edu.cn/help/pypi/
