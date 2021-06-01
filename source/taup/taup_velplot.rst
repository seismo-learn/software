taup velplot
============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-06-01

----

``taup velplot`` 可以很方便地生成一个可用于绘制速度模型的 GMT 脚本。

使用 ``taup velplot --help`` 可查询该命令的完整用法和选项。此处仅介绍其常用用法。

绘制 IASP91 参考模型的速度模型::

    $ taup velplot -mod iasp91

执行该命令会生成脚本 :file:`iasp91_vel.gmt`\ 。执行该脚本即可生成 PDF 格式的速度模型图片::

    $ sh iasp91_vel.gmt

绘制出来的图件效果如下：

.. image:: taup_velplot.jpg
   :width: 400 px
   :align: center
