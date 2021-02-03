简介
====

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-01-02

----

ObsPy 是地震学数据处理的 Python 软件包，极大促进了地震学应用程序的快速开发。
其可以用来读写多种地震学数据格式，下载地震目录、台站元数据和波形数据，以及处理和分析波形数据等，
满足了日常科研中与地震学数据相关的大部分需求。

特色功能
--------

我们在日常的地震学科研工作中，需要下载、处理和分析波形数据，然后提取出有效的观测物理量（如震相到时、振幅），
用来反演震源和地下结构。下载、处理和分析波形数据的一般步骤如下：

1. 下载地震目录
2. 下载台站元数据，如台站位置和仪器响应
3. 下载波形数据
4. 波形数据格式转换
5. 匹配地震和台站元数据
6. 波形数据处理
7. 波形数据分析

其他地震学软件（如 SOD、SAC）往往只具有以上一个或几个功能，ObsPy 的特色在于：

1. 可以完成以上所有步骤
2. 可以使用丰富的 Python 软件包，如 `NumPy <https://numpy.org/>`__\ 、
   `SciPy <https://www.scipy.org/>`__\ 、
   `Matplotlib <https://matplotlib.org/>`__\、
   `pandas <https://pandas.pydata.org/>`__ 等
3. 支持目前绝大多数地震学数据格式的读写
4. 生态良好，已有许多基于 ObsPy 开发的软件包

引用
----

如果使用 ObsPy（直接使用或作为其他程序包的依赖包）开展研究工作并发表了学术文章，可以引用以下参考文献的任意一篇：

- Beyreuther, M., Barsch, R., Krischer, L., Megies, T., Behr, Y., & Wassermann, J. (2010).
  ObsPy: A Python Toolbox for Seismology.
  *Seismological Research Letters*, 81(3), 530–533.
  https://doi.org/10.1785/gssrl.81.3.530

- Megies, T., Beyreuther, M., Barsch, R., Krischer, L., & Wassermann, J. (2011).
  ObsPy – What can it do for data centers and observatories?
  *Annals Of Geophysics*, 54(1), 47-58
  https://doi.org/10.4401/ag-4838

- Krischer, L., Megies, T., Barsch, R., Beyreuther, M., Lecocq, T., Caudron, C., & Wassermann, J. (2015).
  ObsPy: a bridge for seismology into the scientific Python ecosystem.
  *Computational Science & Discovery*, 8(1), 014003.
  https://doi.org/10.1088/1749-4699/8/1/014003

此外，也可引用实际使用的 ObsPy 版本，
如 ObsPy 1.2.2（`10.5281/zenodo.3921997 <http://dx.doi.org/10.5281/zenodo.3921997>`__）。
其他版本可查看\ `已发布的 ObsPy 版本 <https://zenodo.org/search?ln=en&p=obspy&sort=mostrecent>`__\ 。
