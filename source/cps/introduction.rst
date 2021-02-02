简介
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-26

----

CPS，全称 Computer Programs in Seismology，
着重于理解和解释地震波在地球地壳和上地幔中的传播。
其可以计算\ **水平分层模型**\ 下的理论地震图、反演面波频散和远震 P 波接收函数、
反演震源深度、震源机制和地震矩、处理地震波形数据以及绘图。
整个程序包很好地集成在一起，所有程序都使用相同的地球速度模型格式、波形格式和图形格式。

软件包中包含了完整的\ `说明文档 <http://www.eas.slu.edu/eqc/eqc_cps/CPS/CPS330.html>`__，
官方主页上还给了不少\ `教程 <http://www.eas.slu.edu/eqc/eqc_cps/TUTORIAL/>`__，
不仅仅教授如何使用软件，同时也介绍了很多地震学的基础知识。
即使不使用该软件，文档和教程中的一些内容也是有参考价值的。

此外，官方主页上还有一些\ `讲义 <http://www.eas.slu.edu/eqc/eqc_cps/workshop.html>`__\
和\ `用户问题和开发者解答 <http://www.eas.slu.edu/eqc/eqc_cps/Questions>`__\值得一看。

特色功能
--------

1.  合成地震图

    - 广义射线法
    - 波数积分法
    - 模态叠加法
    - 渐进射线理论

2.  地球结构反演

    - 面波频散反演
    - 远震 P 波接收函数反演
    - 面波频散和接收函数联合反演

3.  震源反演

    - 面波辐射花样反演震源机制
    - 波形反演震源深度、震源机制、矩张量

4.  GSAC

    GSAC，全称 Generic Seismic Application Coding，
    可以认为是 SAC 的重新实现，作者给了一些需要重写 SAC 的理由。

5.  CALPLOT

    为了实现代码的易移植性，CPS 自带了 CALPLOT 绘图包。

引用
----

- Herrmann, R. B. (2013).
  Computer Programs in Seismology: An Evolving Tool for Instruction and Research.
  *Seismological Research Letters*, 84(6), 1081–1088.
  https://doi.org/10.1785/0220110096
