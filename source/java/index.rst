Java 运行环境
=============

:教程作者: `田冬冬 <https://me.seisman.info/>`__ (作者)、`姚家园 <https://github.com/core-man>`__ (审稿)
:最近更新时间: 2020-12-31

运行 Java 语言写的程序时，需要安装 Java 运行环境。

在终端键入 ``java -version``，若显示版本信息，则表示 Java 运行环境已安装::

    $ java -version
    openjdk 14.0.2 2020-07-14
    OpenJDK Runtime Environment (build 14.0.2+12-46)
    OpenJDK 64-Bit Server VM (build 14.0.2+12-46, mixed mode, sharing)

否则，则需要安装 Java 运行环境。

CentOS 用户::

    $ sudo yum install epel-release
    $ sudo yum install java-latest-openjdk

Fedora 用户::

    $ sudo dnf install java-latest-openjdk

Ubuntu/Debian 用户::

    $ sudo apt update
    $ sudo apt install default-jdk

macOS Homebrew 用户::

    $ brew install openjdk
