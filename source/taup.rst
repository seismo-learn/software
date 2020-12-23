TauP
====

TauP 是一款常用于计算地震波走时和路径的 Java 程序。


简介
----

基本信息
+++++++++

- 主页： https://www.seis.sc.edu/taup/
- 源码： https://github.com/crotwell/TauP
- 语言： Java
- 平台： 跨平台，Windows、Linux、Mac 等
- 原理： 与 ttimes 一样，基于 `Buland & Chapman (1983) <https://pubs.geoscienceworld.org/ssa/bssa/article-abstract/73/5/1271/118430/The-computation-of-seismic-travel-times?redirectedFrom=fulltext>`_ 提出的方法

功能与特色
++++++++++

相对于 ttimes 而言，TauP 具有更多的功能和特色：

1. 可以计算震相走时、射线参数、反射点、穿透点、射线路径、走时曲线等
2. 支持自定义速度模型
3. 内置震相解析器，支持不常见的震相名
4. 自带多个预定义地球模型：``iasp91``、``prem``、``ak135``、``jb``、``1066a``、``1066b``、``pwdk``、``sp6``、``herrin``
5. 部分兼容 ttimes，比如用 ttp 表示常见 P 波震相，除此之外，还有 tts、ttp+、tts+、ttbasic、ttall
6. 采用线性插值，可能带来 0.01 秒的误差
7. 直接在球坐标系下求解方程，不必做展平变换；与部分震相的解析解相比，最大误差为 0.01 秒，而 ttimes 的最大误差为 0.05 秒

目前来看，有一些缺点：

1. 不支持 PKPab、PKPbc 等震相名
2. 输出的格式不够灵活，有时需要自己写脚本从输出中提取信息

工具
++++

TauP 提供了多个工具:

- 图形界面： ``taup``
- 交互式： ``taup_console``
- 命令行工具： ``taup_time`` 、 ``taup_pierce`` 、 ``taup_setsac`` 、 ``taup_path`` 、 ``taup_curve`` 、 ``taup_create`` 、 ``taup_table`` 、 ``taup_wavefront`` 



安装
----

1. 确认 Java 运行环境已安装

在终端中键入 ``java -version``，若显示版本信息，则表示 Java 运行环境已安装::

    $ java -version
    openjdk version "1.8.0_161"
    OpenJDK Runtime Environment (build 1.8.0_161-b14)
    OpenJDK 64-Bit Server VM (build 25.161-b14, mixed mode)

否则需要先安装 Java 运行环境::

    # 在 CentOS 7 上
    $ sudo yum install java

    # 在 Ubuntu 上
    $ sudo apt update
    $ sudo apt install default-jre default-jdk

    # 在 macOS 上
    $ brew install openjdk

TauP 最新版本为 2.4.5，该版本要求 Java 版本大于 1.8。若你的机器的 Java 版本小于 1.8，
可以考虑下载使用旧版本的 TauP。但要注意，旧版本 TauP 可能存在已知的 BUG。

2. 下载 TauP::

    $ wget http://www.seis.sc.edu/downloads/TauP/TauP-2.4.5.tgz

3. 解压::

    $ tar -xvf TauP-2.4.5.tgz

4. 安装::

    $ sudo mv TauP-2.4.5 /opt

5. 修改环境变量::

    $ echo 'export PATH=/opt/TauP-2.4.5/bin:${PATH}' >> ~/.bashrc
    $ source ~/.bashrc

6. 执行测试

终端键入 ``taup`` 若出现 TauP 图形界面则表示安装成功。


用法
----

用 taup_time 计算震相走时及射线信息
+++++++++++++++++++++++++++++++++++

``TODO``

用 taup_pierce 计算射线的界面的穿透点
+++++++++++++++++++++++++++++++++++++

``TODO``

用 taup_setsac 将走时信息写入 SAC 文件
++++++++++++++++++++++++++++++++++++++

``TODO``

TauP 自定义速度模型
++++++++++++++++++++

``TODO``

识别 TauP 输出中的多个 P 震相
+++++++++++++++++++++++++++++

``TODO``

计算任意深度处下表面反射波走时
++++++++++++++++++++++++++++++

``TODO``
