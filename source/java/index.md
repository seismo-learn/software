---
"\u6700\u8FD1\u66F4\u65B0\u65F6\u95F4": '2021-01-26'
"\u672C\u8282\u8D21\u732E\u8005": "{{ \u7530\u51AC\u51AC }}\uFF08\u4F5C\u8005\uFF09\
  \u3001\n{{ \u59DA\u5BB6\u56ED }}\uFF08\u5BA1\u7A3F\uFF09"
---

# Java 运行环境

______________________________________________________________________

运行 Java 语言写的程序时，需要安装 Java 运行环境。

在终端键入 `java -version`，若显示版本信息，则表示 Java 运行环境已安装:

```
$ java -version
openjdk 14.0.2 2020-07-14
OpenJDK Runtime Environment (build 14.0.2+12-46)
OpenJDK 64-Bit Server VM (build 14.0.2+12-46, mixed mode, sharing)
```

否则，则需要安装 Java 运行环境。

```{eval-rst}
.. tab-set::

    .. tab-item:: CentOS

        ::

            $ sudo yum install epel-release
            $ sudo yum install java-11-openjdk

    .. tab-item:: Fedora

        ::

            $ sudo dnf install java-11-openjdk

    .. tab-item:: Ubuntu/Debian

        ::

            $ sudo apt update
            $ sudo apt install default-jdk

    .. tab-item:: macOS Homebrew

        ::

            $ brew install openjdk
            $ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```
