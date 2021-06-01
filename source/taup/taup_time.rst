taup time
=========

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-05-31

----

``taup time`` 命令可用于计算震相走时、射线参数、出射角、入射角等信息。

基本用法
--------

使用 ``taup time --help`` 可查询该命令的完整用法和选项，此处仅介绍常用用法。

计算震源深度为 300 km，震中距 60° 处，P、S、PcP、ScS、PKiKP 震相的走时信息::

   $ taup time -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP

-  ``-h``：震源深度（单位 km），默认深度为 0.0 km。
-  ``-deg``：震中距（单位 °）
-  ``-ph``：以逗号分隔的震相名

TauP 默认使用 iasp91 模型，可以使用 ``-mod`` 选项设置其他 TauP 预定义速度模型::

   $ taup time -mod prem -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP
   $ taup time -mod ak135 -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP

TauP 默认台站位于地表，可使用 ``--stadepth`` 选项设置台站深度（单位为 km）::

   $ taup time -h 300 -deg 60 --stadepth 0.5 -ph P,S,PcP,ScS,PKiKP

若已知震源和台站位置，也可以使用 ``-evt`` 和 ``-sta`` 选项分别指定震源和台站的
纬度和经度。例如，震源位于 (40 °N，10 °E)，台站位于 (20 °S，10 °W)::

   $ taup time -h 300 -evt 40 10 -sta -20 -10 -ph P,S,PcP,ScS,PKiKP

.. warning::

   使用 ``-evt`` 和 ``-sta`` 选项时，``taup time`` 会假设地球是完美球体，
   来计算震源和台站的震中距，这会产生一定的误差。例如，根据以上参数
   ``taup time`` 计算得到的震中距约为 62.83°，P 波初至到时为 594.27 秒。
   而 ObsPy 的
   `gps2dist_azimuth <https://docs.obspy.org/packages/autogen/obspy.geodetics.base.gps2dist_azimuth.html#obspy.geodetics.base.gps2dist_azimuth>`__
   函数计算得到的震中距约为 6959 km （采用 WGS84 椭球：赤道半径 6378.1370 km、
   扁率约为 0.0033528106647474805），在半径为 6371 km 的完美球状地球上约为 62.585°
   （利用 `kilometers2degrees <https://docs.obspy.org/packages/autogen/obspy.geodetics.base.kilometers2degrees.html#obspy.geodetics.base.kilometers2degrees>`__
   函数计算得到），使用 62.585° 直接计算的 P 波初至到时为 592.64 秒，二者相差 1.63 秒。

在震中距比较小的情况下，可以使用 ``-km`` 选项指定震中距（单位为 km）。
比如计算震源深度为 5 km，震中距 100 km 处，P、S、PcP、ScS、PKiKP 震相的走时信息::

   $ taup time -h 5 -km 100 -ph P,S,PcP,ScS,PKiKP

输出格式
--------

下面的命令计算了 PREM 模型下，震源深度 100 km，震中距 60° 处，P 和 pP 震相的走时信息。
其输出为::

   $ taup time -mod prem -h 100 -deg 60 -ph P,pP

   Model: prem
   Distance   Depth   Phase   Travel    Ray Param  Takeoff  Incident  Purist    Purist
     (deg)     (km)   Name    Time (s)  p (s/deg)   (deg)    (deg)   Distance   Name
   -----------------------------------------------------------------------------------
      60.00   100.0   P        595.40     6.815     30.14    20.82    60.00   = P
      60.00   100.0   pP       618.89     6.890    149.49    21.06    60.00   = pP

输出共 9 列，从左到右分别为：

1.  震中距（度）：地震震中与台站的大圆弧路径长度
2.  震源深度（km）
3.  震相名
4.  震相走时（秒）
5.  射线参数（秒/度）

    .. note::

        射线参数有三种常用单位：秒/度（s/deg ）、秒/弧度（s/radian）、秒/千米（s/km）。
        三者之间的关系为（:math:`R_0` 为地球半径，假设为 6371 km）：

        .. math::

            1 s/deg = \frac{1}{\pi*R_0/180} s/km = 1/111.19492 s/km

        .. math::

            1 s/deg = \frac{1}{\pi/180} s/radian = 57.29578 s/radian

