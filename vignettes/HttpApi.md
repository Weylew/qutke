况客数据API
===========================

况客金融平台，提供R语言数据访问，请下载R包 [qutke](https://github.com/qutke/qutke)

Qutke(况客)数据旨在为策略研究平台提供高质量的数据支持。Qutke数据绝不同于市面上普通的资讯数据， 我们况客人每天为之投入了大量人力物力，并建立了一套复杂、科学、完备的数据处理体系与数据质量规则， 原始数据经过采集、清洗、转换、标准化、计算、双路校验、存储等多个环节，最终生成可供投资决策使用的高质量数据。我们从源头到最后的一个环节，在数据的整个生命周期内保证数据的可信度、完整性、一致性。数据质量是相对的，但请你相信况客人的决心与努力，我们对完美数据的追求永无止境。

如你已拥有Qutke(况客)策略研究平台权限，那么恭喜你，可以立即访问Qutke(况客)为你精心准备的数据大餐。下来, 我们不妨花上3分钟时间学习使用。Are you ready？

## 安装R包 和 初始化

```
# 安装R包
library(devtools)
install_github('qutke/qutke')

# 第一步：加载qutke包，专门用来使用况客数据R包。
library(qutke)

# 第二步，将 xxxxxxxxxxxxxxxxxxxxxxxxxxxxx 替换为个人私有的key字符串
key<-'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# 第三步，初始化，验证key有效性
init(key)
```

## 况客主数据

获取基础数据函数API。

```
getMD(data, qtid, key)
```
   
### 股票指数的基本信息 - keyMap

```
getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)
getMD(data='keyMap',qtid='000001.SZ,000001.SH',key=key)
```

**参数**

| 名称 |       类型       | 必填 |                      描述                     |
|------|------------------|------|-----------------------------------------------|
| data | character        | 必填 | 接口名                                        |
| qtid | character/vector | 必填 | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| key  | character        | 必填 | 用户密钥                                      |

**返回值**

```
getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)
       qtid InnerCode SecuCode CompanyCode                ChiName  ChiAbbr SecuMarket
1 000001.SH         1        1           1 上海证券交易所综合指数 上证指数         SH
2 000001.SZ         3        1           3   平安银行股份有限公司 平安银行         SZ
```

|     名称    |    类型   |        描述        |
|-------------|-----------|--------------------|
| qtid        | character | 证券/指数代码.市场 |
| InnerCode   | integer   | xxxx               |
| SecuCode    | integer   | 证券/指数代码      |
| CompanyCode | integer   | 公司代码           |
| ChiName     | character | 公司/指数全称      |
| ChiAbbr     | character | 公司/指数简称      |
| SecuMarket  | character | 市场类型           |


## 市场行情数据

获取A股市场股票的行情数据API。
 
```
getDailyQuote(data, qtid, SecuMarket, startdate, enddate, key)
``` 

### 股票日间行情(不复权) - mktDaily

```
getDailyQuote(data='mktDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
getDailyQuote(data='mktDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
```

**参数**

| 名称      | 类型             | 必填                              | 描述                                          |
| --        | --               | --                                | -  -                                          |
| data      | character        | 必填                              | 接口名                                        |
| qtid      | character/vector | 二选一，qitd和(startdate,enddate) | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| startdate | character/date   | 二选一，qitd和(startdate,enddate) | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate   | character/date   | 二选一，qitd和(startdate,enddate) | 结束日期，startdate 和 startdate 必须同时出现 |
| key       | character        | 必填                              | 用户密钥                                      |


**返回值**

```
getDailyQuote(data='mktDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
       qtid       date prevClose  open    hi    lo close   volume      value      ret   logRet    vwap
1 000001.SZ 2015-10-08     10.49 10.85 10.89 10.70 10.70 49407085  533806134 0.020019 0.019821 10.8042
2 000002.SZ 2015-10-08     12.73 13.25 13.32 13.03 13.07 82086235 1079570351 0.026709 0.026358 13.1517
3 000004.SZ 2015-10-08     25.36 26.63 26.85 25.98 26.31  3197967   84773773 0.037461 0.036776 26.5086
4 000005.SZ 2015-10-08      6.18  6.40  6.66  6.32  6.62 30740473  200813405 0.071197 0.068777  6.5325
5 000006.SZ 2015-10-08      9.40  9.79 10.03  9.72  9.80 20547984  202689613 0.042553 0.041673  9.8642
6 000007.SZ 2015-10-08     29.17    NA    NA    NA 29.17        0          0       NA       NA      NA
```

|    名称   |    类型   |                       描述                      |
|-----------|-----------|-------------------------------------------------|
| qtid      | character | 证券/指数代码.市场                              |
| date      | character | 交易日期                                        |
| prevClose | numeric   | 上一交易日收盘价                                |
| open      | numeric   | 当日开盘价                                      |
| hi        | numeric   | 当日最高价                                      |
| lo        | numeric   | 当日最低价                                      |
| close     | numeric   | 当日收盘价                                      |
| volume    | numeric   | 当日交易量                                      |
| value     | numeric   | 当日交易金额                                    |
| ret       | numeric   | 收益率                                          |
| logRet    | numeric   | 对数收益率                                      |
| vwap      | numeric   | 成交量加权平均价(Volume Weighted Average Price) |

### 股票日间行情(前复权) - mktFwdDaily

```
getDailyQuote(data='mktFwdDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
getDailyQuote(data='mktFwdDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
```

**参数**

|    名称   |       类型       |                必填               |                      描述                     |
|-----------|------------------|-----------------------------------|-----------------------------------------------|
| data      | character        | 必填                              | 接口名                                        |
| qtid      | character/vector | 二选一，qitd和(startdate,enddate) | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| startdate | character/date   | 二选一，qitd和(startdate,enddate) | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate   | character/date   | 二选一，qitd和(startdate,enddate) | 结束日期，startdate 和 startdate 必须同时出现 |
| key       | character        | 必填                              | 用户密钥                                      |


**返回值**

```
getDailyQuote(data='mktFwdDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
       qtid       date close   volume      value fwdAdj fwdAdjOpen fwdAdjHi fwdAdjLo fwdAdjClose      ret   logRet    vwap      vol30   ma5  ma10  ma20  ma60
1 000001.SZ 2015-10-08 10.70 49407085  533806134      1      10.85    10.89    10.70       10.70 0.020019 0.019821 10.8042 2918758254 10.53 10.66 10.83 12.00
2 000002.SZ 2015-10-08 13.07 82086235 1079570351      1      13.25    13.32    13.03       13.07 0.026709 0.026358 13.1517 3110409341 12.83 13.00 13.25 13.97
3 000004.SZ 2015-10-08 26.31  3197967   84773773      1      26.63    26.85    25.98       26.31 0.037461 0.036776 26.5086  151771164 25.74 25.91 26.72 30.84
4 000005.SZ 2015-10-08  6.62 30740473  200813405      1       6.40     6.66     6.32        6.62 0.071197 0.068777  6.5325 1396287108  6.35  6.49  6.55  7.85
5 000006.SZ 2015-10-08  9.80 20547984  202689613      1       9.79    10.03     9.72        9.80 0.042553 0.041673  9.8642 1359222462  9.60  9.90  9.84 11.33
6 000008.SZ 2015-10-08  8.60 19328027  166327043      1       8.56     8.71     8.41        8.60 0.036145 0.035507  8.6055  328420115  8.31  8.62  8.08    NA
```

|     名称    |    类型   |                       描述                      |
|-------------|-----------|-------------------------------------------------|
| qtid        | character | 证券代码.市场指数代码                           |
| date        | character | 交易日期                                        |
| close       | numeric   | 当日收盘价                                      |
| volume      | numeric   | 当日交易量                                      |
| value       | numeric   | 当日交易金额                                    |
| fwdAdj      | numeric   | 当日最低价                                      |
| fwdAdjOpen  | numeric   | 当日开盘价(前复权)                              |
| fwdAdjHi    | numeric   | 当日最高价(前复权)                              |
| fwdAdjLo    | numeric   | 当日最低价(前复权)                              |
| fwdAdjClose | numeric   | 当日收盘价(前复权)                              |
| ret         | numeric   | 当日收益率(前复权)                              |
| logRet      | numeric   | 对数收益率(前复权)                              |
| vwap        | numeric   | 成交量加权平均价(Volume Weighted Average Price) |
| vol30       | numeric   | 前30个交易日的交易量之和                        |
| ma5         | numeric   | MACD5                                           |
| ma10        | numeric   | MACD10                                          |
| ma20        | numeric   | MACD20                                          |
| ma60        | numeric   | MACD60                                          |


### 指数日间行情 - mktDataIndex

```
getDailyQuote(data='mktDataIndex',qtid=c('000001.SH','000002.SH'),key=key)
getDailyQuote(data='mktDataIndex',startdate='2015-10-01',enddate='2015-10-10',key=key)
```

**参数**

|    名称   |       类型       |                必填               |                      描述                     |
|-----------|------------------|-----------------------------------|-----------------------------------------------|
| data      | character        | 必填                              | 接口名                                        |
| qtid      | character/vector | 二选一，qitd和(startdate,enddate) | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| startdate | character/date   | 二选一，qitd和(startdate,enddate) | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate   | character/date   | 二选一，qitd和(startdate,enddate) | 结束日期，startdate 和 startdate 必须同时出现 |
| key       | character        | 必填                              | 用户密钥                                      |


**返回值**

```
getDailyQuote(data='mktDataIndex',startdate='2015-10-01',enddate='2015-10-10',key=key)
       qtid       date prevClose      open        hi        lo     close      volume        value      ret   logRet      vwap
1 000001.SH 2015-10-08 3052.7814 3156.0747 3172.2814 3133.1266 3143.3573 23427605000 258830338655 0.029670 0.029238 11.048092
2 000002.SH 2015-10-08 3197.3719 3305.7057 3322.6107 3281.5643 3292.2869 23347655200 258286294993 0.029685 0.029253 11.062622
3 000003.SH 2015-10-08  309.7113  316.4667  320.0037  316.2544  317.6654    79949800    544043662 0.025682 0.025358  6.804816
4 000004.SH 2015-10-08 2427.3034 2513.4336 2530.5791 2494.3098 2513.0178 13462647600 149354751668 0.035313 0.034703 11.094010
5 000005.SH 2015-10-08 4169.5735 4298.5773 4348.5985 4272.1955 4309.9596   966613000  11944072564 0.033669 0.033115 12.356623
6 000006.SH 2015-10-08 5559.8878 5763.0101 5782.2787 5696.6139 5717.4068   483445800   4580517406 0.028331 0.027937  9.474728
```

|    名称   |    类型   |                       描述                      |
|-----------|-----------|-------------------------------------------------|
| qtid      | character | 指数代码.市场                                   |
| date      | character | 交易日期                                        |
| prevClose | numeric   | 上一交易日收盘点位                              |
| open      | numeric   | 当日开盘点位                                    |
| hi        | numeric   | 当日最高点位                                    |
| lo        | numeric   | 当日最低点位                                    |
| close     | numeric   | 当日收盘点位                                    |
| volume    | numeric   | 当日交易量                                      |
| value     | numeric   | 当日交易金额                                    |
| ret       | numeric   | 收益率                                          |
| logRet    | numeric   | 对数收益率                                      |
| vwap      | numeric   | 成交量加权平均价(Volume Weighted Average Price) |


### 融资融券交易日间总量 - securitiesMargin

```
getDailyQuote(data='securitiesMargin',SecuMarket=90,key=key)
getDailyQuote(data='securitiesMargin',startdate='2015-10-01',enddate='2015-10-10',key=key) 
```

**参数**

|    名称    |      类型      |                   必填                  |                      描述                     |
|------------|----------------|-----------------------------------------|-----------------------------------------------|
| data       | character      | 必填                                    | 接口名                                        |
| SecuMarket | integer        | 二选一，SecuMarket和(startdate,enddate) | 证券市场                                      |
| startdate  | character/date | 二选一，SecuMarket和(startdate,enddate) | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate    | character/date | 二选一，SecuMarket和(startdate,enddate) | 结束日期，startdate 和 startdate 必须同时出现 |
| key        | character      | 必填                                    | 用户密钥                                      |

**返回值**

```
getDailyQuote(data='securitiesMargin',SecuMarket=90,key=key)
             ID InfoSource TradingDay SecuMarket ReportPeriod FinanceValue FinanceBuyValue FinanceRefundValue SecurityValue SecuritySellVolume TradingValue FinaInTVRatio TVChangeRatio  TVChangeRatioHS  UpdateTime           JSID        SecurityVolume
2  461925890068     深交所 2014-08-20         90            5 174787344145     16411051741                 NA    1633109695          181494836 176420453840      99.07431        1.1191   0.9877           2014-08-21 09:00:19 461926819300   462733489
4  462012288739     深交所 2014-08-21         90            5 176790093199     16340018547                 NA    1586285318          169538019 178376378517      99.11071        1.1087   0.9365           2014-08-22 09:00:19 462013219501   429681365
6  462271552927     深交所 2014-08-22         90            5 177595643285     15309048202                 NA    1575603853          175002277 179171247138      99.12062        0.4456   0.3434           2014-08-25 09:01:02 462272461655   421923701
8  462357939349     深交所 2014-08-25         90            5 179750871827     15622385752                 NA    1529420073          182164554 181280291900      99.15632        1.1771   0.8006           2014-08-26 08:55:34 462358533765   407562414
10 462444343756     深交所 2014-08-26         90            5 181687145410     15185454933                 NA    1451348148          214768868 183138493558      99.20751        1.0250   0.7178           2014-08-27 09:00:46 462445245584   392328324
12 462530738302     深交所 2014-08-27         90            5 183263199094     12104512169                 NA    1389626303          231029323 184652825397      99.24744        0.8269   0.7583           2014-08-28 08:55:36 462531335836   383104552         
```

|        名称        |    类型   |                                                        描述                                                        |
|--------------------|-----------|--------------------------------------------------------------------------------------------------------------------|
| InfoSource         | character | 交易所                                                                                                             |
| TradingDay         | character | 交易日期                                                                                                           |
| SecuMarket         | integer   | 证券市场                                                                                                           |
| FinanceValue       | numeric   | 融资余额(元),融资买进与归还借款间的差额; 当日融资余额=前日融资余额+当日融资买入额－当日融资偿还额;                 |
| FinanceBuyValue    | numeric   | 融资买入额(元)                                                                                                     |
| SecurityValue      | numeric   | 融券余量(元),日融券余量=前日融券余量+当日融券卖出数量-当日融券偿还量                                               |
| SecuritySellVolume | integer   | 融券卖出量(股)                                                                                                     |
| TradingValue       | numeric   | 融资融券交易总金额(元)=当日融资余额+当日融券余量金额                                                               |
| FinaInTVRatio      | numeric   | 融资占融资融券总额比(FinaInTotalRatio) = (融资余额/融资融券交易总金额)*100                                         |
| TVChangeRatio      | numeric   | 融资融券总额变动(TVChangeRatio) =(本日的融资融券交易总金额/上一日的融资融券交易总金额-1)*100                       |
| TVChangeRatioHS    | numeric   | 沪深融资融券总额变动(TVChangeRatioHS) =(沪深市场本日的融资融券交易总金额/沪深市场上一日的融资融券交易总金额-1)*100 |


## 股票行业分类

获取A股市场股票的行业分类数据API。

```
getIndustry(data, date, qtid, CompanyCode, key=key)
```

### 申万行业分类，日间数据 - industryType

```
getIndustry(data='industryType',date='2015-12-02',key=key)
getIndustry(data='industryType',date='2015-12-02',qtid=c('000001.SZ','000002.SZ'),key=key)
getIndustry(data='industryType',date='2015-12-02',CompanyCode=6,key=key)
getIndustry(data='industryType',date='2015-12-02',SW1='商业贸易',SW2='零售',SW3='百货零售',key=key)
```

**参数**

|     名称    |       类型       | 必填 |                      描述                     |
|-------------|------------------|------|-----------------------------------------------|
| data        | character        | 必填 | 接口名                                        |
| date        | character/date   | 必填 | 日期                                          |
| qtid        | character/vector | 可选 | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| CompanyCode | integer          | 可选 | 公司代码                                      |
| SW1         | character        | 可选 | 一级行业分类                                  |
| SW2         | character        | 可选 | 二级行业分类                                  |
| SW3         | character        | 可选 | 三级行业分类                                  |
| key         | character        | 必填 | 用户密钥                                      |

**返回值**

```
getIndustry(data='industryType',date='2015-12-02',key=key)
       qtid       date CompanyCode InnerCode SecuCode                      ChiName ChiNameAbbr                          EngName    EngNameAbbr SecuAbbr ChiSpelling SecuMarket ListedDate ListedSector ListedState XGRQ  SecuMarketChi  SecuCategoryChi ListedSectorChi ListedStateChi SW.FirstIndustryName SW.SecondIndustryName SW.ThirdIndustryName
1 000001.SZ 2015-12-02           3        NA        1         平安银行股份有限公司    平安银行           Ping An Bank Co., Ltd.                平安银行        PAYH         NA         NA           NA          NA   NA 深圳证券交易所      A股            主板           上市             金融服务                  银行                 银行
2 000002.SZ 2015-12-02           6        NA        2         万科企业股份有限公司        万科             China Vanke Co.,Ltd.          Vanke 万  科Ａ         WKA         NA         NA           NA          NA   NA 深圳证券交易所     A股            主板           上市               房地产            房地产开发           房地产开发
3 000004.SZ 2015-12-02          11        NA        4 深圳中国农大科技股份有限公司             Shenzhen Cau Technology Co.,Ltd. Cau Technology 国农科技        GNKJ         NA         NA           NA          NA   NA 深圳证券交易所         A股            主板           上市             医药生物              生物制品             生物制品     
```

|             名称            |    类型   |           描述           |
|-----------------------------|-----------|--------------------------|
| qtid                        | character | 股票代码.市场            |
| CompanyCode                 | integer   | 公司代码                 |
| InnerCode                   | integer   | xxxxxx                   |
| SecuCode                    | integer   | 证券代码                 |
| ChiName                     | character | 公司名称                 |
| ChiNameAbbr                 | character | 公司名称简称             |
| EngName                     | character | 公司英文名称             |
| EngNameAbbr                 | character | 公司英文名称简称         |
| SecuAbbr                    | character | 证券名称                 |
| ChiSpelling                 | character | 证券名称拼音             |
| SecuMarketChi               | character | 证券市场名称             |
| SecuCategoryChi             | character | 股票类型                 |
| ListedSectorChi             | character | 版块名称                 |
| ListedStateChi              | character | 上市状态(上市.停牌.退市) |
| SW.FirstInducharacteryName  | character | 申万一级行业             |
| SW.SecondInducharacteryName | character | 申万二级行业             |
| SW.ThirdInducharacteryName  | character | 申万三级行业             |




## 交易日数据

获取日期数据函数API。

```
getDate(data, startdate, enddate, key=key)
```

### 中国A股交易日期 - tradingDay

```
getDate(data='tradingDay',key=key)
getDate(data='tradingDay',startdate='2015-10-10',enddate='2015-12-30',key=key)
```

**参数**

|    名称   |      类型      | 必填 |                      描述                     |
|-----------|----------------|------|-----------------------------------------------|
| data      | character      | 必填 | 接口名                                        |
| startdate | character/date | 选填 | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate   | character/date | 选填 | 结束日期，startdate 和 startdate 必须同时出现 |
| key       | character      | 必填 | 用户密钥                                      |

**返回值**

```
getDate(data='tradingDay',startdate='2015-10-01',enddate='2015-10-30',key=key)
 [1] "2015-10-08" "2015-10-09" "2015-10-12" "2015-10-13" "2015-10-14" "2015-10-15" "2015-10-16" "2015-10-19" "2015-10-20" "2015-10-21"
[11] "2015-10-22" "2015-10-23" "2015-10-26" "2015-10-27" "2015-10-28" "2015-10-29" "2015-10-30"   
```

## 况客数据。

获取况客整理数据数据函数API。

```
getQtStock(data, qtid, startdate, enddate, key=key)
```

### 股票财务日间数据 - financialIndex

```
getQtStock(data='financialIndex',qtid=c('000001.SZ','000002.SZ'),key=key)
getQtStock(data='financialIndex',startdate='2015-10-12',enddate='2015-12-12',key=key)
```

**参数**

|    名称   |       类型       |                必填               |                      描述                     |
|-----------|------------------|-----------------------------------|-----------------------------------------------|
| data      | character        | 必填                              | 接口名                                        |
| qtid      | character/vector | 二选一，qitd和(startdate,enddate) | 证券/指数代码.市场，qtid个数不允许超过100个。 |
| startdate | character/date   | 二选一，qitd和(startdate,enddate) | 开始日期，startdate 和 enddate 必须同时出现   |
| enddate   | character/date   | 二选一，qitd和(startdate,enddate) | 结束日期，startdate 和 startdate 必须同时出现 |
| key       | character        | 必填                              | 用户密钥                                      |


**返回值**

```
getQtStock(data='financialIndex',startdate='2015-10-10',enddate='2015-10-12',key=key)
       qtid       date CompanyCode    EndDate NetAssetPS MainIncomePS CashFlowPS   NetProfit     EBITDA NetProfitRatio       ROA  ROECut DebtEquityRatio NetProfitGrowRate DividendPS  EPSTTM  ROETTM
1 000001.SZ 2015-10-12           3 2014-12-31    11.4617       6.4252     0.2059 19802000000         NA      26.975629  0.971115 15.1500      1569.70271           30.0112      0.174  1.7332 16.2959
2 000002.SZ 2015-10-12           6 2015-03-31     8.0500       0.8052    -2.1363   650232417 1228608451      10.209036  0.175557  0.7073       461.12701          -44.5761         NA  1.3458 16.7940
3 000004.SZ 2015-10-12          11 2015-03-31     0.9339       0.2493    -0.1641    -1853677   -1558462      -8.393007 -0.516166 -2.3849       238.43378           48.1957         NA  0.0567  5.9977
4 000005.SZ 2015-10-12          14 2015-06-30     0.7071       0.0397    -0.0002   -23188508  -18643287     -63.905998 -1.712428 -3.6237       107.50849            8.0549         NA  0.0494  6.8673
5 000006.SZ 2015-10-12          17 2015-06-30     3.1366       1.4982    -0.1662   258082865  499449147      13.268977  2.281775  6.1404       175.84471          451.3015         NA  0.5311 17.1343
6 000007.SZ 2015-10-12          20 2015-03-31     1.5150       0.1202    -0.3113    -4866348   -4064499     -22.403920 -0.920644 -1.3312        90.99122            3.4055         NA -0.1312 -8.6006
```

|        名称       |    类型   |                                      描述                                     |
|-------------------|-----------|-------------------------------------------------------------------------------|
| qtid              | character | 股票代码.市场                                                                 |
| date              | character | 业务日期                                                                      |
| CompanyCode       | integer   | 公司代码                                                                      |
| EndDate           | character | 财务报表日期(获取财务数据的报表日期:年报,半年报,季报)                         |
| NetAssetPS        | numeric   | EPS,每股净收益                                                                |
| MainIncomePS      | numeric   | 每股主营业务收入                                                              |
| CashFlowPS        | numeric   | 每股现金流                                                                    |
| NetProfit         | numeric   | 净利润                                                                        |
| EBITDA            | numeric   | EBITDA                                                                        |
| NetProfitRatio    | numeric   | 净利润率,净收益(Net Income)/ 营业收入                                         |
| ROA               | numeric   | 资产收益率 ,净利润/总资产                                                     |
| ROECut            | numeric   | 净资产收益率(摊薄-扣除)                                                       |
| DebtEquityRatio   | numeric   | 负债股权比率,负债总额/股东权益                                                |
| NetProfitGrowRate | numeric   | 净利率增长率                                                                  |
| DividendPS        | numeric   | 每股分红                                                                      |
| EPSTTM            | numeric   | 每股收益(TTM),每股收益(TTM)=净利润/期末总股本                                 |
| ROETTM            | numeric   | 净资产收益率(TTM),净资产收益率＝(净利润(TTM)*2 /(期初股东权益+期末归股东权益) |

