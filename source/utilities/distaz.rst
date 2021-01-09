distaz
======

``distaz`` 是一个可以用于计算球面上任意两点间球面距离、方位角和反方位角的小工具。

名词解释
--------

-  震中距：\ **地面**\ 上任意一点到\ **震中**\ 的球面距离
-  方位角：震中到台站的连线与地理北向的夹角
-  反方位角：台站到震中的连线与地理北向的夹角

相关代码
--------

``distaz`` 代码很短，简单易懂，其采用的地球模型为椭球模型，精度上可以满足需求。

-  C、Fortran、Java、Python 以及 CGI 版本： `由 USC 的一个小组整理 <http://www.seis.sc.edu/software/distaz/>`__
-  Matlab 版本： `由 specfem3d_globe 提供 <https://github.com/geodynamics/specfem3d_globe/blob/master/utils/Visualization/VTK_ParaView/matlab/distaz.m>`__

使用方法
--------

仅以 C 语言版本的 ``distaz`` 为例，用如下命令即可编译::

   cc distaz.c -o distaz -lm

其输入为台站纬度、台站经度、事件纬度、事件经度::

    sta_lat sta_lon evt_lat evt_lon

输出为震中距、反方位角和方位角::

    Delta Baz Az

例如，台站位于（10°S，14°E），地震位于（40°N，50°W）::

   $ ./distaz -10 14 40 -50
   77.218 314.930 114.795
