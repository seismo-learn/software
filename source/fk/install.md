# 安装

- 本节贡献者: {{ 田冬冬 }}（作者）、{{ 姚家园 }}（审稿）
- 最近更新日期: 2023-05-01

---

{{ install_notes }}

1. 下载:

   ```
   $ wget http://www.eas.slu.edu/People/LZhu/downloads/fk3.4.tar
   ```

2. 解压:

   ```
   $ tar -xvf fk3.4.tar
   ```

   将解压得到的 {file}`fk` 文件夹移至 {file}`~/src/` 目录下:

   ```
   $ mkdir -p ~/src/
   $ mv fk ~/src/
   ```

3. 修改 fk 源码

   fk3.4（下载于 2023-05-01，软件包中文件的最新日期为 2022-07-30）的 {file}`Makefile` 文件
   存在，因而需要做一些小修改方可使用。主要修改如下：

   - 需要添加 `FC=gfortran` 指定使用 gfortran 编译器
   - 需要给变量 `FFLAGS` 加上 `-ffixed-line-length-none` 使得 Fortran 一行可以超过 72 字符
   - 第 6—7 行被注释了，所以 `fk` 无法使用 SAC 提供的滤波功能。
     若已安装 SAC ，则可以将第 6—7 行的行首注释符号 `#` 去掉，并给变量 `SACLIB`
     加上 `-no-pie` 参数（若操作系统无法使用该参数，手动删除即可）

   :::{note}
   为了便于用户使用，我们对 fk 源码做了以上修改，并提供了 patch 文件，供用户使用。
   下载 patch 文件 {download}`fk3.4-v20220730.patch`，将其放在 fk 源码目录下，
   然后执行如下命令即可修改源码:

   ```
   $ cd ~/src/fk/
   $ patch < fk3.4-v20220730.patch
   ```
   :::

4. 进入源码目录并编译:

   ```
   $ cd ~/src/fk/
   $ make
   $ make clean
   ```

5. 修改环境变量，将 fk 路径添加到 **PATH** 中:

   ```
   $ echo 'export PATH=${HOME}/src/fk/:${PATH}'>> ~/.bashrc
   $ source ~/.bashrc
   ```

6. 检查安装是否成功

   终端键入 `fk.pl` 若出现 帮助信息则表示安装成功。
