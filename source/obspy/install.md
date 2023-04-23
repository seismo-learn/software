---
"\u6700\u8FD1\u66F4\u65B0\u65E5\u671F": '2022-07-04'
"\u672C\u8282\u8D21\u732E\u8005": "{{ \u59DA\u5BB6\u56ED }}\uFF08\u4F5C\u8005\uFF09\
  \u3001\n{{ \u7530\u51AC\u51AC }}\uFF08\u4F5C\u8005\uFF09"
---

# 安装

______________________________________________________________________

我们强烈推荐使用 Anaconda 安装 ObsPy，这也是 ObsPy [官方推荐的安装方式](https://github.com/obspy/obspy/wiki#installation)。

1. {doc}`安装并配置 Anaconda </anaconda/index>`

2. 安装 ObsPy 及其依赖:

   ```
   $ conda install obspy cartopy --channel conda-forge
   ```

3. 检查安装是否成功

   终端键入以下命令，若出现 obspy 版本号则表示安装成功:

   ```
   $ python -c "import obspy; print(obspy.__version__)"
   1.3.0
   ```
