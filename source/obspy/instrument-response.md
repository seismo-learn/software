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
- 最近更新日期: 2023-05-11

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
