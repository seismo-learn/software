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
- 最近更新日期: 2023-05-12

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
