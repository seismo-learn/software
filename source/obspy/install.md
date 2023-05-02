# 安装

- 最近更新日期: 2022-07-04
- 本节贡献者: {{ 姚家园 }}（作者）、{{ 田冬冬 }}（作者）

---

1. {doc}`安装并配置 Anaconda/Miniconda </anaconda/index>`

2. 安装 ObsPy 及其依赖:

   ```
   $ conda install obspy cartopy --channel conda-forge
   ```

3. 检查安装是否成功

   终端键入以下命令，若出现 obspy 版本号则表示安装成功:

   ```
   $ python -c "import obspy; print(obspy.__version__)"
   1.4.0
   ```
