简介
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-13

----

gCAP3D 可用于反演震源机制解。

功能
----

1. 支持反演完整的地震矩张量
2. 支持使用三维模型下的格林函数

命令及脚本
----------

gCAP3D 中提供了如下几个命令和脚本：

- ``cap3D``\ ：用于反演地震矩张量的主程序，也是 gCAP3D 的核心程序
- ``cap3D.pl``\ ：对 ``cap3D`` 的封装，一般情况下直接使用该脚本即可
- ``depth.pl``\ ：用于读取 ``cap3D`` 输出的不同深度震源的结果，并估计最佳震源深度
- ``mtdcmp``\ ：将地震矩张量分解为 ISO、DC 以及 CLVD 三个部分
- ``radpttn``\ ：将 ISO、DC 以及 CLVD 三个部分合成为归一化的地震矩张量，
  并计算 P、SV 以及 SH 波的辐射花样

引用
-----

- Zhao, L. S., & Helmberger, D. V. (1994).
  Source estimation from broadband regional seismograms.
  *Bulletin of the Seismological Society of America*, 84(1), 91-104.
- Zhu, L., & Helmberger, D. V. (1996).
  Advancement in source estimation techniques using broadband regional seismograms.
  *Bulletin of the Seismological Society of America*, 86(5), 1634-1641.
- Zhu, L., & Ben-Zion, Y. (2013).
  Parametrization of general seismic potency and moment tensors for source inversion of seismic waveform data.
  *Geophysical Journal International*, 194(2), 839-843.
  https://doi.org/10.1093/gji/ggt137
- Zhu, L., & Zhou, X. (2016).
  Seismic moment tensor inversion using 3D velocity model and its application to the 2013 Lushan earthquake sequence.
  *Physics and Chemistry of the Earth, Parts A/B/C*, 95, 10-18.
  https://doi.org/10.1016/j.pce.2016.01.002
