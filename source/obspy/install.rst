安装
====

我们强烈推荐使用 Anaconda 安装 ObsPy，这也是 ObsPy `官方推荐的安装方式 <https://github.com/obspy/obspy/wiki#installation>`__。

1.  :doc:`安装 Anaconda </anaconda/index>`

2.  创建、激活虚拟环境::

        # 创建虚拟环境，这里命名为 seismo-learn
        $ conda create -n seismo-learn
        # 激活此虚拟环境
        $ conda activate seismo-learn

3.  安装 ObsPy 预编译包::

        $ conda install obspy --channel conda-forge

4.  安装地图绘制包 cartopy::

        $ conda install cartopy

5.  检查安装是否成功::

    终端键入以下命令，若出现 obspy 版本号则表示安装成功::

        $ python -c "import obspy; print(obspy.__version__)"
        1.2.2
        
