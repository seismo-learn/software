安装
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-03-14

----

.. include:: /snippets/install-notes.rst_

1.  下载::

        $ wget http://www.eas.slu.edu/People/LZhu/downloads/fk3.3.tar

2.  解压::

        $ tar -xvf fk3.3.tar

    将解压得到的 :file:`fk` 文件夹移至 :file:`~/src/` 目录下::

        $ mkdir -p ~/src/
        $ mv fk ~/src/

3.  修改 fk 源码

    fk3.3（下载于 2021-01-13，软件包中文件的最新日期为 2019-06-18）的原始代码
    存在一些问题，因而需要做一些小修改方可使用。主要修改如下：

    -   :file:`Makefile` 中需要添加 ``FC=gfortran`` 指定使用 gfortran 编译器
    -   :file:`Makefile` 中需要给 ``FFLAGS`` 加上 ``-ffixed-line-length-none``
        使得 Fortran 一行可以超过 72 字符
    -   :file:`Makefile` 中 ``FFLAGS`` 里的 ``-ffpe-trap=overflow,invalid,denormal``
        参数需要删除
    -   :file:`Makefile` 中第 6—7 行被注释了，所以 ``fk`` 无法使用 SAC 提供的
        滤波功能。若 SAC 已安装，则可以将第 6—7 行的行首注释符号 ``#`` 去掉。同时给
        ``SACLIB`` 加上 ``-no-pie`` 参数（若操作系统无法使用该参数，手动删除即可）。
    -   :file:`Makefile` 中未指定如何编译生成 ``fk2mt`` 文件。需要将 ``fk2mt``
        加到变量 ``TARGETS`` 中，并向 :file:`Makefile` 尾部加入如下语句：

        .. code-block:: makefile

            fk2mt: fk2mt.o sacio.o radiats.o
                $(LINK.f) -o $@ $^ -lm

    -   :file:`syn.c` 第 142 行需改写为 ``mt[0][1]=mt[0][2]=mt[1][2] = 0.;``
    -   :file:`sac.h` 中 319 行 ``sac_head_inex`` 应改为 ``sac_head_index``

    .. note::

        为了便于用户使用，我们对 fk 源码做了以上修改，并提供了 patch 文件，供用户使用。
        下载 patch 文件 :download:`fk3.3-v20190618.patch`，将其放在 fk 源码目录下，
        然后执行如下命令即可修改源码::

            $ cd ~/src/fk/
            $ patch < fk3.3-v20190618.patch

    .. note::

        我们已经将以上 BUG 报告给原作者，在新版本中这些问题可能会得到修复。

4.  进入源码目录并编译::

        $ cd ~/src/fk/
        $ make
        $ make clean

5.  修改环境变量，将 fk 路径添加到 **PATH** 中::

        $ echo 'export PATH=${HOME}/src/fk/:${PATH}'>> ~/.bashrc
        $ source ~/.bashrc

6.  检查安装是否成功

    终端键入 ``fk.pl`` 若出现 帮助信息则表示安装成功。
