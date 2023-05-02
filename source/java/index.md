# Java 运行环境

- 最近更新时间: 2021-01-26
- 本节贡献者: {{ 田冬冬 }}（作者）、{{ 姚家园 }}（审稿）

---

运行 Java 语言写的程序时，需要安装 Java 运行环境。

在终端键入 `java -version`，若显示版本信息，则表示 Java 运行环境已安装:

```
$ java -version
openjdk 14.0.2 2020-07-14
OpenJDK Runtime Environment (build 14.0.2+12-46)
OpenJDK 64-Bit Server VM (build 14.0.2+12-46, mixed mode, sharing)
```

否则，则需要安装 Java 运行环境。

::::{tab-set}

:::{tab-item} Fedora
```
$ sudo yum install java-17-openjdk
```
:::

:::{tab-item} Ubuntu/Debian
```
$ sudo apt install default-jdk
```
:::

:::{tab-item} macOS
```
$ brew install openjdk
$ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```
:::
::::