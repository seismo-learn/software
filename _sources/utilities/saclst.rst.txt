saclst
======

:本节贡献者: `田冬冬 <https://me.seisman.info/>`__\ （作者）、`姚家园 <https://github.com/core-man>`__\ （审稿）
:最近更新时间: 2021-01-09

----

``saclst`` 是 SAC 软件自带的一个常用工具，用于列出头段变量的值。

使用 ``saclst help`` 可查询该命令的完整用法和选项。终端只键入 ``saclst``
可查询简单用法，其语法很简单::

    $ saclst header_lists f file_lists

- ``header_lists``：要查看的头段变量名列表
- ``f``：关键字，表明接下来的所有参数都是 SAC 文件
- ``file_lists``：SAC 文件列表

.. note::

   使用 ``saclst`` 时，SAC 头段变量名并不区分大小写，除了头段变量 ``F`` 以外。
   ``F`` 用于存储事件的结束时刻相对于参考时刻的秒数，为了与关键字 ``f`` 区分，
   使用 ``saclst`` 查看其值时，必须使用大写。

查看单个文件的单个头段::

     $ saclst npts f seis.SAC
     seis.sac     1000

查看单个文件的多个头段::

     $ saclst npts delta F f seis.SAC
     seis.sac     1000       0.025      10.233

查看多个文件的多个头段::

    $ saclst stla stlo evla evlo gcarc f N.*.U
    N.AAKH.U      36.3726      137.92      -5.514     151.161     43.4752
    N.ABNH.U      34.6326     137.231      -5.514     151.161     42.0392
    N.AC2H.U      35.4786     137.735      -5.514     151.161     42.6857
    N.AGMH.U       35.787     137.717      -5.514     151.161     42.9798
    N.AGWH.U      43.0842      140.82      -5.514     151.161     49.2714
    N.AHIH.U      38.2799     139.549      -5.514     151.161     44.8874
