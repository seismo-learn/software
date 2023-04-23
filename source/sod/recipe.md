---
"\u6700\u8FD1\u66F4\u65B0\u65E5\u671F": '2022-08-16'
"\u672C\u8282\u8D21\u732E\u8005": "{{ \u7530\u51AC\u51AC }}\uFF08\u4F5C\u8005\uFF09\
  \u3001\n{{ \u59DA\u5BB6\u56ED }}\uFF08\u4F5C\u8005\uFF09"
---

# 配置文件

______________________________________________________________________

运行 SOD 需要使用配置文件（称为 recipe），是一个 XML 格式的纯文本文件，其定义了数据筛选和处理的一系列规则。
在终端输入以下命令，即可按照配置文件（假设文件名为 {file}`recipe.xml`）定义的规则下载数据:

```
$ sod -f recipe.xml
```

## 初识配置文件

### 运行第一个配置文件

在终端中执行以下命令，会生成一个名为 {file}`demo.xml` 的配置文件示例:

```
$ sod --demo -r > demo.xml
```

执行以下命令，运行该配置文件（大约需要一分钟）:

```
$ sod -f demo.xml
Congratulations, valid recipe.
262 km WNW of Haveluloto, Tonga (-20.6, -177.7) 378 km 2003/01/04 05:15:03 UTC 6.5 mwc
25 km WSW of Bolitoc, Philippines (15.7, 119.7) 10 km 2003/01/06 23:43:50 UTC 6.0 mwb
...
...
Channel: II.AAK.00.BHE
Channel: II.AAK.00.BHN
Channel: II.AAK.00.BHZ
...
...
Got 1 seismograms for II.AAK.00.BHE for eq on 2003/01/06 23:43:50 UTC
Got 1 seismograms for II.ARU.00.BHE for eq on 2003/01/06 23:43:50 UTC
...
...
```

运行后，可以看到一系列输出信息：

- `Congratulations, valid recipe.` 表明当前配置文件可以使用
- 事件信息，如 `262 km WNW of Haveluloto, Tonga (-20.6, -177.7)`
- 通道信息，如 `Channel: II.AAK.00.BHE`
- 获取地震波形信息，如 `Got 1 seismograms for II.AAK.00.BHE`

下载的地震波形数据保存在 {file}`seismograms` 目录中，每个地震事件的波形数据则默认保存在以发震
发震时刻命名的目录中。

### SOD 数据库文件

每次执行 SOD 时，SOD 还会在当前目录生成一些日志文件（文件名以 `log` 为后缀）和一个数据库文件夹 {file}`SodDb`。
这些日志文件记录了 SOD 的运行和报错信息。数据库文件夹里的数据库文件中包含了单次运行时的全部信息，
如选中了哪些事件、哪些台站、事件台站对所对应的波形，也包含了哪些数据已经下载、哪些数据尚未下载的信息。

在下载数据过程中，若 SOD 意外退出，或由于网络等问题某些数据未成功下载，仍可重新执行 SOD 命令，
继续下载那些尚未被下载的数据，即实现断点续传的功能，这是因为数据库记录了哪些数据已经下载、
哪些数据尚未下载。再次运行 SOD 时，会有以下提示：

```
The database for this run, SodDb/SodDb.log appears to already exist.
This is fine if you want to restart a run that crashed, but if you are trying to
start a fresh SOD run, you may wish to delete this database directory first.
Otherwise, SOD will consider any work in this database as already completed and will not redo it.
```

若修改了当前目录中的配置文件，再次运行 SOD 前，建议删除上一次运行时生成的数据库文件夹 {file}`SodDb`。

## 配置文件结构

SOD 配置文件是一个 XML 格式的纯文本文件。可以用文本编辑器查看示例配置文件 {file}`demo.xml`，
对配置文件结构和格式有个初步印象。

```{eval-rst}
.. dropdown:: :fa:`exclamation-circle,mr-1` XML 格式简介
   :color: info
   :icon: info

   XML 的全称是 E\ **x**\ tensible **M**\ arkup **L**\ anguage，即可扩展标记语言，
   用来结构化、存储以及传输信息。这种文件格式是一种“树”状结构，从“根部”开始，不断扩展到“枝叶”。
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

   - ``<?xml version="1.0"?>`` 是 XML 声明，定义了 XML 的版本信息（``1.0``）
   - ``<root>`` 和 ``</root>`` 是一个根标签的开始标签和关闭标签
   - 标签可以嵌套多层，如 ``root`` 标签嵌套了一系列子标签
   - 所有标签都必须有关闭标签
   - 标签区分大小写
   - 若某个标签中没有嵌套其他标签，则该标签可以简写为 ``<tagName/>`` 的形式，例如 ``<printline/>``
   - ``<!-- -->`` 用于注释
```

配置文件的根标签为 `sod`，根标签下有五个子标签，分别是：

- `properties`：SOD 程序相关的属性配置【一般不用】
- `eventArm`：事件筛选规则
- `networkArm`：台站/通道筛选规则
- `waveformArm`：波形数据筛选规则、下载和处理波形数据
- `waveformVectorArm`：处理三分量波形数据【不常用】

通常我们只需要用到 `eventArm`、`networkArm`、`waveformArm` 。
`eventArm` 和 `networkArm` 是互相独立的，
而 `waveformArm` 则依赖于 `eventArm` 和 `networkArm`。

```{image} http://www.seis.sc.edu/sod/images/documentation/tutorials/arm_overview.png
:align: center
:alt: "SOD \u914D\u7F6E\u6587\u4EF6\u7684\u7ED3\u6784"
:width: 50%
```

所有的配置文件都符合如下基本结构：

```xml
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
```
