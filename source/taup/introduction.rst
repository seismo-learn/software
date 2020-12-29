简介
====

TauP 用于计算一维球状地球速度模型下，地震震相的走时和路径。

功能与特色
----------

相对于 ttimes 而言，TauP 具有更多的功能和特色：

1. 可以计算震相走时、射线参数、反射点、穿透点、射线路径、走时曲线等
2. 支持自定义速度模型
3. 内置震相解析器，支持不常见的震相名
4. 自带多个预定义地球模型：``iasp91``、``prem``、``ak135``、``jb``、``1066a``、``1066b``、``pwdk``、``sp6``、``herrin``
5. 部分兼容 ttimes，比如用 ttp 表示常见 P 波震相，除此之外，还有 tts、ttp+、tts+、ttbasic、ttall
6. 采用线性插值，可能带来 0.01 秒的误差
7. 直接在球坐标系下求解方程，不必做展平变换；与部分震相的解析解相比，最大误差为 0.01 秒，而 ttimes 的最大误差为 0.05 秒

目前来看，有一些缺点：

1. 不支持 PKPab、PKPbc 等震相名
2. 输出的格式不够灵活，有时需要自己写脚本从输出中提取信息

工具
----

TauP 提供了多个工具:

- 图形界面： ``taup``
- 交互式： ``taup_console``
- 命令行工具： ``taup_time`` 、 ``taup_pierce`` 、 ``taup_setsac`` 、 ``taup_path`` 、 ``taup_curve`` 、 ``taup_create`` 、 ``taup_table`` 、 ``taup_wavefront``