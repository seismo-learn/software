安装
====

1. 确认 Java 运行环境已安装

在终端中键入 ``java -version``，若显示版本信息，则表示 Java 运行环境已安装::

    $ java -version
    openjdk version "1.8.0_161"
    OpenJDK Runtime Environment (build 1.8.0_161-b14)
    OpenJDK 64-Bit Server VM (build 25.161-b14, mixed mode)

否则需要先安装 Java 运行环境::

    # CentOS/RHEL
    $ sudo yum install java
    
    # Fedora
    $ sudo dnf install java-latest-openjdk

    # Ubuntu/Debian
    $ sudo apt update
    $ sudo apt install default-jdk

    # macOS homebrew 用户
    $ brew install openjdk

TauP 最新版本为 2.4.5，该版本要求 Java 版本大于 1.8。若你的机器的 Java 版本小于 1.8，
可以考虑下载使用旧版本的 TauP。但要注意，旧版本 TauP 可能存在已知的 BUG。

2. 下载::

    $ wget http://www.seis.sc.edu/downloads/TauP/TauP-2.4.5.tgz

3. 解压::

    $ tar -xvf TauP-2.4.5.tgz

4. 安装::

    $ sudo mv TauP-2.4.5 /opt/

5. 修改环境变量，将 TauP 的 bin 路径添加到 PATH 中::

    $ echo 'export PATH=/opt/TauP-2.4.5/bin:${PATH}' >> ~/.bashrc
    $ source ~/.bashrc

6. 检查安装是否成功

    终端键入 ``taup`` 若出现 TauP 图形界面则表示安装成功。
