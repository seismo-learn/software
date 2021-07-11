配置文件
========

本文只介绍命令 ``sod`` 的用法。

首次运行
--------

命令行语法
^^^^^^^^^^

运行 SOD 的命令行语法很简单::

    $ sod -f recipe.xml

其中 :file:`recipe.xml` 是 SOD 的配置文件。
SOD 的配置文件称为 recipe，是一个 XML 格式的纯文本文件，其中定义了地震数据筛选的一系列规则。

运行示例
^^^^^^^^

执行 ``sod --demo -r > demo.xml`` 会生成一个名为 :file:`demo.xml` 的 recipe 示例，
用编辑器查看其内容以对 recipe 的结构和格式有个初步印象。

执行以下命令则会运行该示例::

    $ sod -f demo.xml
    Congratulations, valid recipe.
    Fiji region (-20.6, -177.7) 378 km 2003/01/04 05:15:03 UTC 6.5 mwc
    ...
    Channel: II.AAK.00.BHE
    ...
    Got 1 seismograms for II.RPN.00.BHN for eq on 2003/01/09 02:50:45 UTC
    ...

输出中的 ``Congratulations, valid recipe.`` 表明当前 recipe 可以使用。
紧接着会输出事件信息、通道信息以及获取地震波形的信息。
下载的地震波形数据保存在 :file:`seismograms` 目录下。

SOD 数据库文件
^^^^^^^^^^^^^^

每次执行 SOD 时，SOD 都会在当前目录下生成一个数据库文件夹 :file:`SodDb` 以及一些 log 文件。
数据库文件夹 :file:`SodDb` 的数据库文件中包含了单次 SOD 运行时的全部信息，
如选中了哪些事件、哪些台站以及事件台站对所对应的波形，也包含了哪些数据已经下载哪些数据尚未下载的信息。

SOD 数据库的主要作用是：若 SOD 在下载数据过程中意外退出，可以重新执行 SOD 命令，
由于 SOD 数据库中记录了哪些数据已经被下载，因而 SOD 可以继续下载那些尚未被下载的数据，
即实现断点续传的功能。

.. note::

   实测中发现的确可以断点续传，但似乎在所有数据下载完成后程序无法正常退出。

Recipe
------

一个 SOD recipe 中包含了一系列规则以限定要申请的数据的范围。

XML 文档格式
^^^^^^^^^^^^

SOD recipe 本质上是一个 xml 格式的文本文件。
XML 文档形成了一种“树”结构，它从“根部”开始，不断扩展到“枝叶”。
一个简单的 XML 文件如下：

.. code-block:: xml

    <?xml version="1.0"?>
    <root>
        <!-- this is a comment -->
        <child>
            <name>Child One</name>
            <age>10</age>
        </child>
        <child>
            <name>Child Two</name>
            <age>8</age>
        </child>
        <printline/>
    </root>

其中：

- ``<?xml version="1.0"?>`` 是 XML 声明，其指定了 XML 的版本信息
- ``<root>`` 和 ``</root>`` 是一对标签的开始标签和关闭标签，从开始标签到结束标签中的内容称之为元素
- 所有 XML 元素都必须有关闭标签
- 标签可以嵌套多层，但必须正确地嵌套
- 若某个标签中没有嵌套其他标签，则一对标签可以简写为 ``<tagName/>`` 的形式，例如 ``<printline/>``
- ``<!-- -->`` 用于注释
- XML 标签是区分大小写的

Recipe 结构
^^^^^^^^^^^

SOD recipe 是 XML 格式的文件，其根标签为 ``<sod>``，根标签下有五个直系子标签，分别是：

- ``properties``\ ：SOD 程序相关的属性配置（一般不用）
- ``eventArm``\ ：事件筛选的规则
- ``networkArm``\ ：台站/通道筛选的规则
- ``waveformArm``\ ：确定波形的时间段，筛选、下载并处理波形数据
- ``waveformVectorArm``\ ：处理三分量波形数据（不常用）

通常只需要用到 ``eventArm``、``networkArm`` 和 ``waveformArm``\ 。
显然，\ ``eventArm`` 和 ``networkArm`` 是互相独立的，
而 ``waveformArm`` 则依赖于 ``eventArm`` 和 ``networkArm``\ 。

.. image:: http://www.seis.sc.edu/sod/images/documentation/tutorials/arm_overview.png
   :alt: SOD recipe 的结构
   :align: center
   :width: 60%

因而，所有的 recipe 都符合如下基本结构：

.. code-block:: xml

    <?xml version="1.0"?>
    <sod>
        <properties>
        <!-- sod 属性，很少使用 -->
        </properties>

        <eventArm>
        <!-- eventArm 全部内容 -->
        </eventArm>

        <networkArm>
        <!-- networkArm 全部内容 -->
        </networkArm>

        <waveformArm>
        <!-- waveformArm 全部内容 -->
        </waveformArm>

        <waveformVectorArm>
        <!-- waveformVectorArm 全部内容 -->
        </waveformVectorArm>
    </sod>


下面会介绍 eventArm、networkArm 和 waveformArm 的写法和功能。
