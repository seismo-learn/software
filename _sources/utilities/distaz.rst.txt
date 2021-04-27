distaz
======

:本节贡献者: `田冬冬 <https://me.seisman.info/>`__\ （作者）、
                    `姚家园 <https://github.com/core-man>`__\ （审稿）
:最近更新时间: 2021-01-12

.. include:: /snippets/install-notes.rst_

----

``distaz`` 是一个可以用于计算球面上任意两点间球面距离、方位角和反方位角的小工具。

相关代码
--------

``distaz`` 代码很短，简单易懂，其采用的地球模型为椭球模型，精度上可以满足需求。

-  C、Fortran、Java、Python 以及 CGI 版本： `由 USC 的一个小组整理 <http://www.seis.sc.edu/software/distaz/>`__
-  Matlab 版本： `由 specfem3d_globe 提供 <https://github.com/geodynamics/specfem3d_globe/blob/master/utils/Visualization/VTK_ParaView/matlab/distaz.m>`__

使用方法
--------

仅以 C 语言版本的 ``distaz`` 为例，用如下命令即可编译::

    $ cc distaz.c -o distaz -lm

并将生成的可执行文件移动到 :file:`~/bin/` 目录下::

    $ mkdir -p ~/bin/
    $ mv distaz ~/bin/

若 :file:`~/bin/` 路径尚未添加到环境变量 **PATH** 中，则执行如下命令::

     $ echo 'export PATH=${HOME}/bin:${PATH}' >> ~/.bashrc
     $ source ~/.bashrc

其输入为台站纬度、台站经度、事件纬度、事件经度::

    sta_lat sta_lon evt_lat evt_lon

输出为震中距（单位为°）、反方位角和方位角::

    Delta Baz Az

例如，台站位于（10°S，14°E），地震位于（40°N，50°W）::

   $ distaz -10 14 40 -50
   77.218 314.930 114.795

.. note::

   C 语言版的 ``distaz`` 默认输出小数点后 3 位。可以将源码 :file:`distaz.c` 中
   ``printf("%6.3f %6.3f %6.3f\n", delta, baz, az);`` 的 ``%6.3f`` 修改为
   更高精度的输出格式（例如 ``%8.5f``\ ）以达到所需的精度。
