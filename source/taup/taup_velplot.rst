taup velplot
============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-06-02

----

``taup velplot`` 可以很方便地生成用于绘制速度-深度剖面的 GMT 脚本。

使用 ``taup velplot --help`` 可查询该命令的完整用法和选项。此处仅介绍其常用用法。

生成 iasp91 参考模型的速度-深度剖面绘图脚本::

    $ taup velplot -mod iasp91

执行以上命令生成的脚本 :file:`iasp91_vel.gmt`\ ，生成 PDF 格式的速度-深度剖面::

    $ sh iasp91_vel.gmt

绘制出来的图件效果如下（蓝线为 P 波速度，红线为 S 波速度）：

.. image:: taup_velplot.jpg
   :width: 400 px
   :align: center
