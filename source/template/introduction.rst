简介
====

本文档是 **地震“学”软件** 的教程模板。

基本规则
--------

1. 为每个软件创建单独的文件夹
2. 每个软件的教程应包括如下内容:

   - 索引文件 (``index.rst``): 列举软件和教程的元信息
   - 简介 (``introduction.rst``): 主要用途、功能、特色、缺点、相关文献及引用方式
   - 安装 (``install.rst``): 安装说明
   - 其它可选教程

     - 使用说明
     - 实战练习

3. 关于文件名的规则：

   - 文件名一律采用小写字母
   - 若文件名中含多个单词，应使用连字符 (hyphen) ``-`` 连接
   - 文件名应尽量使用单词全称，避免使用各种形式的简写

使用说明
--------

若想要为一个软件写教程，可直接复制本模板文件夹的全部内容，重命名，并更新软件的基本信息。

引用
----

有引用文献的软件应列出其引用文献。
建议访问 https://zbib.org 网站，通过标题、DOI 或网址搜索相关文献，
然后选择 **American Geophysical Union** 风格，导出到剪贴板。
例如：

- Crotwell, H. P., Owens, T. J., & Ritsema, J. (1999).
  The TauP Toolkit: Flexible Seismic Travel-time and Ray-path Utilities.
  *Seismological Research Letters*, 70(2), 154–160.
  https://doi.org/10.1785/gssrl.70.2.154
