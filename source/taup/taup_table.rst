taup table
==========

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-06-04

----

``taup table`` 用于计算一系列深度和震中距的震相走时表。

使用 ``taup table --help`` 可查询该命令的完整用法和选项。此处仅介绍常用用法。

计算 PKiKP 震相的走时表（默认使用 iasp91 模型）::

    $ taup table -ph PKiKP -o PKiKP_table.dat

该命令会将不同深度和震中距的 PKiKP 走时表输出到文件 :file:`PKiKP_table.dat` 中。
以下展示该文件的部分内容::

    ... (省略很多行)
    iasp91    30.00     15.0 PKiKP   1001.95     0.658      30.00  PKiKP
    iasp91    31.00     15.0 PKiKP   1002.62     0.679      31.00  PKiKP
    iasp91    32.00     15.0 PKiKP   1003.31     0.700      32.00  PKiKP
    ... (省略很多行)

其输出有 8 列，从左到右的含义分别是：

1. 速度模型名称
2. 震中距（度）
3. 震源深度（km）
4. 震相名
5. 震相走时（秒）
6. 震相慢度（秒/度）
7. Purist 距离：地震波实际走过的圆弧距离。见 :doc:`taup_time` 中的相关说明
8. Purist 震相名：地震波的“真实”震相名。见 :doc:`taup_time` 中的相关说明

可以与 ``taup time`` 命令的输出做对比，进一步验证输出中每列的含义::

    $ taup time --ph PKiKP -mod iasp91 -deg 30 -h 15

    Model: iasp91
    Distance   Depth   Phase   Travel    Ray Param  Takeoff  Incident  Purist    Purist
      (deg)     (km)   Name    Time (s)  p (s/deg)   (deg)    (deg)   Distance   Name
    -----------------------------------------------------------------------------------
       30.00    15.0   PKiKP   1001.95     0.658      1.97     1.97    30.00   = PKiKP
