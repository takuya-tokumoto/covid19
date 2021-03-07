# packageの読み込み
library(tidyverse)
library(ggplot2)
library(ggsci)


# Download the raw CSV file
# 陽性者数 (累計)
d <- read.csv('https://stopcovid19.metro.tokyo.lg.jp/data/130001_tokyo_covid19_patients.csv', fileEncoding="UTF-8-BOM", header=TRUE)

# 都道府県別
# 東京都のみ
d_g_pref <- group_by(d, 都道府県名)
summarise(d_g_pref, uu = n_distinct(No))

# 公表日別カウント
d_g_date <- group_by(d, 公表_年月日)
d_g_date_summ = summarise(d_g_date, uu = n_distinct(No))

x <- d_g_date_summ$公表_年月日
y <- d_g_date_summ$uu
par(xaxt="n")
plot(x, y, main = "Title",xlab = "Date", ylab = "Val", type = "l")
par(xaxt = "s")
axis.Date(1, at = seq(min(x),max(x),"years"))
