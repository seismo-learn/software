简介
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-13

----

fk 可以用于计算\ **水平分层模型**\ 下的理论格林函数并合成理论地震图。

功能
----

1. 支持计算爆炸源、双力偶和单力源下的格林函数和理论地震图
2. 支持计算静态格林函数
3. 理论上可以计算至任意高频

命令及脚本
----------

fk 中提供了如下几个命令和脚本。通常只需要调用 ``fk.pl`` 生成格林函数，再
调用 ``syn`` 将格林函数合成为三分量理论地震图：

- ``fk``：用于计算格林函数的主程序，也是 fk 的核心程序
- ``st_fk``：用于计算静态格林函数的主程序
- ``fk.pl``：对 ``fk`` 和 ``st_fk`` 的封装，一般情况下直接使用该脚本即可
- ``syn``：用于将格林函数合成为三分量理论地震图的程序
- ``fk2mt``：将 fk 生成的格林函数转换为地震矩张量的每个分量所对应的格林函数
- ``trav``：用于计算 P、S 初至到时的辅助程序
- ``sachd``：用于修改 SAC 头段的辅助程序

参考文献
--------

若想要了解 fk 的基本原理，可以阅读如下文章：

- Haskell, N. A. (1964).
  Radiation pattern of surface waves from point sources in a multi-layered medium.
  *Bulletin of the Seismological Society of America*, 54(1), 377–393.
- Takeuchi, H., & Saito, M. (1972).
  Seismic surface waves.
  *Methods in computational physics*, 11, 217-295.
- Wang, C. Y., & Herrmann, R. B. (1980).
  A numerical study of P-, SV-, and SH-wave generation in a plane layered medium.
  *Bulletin of the Seismological Society of America*, 70(4), 1015–1036.
- Zhu, L., & Rivera, L. A. (2002).
  A note on the dynamic and static displacements from a point source in multilayered media.
  *Geophysical Journal International*, 148(3), 619–627.
  https://doi.org/10.1046/j.1365-246X.2002.01610.x

阅读的相关建议：

1. 若想了解如何使用 fk，直接阅读本教程即可
2. 若想了解 fk 中每个选项的物理含义，需阅读 Zhu and Rivera (2002)
3. 若想理解代码的实现细节，则需要在 Zhu and Rivera (2002) 的基础上，阅读其余三篇文章，
   至少要阅读 Haskell (1964)
4. 需要注意，尽管这几篇文献介绍的是同一种方法，但很多符号的定义是有区别的。
   在推导代码中的公式时应以 Zhu and Rivera (2002) 为准。
   Zhu and Rivera (2002) 区别于前面其他文献的地方主要在于，其重新定义了传播矩阵，
   并将静态解与动态解统一到同一个公式中

引用
----

- Zhu, L., & Rivera, L. A. (2002).
  A note on the dynamic and static displacements from a point source in multilayered media.
  *Geophysical Journal International*, 148(3), 619–627.
  https://doi.org/10.1046/j.1365-246X.2002.01610.x
