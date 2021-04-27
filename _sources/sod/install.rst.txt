安装
====

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2020-12-30

----

.. include:: /snippets/install-notes.rst_

1.  :doc:`安装 Java 运行环境 </java/index>`

2.  下载::

        $ wget http://www.seis.sc.edu/downloads/sod/3.2.10/sod-3.2.10.tgz

3.  解压::

        $ tar -xvf sod-3.2.10.tgz

4.  将 SOD 安装到 :file:`~/opt/` 目录下::

        $ mkdir -p ~/opt/
        $ mv sod-3.2.10 ~/opt/

5.  修改环境变量，将 SOD 的 bin 路径添加到 PATH 中::

        $ echo 'export PATH=${HOME}/opt/sod-3.2.10/bin:${PATH}' >> ~/.bashrc
        $ source ~/.bashrc

6.  检查安装是否成功

    终端键入 ``sod -v`` 若出现 SOD 版本号则表示安装成功::

        $ sod -v
        SOD 3.2.10
