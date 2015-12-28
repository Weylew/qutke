qutke, R Package for Qutke project
=======================

R Package for Qutke project provided by Qutke.com .

https://console.qutke.com/api.html

## INSTALL

```{r}
library(devtools)
install_github('qutke/qutke')
```

## DEMO

```{r}
library(qutke)

key<-'ff5ed58edf645c6581e8148db1130dc310fbab5fdccc4b2a9ea0be30f4128ace'
init(key)


keyMap1<-getMD(data='keyMap',qtid='000001.SZ,000001.SH',key=key)
keyMap2<-getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)

stock1<-getDailyQuote(data='mktDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
stock2<-getDailyQuote(data='mktDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock3<-getDailyQuote(data='mktFwdDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
stock4<-getDailyQuote(data='mktFwdDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock5<-getDailyQuote(data='mktDataIndex',qtid=c('000001.SH','000002.SH'),key=key)
stock6<-getDailyQuote(data='mktDataIndex',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock7<-getDailyQuote(data='securitiesMargin',SecuMarket=90,key=key)
stock8<-getDailyQuote(data='securitiesMargin',startdate='2015-10-01',enddate='2015-10-10',key=key) 

industry1<-getIndustry(data='industryType',date='2015-12-02',key=key)
industry2<-getIndustry(data='industryType',date='2015-12-02',qtid=c('000001.SZ','000002.SZ'),key=key)
industry3<-getIndustry(data='industryType',date='2015-12-02',CompanyCode=6,key=key)

date1<-getDate(data='tradingDay',key=key)
date2<-getDate(data='tradingDay',startdate='2015-10-10',enddate='2015-12-30',key=key)

qtstock1<-getQtStock(data='stockBeta',qtid=c('000001.SZ','000002.SZ'),key=key)
qtstock2<-getQtStock(data='stockBeta',startdate='2015-10-01',enddate='2015-10-10',key=key)
qtstock3<-getQtStock(data='financialIndex',qtid=c('000001.SZ','000002.SZ'),key=key)
qtstock4<-getQtStock(data='financialIndex',startdate='2015-10-10',enddate='2015-12-30',key=key)

stock1$date<-as.qtDate(stock1$date)
postData(stock1,name='abc',key=key)
postData(industry0,name='industry0',key=key)

```

