---
"\u6700\u8FD1\u66F4\u65B0\u65E5\u671F": '2021-06-02'
"\u672C\u8282\u8D21\u732E\u8005": "{{ \u7530\u51AC\u51AC }}\uFF08\u4F5C\u8005\uFF09\
  \u3001\n{{ \u59DA\u5BB6\u56ED }}\uFF08\u5BA1\u7A3F\uFF09"
---

# taup velplot

______________________________________________________________________

`taup velplot` 可以很方便地生成用于绘制速度-深度剖面的 GMT 脚本。

使用 `taup velplot --help` 可查询该命令的完整用法和选项。此处仅介绍其常用用法。

生成 iasp91 参考模型的速度-深度剖面绘图脚本:

```
$ taup velplot -mod iasp91
```

执行以上命令生成的脚本 {file}`iasp91_vel.gmt`，生成 PDF 格式的速度-深度剖面:

```
$ sh iasp91_vel.gmt
```

绘制出来的图件效果如下（蓝线为 P 波速度，红线为 S 波速度）：

```{image} taup_velplot.jpg
:align: center
:width: 400 px
```
