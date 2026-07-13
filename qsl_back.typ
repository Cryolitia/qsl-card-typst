#set page(
  width: 14cm,
  height: 9cm,
  margin: (x: 0.5cm, y: 0.5cm),
)

#set text(
  font: "Source Han Sans SC",
  fill: black,
)

#let ink = black
#let thin = 1pt

#let check() = box(width: 6pt, height: 6pt, stroke: thin + ink)

#let label(cn, en) = align(center + horizon)[
  #set text(size: 8pt, weight: "bold")
  #cn/#en
]

#let logo() = align(center + horizon)[
  #image("CRAC-LOGO513x1024_双色1-150x300.jpg", width: 100%, height: 100%, fit: "contain")
]

#let confirming = grid(
  columns: (1fr, 1fr),
  rows: (auto, auto),
  align: horizon,
  gutter: 4pt,
  [
    #check()
    #text(size: 8pt)[Confirm Our 2-Way QSO]
  ],
  [
    #check()
    #text(size: 8pt)[Confirm Your SWL Report]
  ],
  [
    #check()
    #text(size: 8pt)[My SWL Report]
  ],
  [
    #check()
    #text(size: 8pt)[Eyeball QSO]
  ],
)

#let station-header = grid(
  columns: (0.5fr, 3fr, 2.5fr),
  rows: (1.5fr, 0.4fr),
  column-gutter: 5pt,
  align: horizon,
  logo(),
  stack(
    dir: ttb,
    spacing: 0.5em,
    align(center)[
      #set text(size: 12pt, weight: "bold", tracking: 0pt)
      中国业余无线电台（全国无固定）
    ],
    align(center)[
      #set text(size: 8pt)
      AMATEUR RADIO STATION OF P.R.CHINA
    ],
    v(0.6em),
    align(center)[
      #set text(font: "JetBrainsMono NF", size: 28pt, weight: "bold", tracking: 0.3em)
      BI7BST
    ],
  ),
  grid.cell(rowspan: 2)[
    #rect(width: 100%, height: 100%, stroke: thin + ink, inset: 0.8em, align(left + top)[
    #set text(size: 12pt)
    To Radio:
  ])
  ],
  grid.cell(colspan: 2)[
    #confirming
  ],
)

#let qso-table = table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  rows: (0.5fr, 1fr, 0.5fr, 1fr),
  stroke: thin + ink,
  inset: 2pt,
  align: center + horizon,
  label[日期][DATE], label[时间][TIME], label[频率][FREQ], label[模式][MODE], label[信号报告][RST],
  [],
  [
    #align(left + bottom)[
      #text(size: 7pt, weight: "semibold")[Time Zone: ]
    ]
  ],
  [
    #align(right + bottom)[
      #text(size: 7pt, weight: "semibold")[MHz]
    ]
  ],
  [], [],
  label[设备][RIG],
  label[天线][ANT],
  label[功率][PWR],
  table.cell(colspan: 2)[
    #label[备注][RMKS]
  ],
  [], [],
  [
    #align(right + bottom)[
      #text(size: 7pt, weight: "semibold")[Watt]
    ]
  ],
  table.cell(colspan: 2)[],
)

#let footer = grid(
  columns: (1fr, 1fr),
  rows: (0.5fr, 1fr, 0.6fr),
  align: horizon,
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    rows: auto,
    align: (left + horizon, center + horizon, right + horizon, right + horizon),
    [#text(size: 8pt, weight: "bold")[CQ:]],
    [#text(size: 8pt, weight: "bold")[ITU:]],
    [#text(size: 8pt, weight: "bold")[#check() TNX]],
    [#text(size: 8pt, weight: "bold")[#check() PSE]],
  ),
  [],
  grid.cell(colspan: 1)[
    #align(bottom)[#text(size: 8pt, weight: "bold")[发射/接收 地点:]]
  ],
  [],
  grid.cell(colspan: 1)[
    #align(bottom)[#text(size: 8pt, weight: "bold", style: "italic")[Tx/Rx at:]]
  ],
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    align: horizon,
    [
      #text(size: 16pt, weight: "bold", style: "italic")[OP:]
    ],
    align(bottom)[
      #line(length: 90%, stroke: thin + ink)
    ],
  ),
)

#grid(
  rows: (1.5fr, 2fr, 0.6fr),
  gutter: 5pt,
  station-header,
  qso-table,
  footer,
)
