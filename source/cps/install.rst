安装
====

1.  下载:

    CPS 源码需要先填写申请表格才可以下载。
    在 http://www.eas.slu.edu/eqc/eqc_cps/CPS/cpslisc.html 填写表格并提交。

    .. CPS 的源码也可以直接 http://www.eas.slu.edu/eqc/eqc_cps/
    .. 的 download 目录下载

2.  解压::

        $ tar -xvf NP330.Oct-29-2020.tgz

    将解压得到的 :file:`PROGRAMS.330` 文件夹移至 :file:`~/src/` 目录下，并重命名为 :file:`CPS` ::

        $ mkdir -p ~/src/
        $ mv PROGRAMS.330 ~/src/CPS


3.  配置:

    若使用的是 Linux 系统，首先需要确认当前系统是 32 还是 64 位。
    终端键入 ``uname -a``\ ，若输出中包含 ``x86_64`` 则是 64 位，若输出包含类似
    ``i686`` 则是 32 位。

    进入源码目录::

        $ cd ~/src/CPS

    若是 64 位 Linux 系统，则::

        $ ./Setup LINUX6440

    若是 32 位 Linux 系统，则::

        $ ./Setup LINUX40

    若是 macOS 系统，则::

        $ ./Setup OSX40

    .. note::

       终端键入 ``./Setup`` 可查询全部选项。

4.  编译::

        $ ./C

    接下来会编译一段时间，最终在 bin 目录下应该生成 153 个可执行文件。当然，
    不同版本生成的可执行文件的数目可能有差异。

5.  修改环境变量，将 CPS 的 bin 路径添加到 PATH 中::

        $ echo 'export PATH=${HOME}/src/CPS/bin:${PATH}' >> ~/.bashrc
        $ source ~/.bashrc

6.  检查安装是否成功

    终端键入一些 CPS 的命令，比如 ``sdisp96 -h``，若出现该命令的使用选项则表示安装成功。
