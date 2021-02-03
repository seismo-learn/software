安装
====

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-01-02

----

我们强烈推荐使用 Anaconda 安装 ObsPy，这也是 ObsPy `官方推荐的安装方式 <https://github.com/obspy/obspy/wiki#installation>`__\ 。

1.  :doc:`安装 Anaconda </anaconda/index>`

2.  添加第三方 channel::

        $ conda config --prepend channels conda-forge

3.  创建、激活虚拟环境::

        # 创建虚拟环境，这里命名为 seismo-learn
        $ conda create --name seismo-learn
        # 激活此虚拟环境
        $ conda activate seismo-learn

4.  安装 ObsPy 预编译包::

        $ conda install obspy

5.  安装地图绘制包 cartopy::

        $ conda install cartopy

6.  检查安装是否成功

    终端键入以下命令，若出现 obspy 版本号则表示安装成功::

        $ python -c "import obspy; print(obspy.__version__)"
        1.2.2