6.  出射角（度）：即射线从震源出射时与\ **垂直向下**\ 方向的夹角，取值范围为 0 到 180°。

    - 0° 到 90° 表示射线向下出射（例如 P 震相）
    - 90° 到 180° 表示射线向上出射（例如 pP 震相)

    .. note::

       不同文章对出射角的定义不同，使用时应格外注意。

       老版本的 TauP 对出射角的定义不同，可视为 BUG，应避免使用老版本 TauP。

7.  入射角（度）：射线入射到台站时与\ **垂直向上**\ 方向的夹角。
8.  Purist 距离：地震波实际走过的圆弧距离。

    该值可能与震中距不同，例如 50° 震中距处记录到的 PKKKP 震相，实际走过的
    圆弧距离为 410°::

        $ taup time -deg 50 -ph PKKKP

        Model: iasp91
        Distance   Depth   Phase   Travel    Ray Param  Takeoff  Incident  Purist    Purist
          (deg)     (km)   Name    Time (s)  p (s/deg)   (deg)    (deg)   Distance   Name
        -----------------------------------------------------------------------------------
          50.00     0.0   PKKKP   2519.56     2.242      6.72     6.72   410.00   = PKKKP

9.  Purist 震相名：地震波的“真实”震相名。

    例如，若想要计算 SS 震相在 660 km 不连续面的下表面的反射波走时，可指定其震相名为
    ``S^660S``。由于 PREM 模型中 660 km 不连续面的“真实”深度为 670 km，此时
    TauP 实际返回的时从 670 km 处反射回的震相，此时 Purist 震相名会显示为 ``S^670S``::

        $ taup time -mod prem -deg 120 -ph S^660S

        Model: prem
        Distance   Depth   Phase    Travel    Ray Param  Takeoff  Incident  Purist    Purist
          (deg)     (km)   Name     Time (s)  p (s/deg)   (deg)    (deg)   Distance   Name
        ------------------------------------------------------------------------------------
          120.00     0.0   S^660S   1975.75    12.336     20.79    20.79   120.00   * S^670S

可以使用 ``--rel`` 选项输出相对于某个指定震相的走时差。例如，
下面的命令中，最后一列输出了所有震相相对于 PcP 震相的走时差::

    $ taup time -mod prem -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP --rel PcP

    Model: prem
    Distance   Depth   Phase   Travel    Ray Param  Takeoff  Incident  Purist    Purist Relative to
      (deg)     (km)   Name    Time (s)  p (s/deg)   (deg)    (deg)   Distance   Name       PcP
    -----------------------------------------------------------------------------------------------
       60.00   300.0   P        574.72     6.739     33.65    20.58    60.00   = P      -42.32
       60.00   300.0   PcP      617.05     4.016     19.28    12.09    60.00   = PcP      0.00
       60.00   300.0   PKiKP    993.45     1.245      5.88     3.72    60.00   = PKiKP  376.41
       60.00   300.0   S       1043.98    12.659     34.16    21.37    60.00   = S      426.93
       60.00   300.0   ScS     1134.89     7.480     19.38    12.43    60.00   = ScS    517.85

信息提取
--------

上面介绍的输出中包含了很多信息，想要在脚本中提取出想要的信息有些麻烦。所以
``taup time`` 提供了一些选项，使得在脚本中计算走时、射线参数更加方便。

走时
^^^^^

``--time`` 选项使得输出中只包含走时信息，并且小数点的位数更多::

   $ taup time -mod prem -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP --time
   574.7245 617.047 993.4524 1043.9805 1134.8923

需要注意的是，输出的走时不是按照 ``-ph`` 选项中震相的顺序进行排序的，
而是按照走时递增的顺序排序。比如这里，S 震相放在震相列表的第二位，
而 S 震相的走时 1043.9805 却放在第四位。

射线参数
^^^^^^^^^

``--rayp`` 选项使得输出中只包含射线参数信息，并且小数点的位数更多::

   $ taup time -mod prem -h 300 -deg 60 -ph P,S,PcP,ScS,PKiKP --rayp
   6.739042 4.0158706 1.2450149 12.65922 7.480467

此时，输出的射线参数是按照 ``-ph`` 选项中震相的顺序进行排序的。

.. note::

   ``--rayp`` 和 ``--time`` 选项不能一起使用。
   当两个选项同时使用时，会以后出现的选项为准。
