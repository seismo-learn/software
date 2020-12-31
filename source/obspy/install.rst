安装
====

我们强烈推荐使用 Anaconda 来安装 ObsPy，这也是 ObsPy 的 `官方推荐 <https://github.com/obspy/obspy/wiki#installation>`__。

1.  安装 Anaconda

2.  添加 conda-forge 源::

        $ conda config --add channels conda-forge

3.  新建并激活 Anaconda 环境::

        # 这里以 seismo-learn 为例
        $ conda create -n seismo-learn
        $ conda activate seismo-learn

4.  安装预编译 ObsPy 包::

        $ conda install obspy

5.  安装绘制地图软件包::

        $ conda install cartopy

6.  检查安装是否成功::

        $ python
        Python 3.8.6 | packaged by conda-forge | (default, Oct  7 2020, 19:08:05) 
        [GCC 7.5.0] on linux
        Type "help", "copyright", "credits" or "license" for more information.
        >>> import obspy
        >>>
