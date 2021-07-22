安装
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-07-22

----

.. include:: /snippets/install-notes.rst_

1.  下载::

        $ wget http://www.eas.slu.edu/People/LZhu/downloads/gCAP3D1.2.tar

2.  解压::

        $ tar -xvf gCAP3D1.2.tar

    将解压得到的 :file:`gCAP3D` 文件夹移至 :file:`~/src/` 目录下::

        $ mkdir -p ~/src/
        $ mv gCAP3D ~/src/


    .. note::

        gCAP3D 软件包在发布的时候，遗留了一些无用的临时文件，执行如下命令即可清除::

            $ cd ~/src/gCAP3D/
            $ rm .gmtcommands4 20080418093700/.gmtcommands4

3.  修改编译文件

    gCAP3D1.2（下载于 2021-07-22，软件包中文件的最新日期为 2019-09-17）的 :file:`Makefile`
    存在一些问题，因而需要做一些小修改方可使用。主要修改如下：

    -   添加 ``FC=gfortran`` 指定使用 gfortran 编译器
    -   给 ``FFLAGS`` 加上 ``-ffixed-line-length-none`` 使得 Fortran 一行可以超过 72 字符
    -   添加 ``CC = gcc`` 指定使用 gcc 编译器
    -   添加 ``SACHOME = /opt/sac`` 指定 SAC 软件的安装路径，用户需根据自身实际
        情况设置变量 ``SACHOME`` 的值

    -   变量 ``SUBS`` 未指定 Numerical Recipes 相关的一些目标文件名，需在变量 ``SUBS`` 的赋值语句最后加上：

        .. code-block:: makefile

            SUBS = fft.o Complex.o radiats.o grid3d.o futterman.o sacio.o trap.o \
                   nrutil.o jacobi.o eigsrt.o

    -   ``cap3D`` 规则中 ``-lsac -lsacio`` 后加上 ``-lm``
    -   ``cap3D`` 规则中增加 ``cap_dir`` 规则，并将 ``cap_dir`` 加到变量 ``CAP`` 中，
        在 ``cap3D`` 规则后增加 ``cap_dir.o`` 规则：

        .. code-block:: makefile

            cap_dir.o: cap3D.c
                $(COMPILE.c) -DDIRECTIVITY -o $@ $<

    -   ``clean`` 规则修改为 ``clean`` 和 ``distclean`` 规则，这样可以只删除目标文件，
        同时保留编译好的二进制命令文件：

        .. code-block:: makefile

            clean:
                rm -f *.o

            distclean:
                rm -f $(CAP)

    .. note::

        为了便于用户使用，我们对相关文件做了以上修改，并提供了 patch 文件，供用户使用。
        下载 patch 文件 :download:`gCAP3D1.2-v20210722.patch`，
        将其放在 gCAP3D  源码目录下，然后执行如下命令即可修改源码::

            $ cd ~/src/gCAP3D/
            $ patch < gCAP3D1.2-v20210722.patch

    .. note::

        我们已经将以上 BUG 报告给原作者，在新版本中这些问题可能会得到修复。

4.  进入源码目录并编译::

        $ cd ~/src/gCAP3D/
        $ make
        $ make clean

5.  修改环境变量，将 gCAP3D 路径添加到 **PATH** 中::

        $ echo 'export PATH=${HOME}/src/gCAP3D/:${PATH}'>> ~/.bashrc
        $ source ~/.bashrc

6.  检查安装是否成功

    .. note::

        运行脚本 :file:`cap3D.pl` 中包含了两个绝对路径，需要根据自身实际情况进行修改后
        才能成功运行：

        -   第 17 行 ``require "$home/Src/cap/cap_plt.pl";`` 中 :file:`cap_plt.pl`
            的绝对路径需修改为：

            .. code-block:: perl

               require "${HOME}/src/gCAP3D/cap_plt.pl";

        -   第 21 行 ``$green = "$home/data/models/Glib";`` 中的变量 ``$green``
            是计算的格林函数库的绝对路径。如果不知道如何修改的话，就直接用默认值，
            并使用如下命令新建这个目录::

                $ mkdir -p ~/data/models/Glib

    终端键入 ``cap3D.pl`` 若出现帮助信息则表示安装成功。

.. note::

    :file:`cap_plt.pl` 脚本的主要修改是在第 6 行之后加上如下语句::

        system "gmtset MEASURE_UNIT inch";
        system "gmtset PAGE_ORIENTATION portrait";

    - 第一句设置默认单位为英寸（inch）。Lupei Zhu 的 GMT 版本默认使用了 US 单位制，
      脚本中所有未显式指定单位的值使用的都是 inch。但是，其他人通常使用的都 是 SI 单位制，
      会将这些未显式指定单位的值使用默认单位厘米（cm）
    - 第二句设置设置纸张方向为 Portrait 模式
