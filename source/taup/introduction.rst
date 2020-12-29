简介
====

TauP 用于计算一维球状分层模型下地震震相的走时和路径。

功能与特色
----------

与传统的地震震相走时计算软件 ttimes 相比，TauP 具有更多的功能和特色：

1. 计算震相走时、射线参数、反射点、穿透点、射线路径、走时曲线等
2. 内置震相解析器，支持任意震相名
3. 部分兼容 ttimes 震相名： ``ttp`` 表示常见 P 波震相；同理，还有 ``tts``、``ttp+``、``tts+``、``ttbasic``、``ttall``
4. 自带多个地球地震波速度参考模型：iasp91、prem、ak135 等
5. 支持自定义速度模型
6. 直接在球坐标系下求解方程，不必做展平变换，与部分震相的解析解相比，TauP 的最大误差为 0.01 秒，而 ttimes 的最大误差为 0.05 秒
7. ObsPy 提供了 `TauP 的 Python 接口 <https://docs.obspy.org/packages/obspy.taup.html>`__

TauP 目前还存在一些缺点：

1. 采用线性插值，可能带来 0.01 秒的误差
2. 不支持 PKPab、PKPbc 等震相名

工具
----

TauP 提供了多个工具:

- 图形界面： ``taup``
- 交互式： ``taup_console``
- 命令行工具：

  - ``taup_time`` ：计算震相的走时、射线参数、出射角、入射角等
  - ``taup_pierce`` ：计算震相在波速不连续面和指定深度的反射点和穿透点
  - ``taup_path`` ：计算射线路径
  - ``taup_wavefront`` ：计算波前面
  - ``taup_curve`` ：计算走时曲线
  - ``taup_table`` ：计算走时表
  - ``taup_setsac`` ：将震相走时写入 SAC 头段中
  - ``taup_create`` ：预计算速度模型

引用
----

- Crotwell, H. P., Owens, T. J., & Ritsema, J. (1999).
  The TauP Toolkit: Flexible Seismic Travel-time and Ray-path Utilities.
  *Seismological Research Letters*, 70(2), 154–160.
  https://doi.org/10.1785/gssrl.70.2.154