distaz
======

``distaz`` 是一个可以用于计算球面上任意两点间球面距离、方位角和反方位角的小工具。

名词解释
--------

-  震中距：\ **地面**\ 上任意一点到\ **震中**\ 的球面距离；
-  方位角：震中到台站的连线与地理北向的夹角；
-  反方位角：台站到震中的连线与地理北向的夹角；

数学推导
--------

公式的推导需要简单的球面三角函数的知识。具体的推导可以参考 Robert B.
Herrmann 的
`作业题 <http://www.eas.slu.edu/People/RBHerrmann/Courses/EASA462>`__\ 。
作业题中的 Ass06、Ass07、Ass08 给出了计算震中距和方位角的原理。

相关代码
--------

广为流传的一个程序是 ``distaz``\ 。在 GMT、SAC、CPS
等的源码里都可以找到。\ ``distaz`` 代码很短，简单易懂，
其采用的地球模型为椭球模型，精度上可以满足需求。

-  C、Fortran、Java、Python 以及 CGI 版本： `由 USC的一个小组
   整理 <http://www.seis.sc.edu/software/distaz/>`__
-  Matlab 版本： `由 specfem3d_globe
   提供 <https://github.com/geodynamics/specfem3d_globe/blob/master/utils/Visualization/VTK_ParaView/matlab/distaz.m>`__

使用方法
--------

仅以 C 语言版本的 ``distaz`` 为例，用如下命令即可编译:

::

   cc distaz.c -o distaz -lm

其输入为 ``sta_lat sta_lon evt_lat evt_lon`` ，输出为 ``Delta Baz Az``
。

::

   $ ./distaz 10 14 40 50
   43.731 40.781 236.882
