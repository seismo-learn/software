---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# 仪器响应

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（审稿）
- 最近更新日期: 2023-05-13

## 利用 SAC 零极点文件去除仪器响应

SAC 零极点文件是一种常见的仪器响应格式。若有 SAC 零极点格式的仪器响应文件，
则可以使用 {func}`obspy.io.sac.sacpz.attach_paz` 函数将对应的零极点文件添加到
{class}`~obspy.core.trace.Trace` 的 `stats.paz` 属性中，再使用
{meth}`Trace.simulate <obspy.core.trace.Trace.simulate>` 函数去除仪器响应。

首先准备一些示例所需的波形数据和 SAC 零极点文件：
```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
from obspy.clients.iris.client import Client as irisClient

starttime=UTCDateTime("2022-09-22T06:18:00")

# 下载 IU.ANMO 台站的三分量波形数据
client = Client("IRIS")
st = client.get_waveforms("IU", "ANMO", "00", "BH?", starttime, starttime + 720)

# 下载 IU.ANMO 台站三分量对应的 SAC 零极点文件
irisclient = irisClient()
irisclient.sacpz("IU", "ANMO", "00", "BH1", starttime, filename="IU.ANMO.00.BH1.SACPZ")
irisclient.sacpz("IU", "ANMO", "00", "BH2", starttime, filename="IU.ANMO.00.BH2.SACPZ")
irisclient.sacpz("IU", "ANMO", "00", "BHZ", starttime, filename="IU.ANMO.00.BHZ.SACPZ")
```

下面以其中一个波形为例，展示如何使用 SAC 零极点文件去除仪器响应：
```{code-cell} ipython3
tr = st[2].copy()  # 垂直分量
print(tr)
```

{func}`obspy.io.sac.sacpz.attach_paz` 函数会读取并解析 SAC 零极点文件，并将
解析后的结果附加到 `Trace` 的 `stats.paz` 属性中：
```{code-cell} ipython3
from obspy.io.sac.sacpz import attach_paz

attach_paz(tr, paz_file="IU.ANMO.00.BHZ.SACPZ")
```
`Trace.stats.paz` 属性是一个词典，包含了 `poles`、`zeros` 和 `gain` 等属性：
```{code-cell} ipython3
from pprint import pprint
pprint(dict(tr.stats.paz))
```
使用 {meth}`Trace.simulate <obspy.core.trace.Trace.simulate>` 函数去除仪器响应：
```{code-cell} ipython3
tr.simulate(paz_remove=tr.stats.paz)
```

对于包含多个波形的 `Stream` 而言，同理。可以对 `Stream` 中的每个 `Trace` 进行循环，
为每个 `Trace` 附加对应的 SAC 零极点文件并去除仪器响应：
```
for tr in st:
    attach_paz(tr, paz_file=f"{tr.id}.SACPZ")
    tr.simulate(paz_remove=tr.stats.paz)
```
也可以在为每个 `Trace` 附加 SAC 零极点文件后，调用
{meth}`Stream.simulate <obspy.core.stream.Stream.simulate>` 函数批量去除
仪器响应：
```
for tr in st:
    attach_paz(tr, paz_file=f"{tr.id}.SACPZ")
st.simulate(paz_remove="self")
```

## 校正到 WWSP 仪器响应

在使用地核震相研究地核结构时，有时会需要将波形校正到 WWSP
（即 World Wide Standard Seismograph Station short period）仪器响应。
SAC 软件中内置了 WWSP 仪器响应，可以直接使用命令 `transfer ... to wwsp` 将
波形校正到 WWSP 仪器。而 ObsPy 中没有内置 WWSP 仪器响应的信息，因而需要自行定义
WWSP 仪器响应信息并做校正。

准备示例所需数据：
```{code-cell} ipython
from obspy import UTCDateTime
from obspy.clients.fdsn import Client

starttime=UTCDateTime("2022-09-22T06:18:00")
client = Client("IRIS")
st = client.get_waveforms("IU", "ANMO", "00", "BH?", starttime, starttime + 720)
```

定义 WWSP 仪器响应，需要零极点和增益信息。这些信息可以从 SAC 源代码
{file}`sac/src/icm/wwsp.c` 中获得。定义如下：
```{code-cell} ipython
paz_wwsp = {
    "poles": [
        -5.0136607 + 6.4615109j,
        -5.0136607 - 6.4615109j,
        -8.2981509 + 0.0j,
        -8.6940765 - 7.1968661j,
        -8.6940765 + 7.1968661j,
    ],
    "zeros": [0j, 0j, 0j],
    "gain": 397.54767,
    "sensitivity": 1.0,
}
```
定义好 WWSP 仪器响应后，即可使用 {meth}`Stream.simulate <obspy.core.trace.Trace.simulate>`
函数去除仪器响应：
```{code-cell} ipython
st.simulate(paz_simulate=paz_wwsp)
```
该方法也同样适用于其他 SAC 内置仪器响应。
