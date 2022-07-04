安装
====

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（作者）
:最近更新日期: 2022-07-04

----

我们强烈推荐使用 Anaconda 安装 ObsPy，这也是 ObsPy `官方推荐的安装方式 <https://github.com/obspy/obspy/wiki#installation>`__\ 。

1.  :doc:`安装并配置 Anaconda </anaconda/index>`

2.  安装 ObsPy 及其依赖::

        $ conda install obspy cartopy --channel conda-forge

3.  检查安装是否成功

    终端键入以下命令，若出现 obspy 版本号则表示安装成功::

        $ python -c "import obspy; print(obspy.__version__)"
        1.3.0

