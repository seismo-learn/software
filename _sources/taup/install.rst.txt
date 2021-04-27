安装
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-04

----

.. include:: /snippets/install-notes.rst_

1.  :doc:`安装 Java 运行环境 </java/index>`

2.  下载::

        $ wget http://www.seis.sc.edu/downloads/TauP/TauP-2.4.5.tgz

3.  解压::

        $ tar -xvf TauP-2.4.5.tgz

4.  将 TauP 安装到 :file:`~/opt` 目录下::

        $ mkdir -p ~/opt/
        $ mv TauP-2.4.5 ~/opt/

5.  修改环境变量，将 TauP 的 bin 路径添加到 PATH 中::

        $ echo 'export PATH=${HOME}/opt/TauP-2.4.5/bin:${PATH}' >> ~/.bashrc
        $ source ~/.bashrc

6.  检查安装是否成功

    终端键入 ``taup`` 若出现 TauP 图形界面则表示安装成功。
