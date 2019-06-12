
# 外部パッケージの読み込み ------------------------------------------------------------

library(tidyverse)

# ディレクトリの設定 ---------------------------------------------------------------
user_dir <- Sys.getenv("USERPROFILE")
# 相対パスでwork_dirを指定
work_dir <- paste0(user_dir, "\\Dropbox\\Yamaha-lab\\0_semi\\2019Temp\\data_2018\\")
# ファイル名を取得
file_names <- dir(work_dir) 

# 時刻ラベルの定義 ----------------------------------------------------------------

hour_lab <- c("00:00:00", "00:30:00", "01:00:00", "01:30:00", "02:00:00", "02:30:00",
              "03:00:00", "03:30:00", "04:00:00", "04:30:00", "05:00:00", "05:30:00", 
              "06:00:00", "06:30:00", "07:00:00", "07:30:00", "08:00:00", "08:30:00", 
              "09:00:00", "09:30:00", "10:00:00", "10:30:00", "11:00:00", "11:30:00", 
              "12:00:00", "12:30:00", "13:00:00", "13:30:00", "14:00:00", "14:30:00",
              "15:00:00", "15:30:00", "16:00:00", "16:30:00", "17:00:00", "17:30:00", 
              "18:00:00", "18:30:00", "19:00:00", "19:30:00", "20:00:00", "20:30:00", 
              "21:00:00", "21:30:00", "22:00:00", "22:30:00", "23:00:00", "23:30:00" )


# forループ処理 ----------------------------------------------------------------
for (i in 1:length(file_names)) {
  if(i == 1) {
    # ファイルから日付の取得
    temp_date <- read_csv(paste0(work_dir, file_names[i]), col_names = F,
                          locale = locale(encoding = "SJIS"),
                          skip = 0, n_max = 1)
    
    # 日付ラベルの作成
    date_lab <- paste0(substr(temp_date$X2, 1, 4), "-", 
                       substr(temp_date$X3, 1, 2), "-",
                       substr(temp_date$X4, 1, 2))
    
    # データを取得 
    temp <- read_csv(paste0(work_dir, file_names[i]), 
                     locale = locale(encoding = "SJIS"), col_names = F, skip = 2)
    
    # 列名ベクトルの取得
    init_colnames <- temp$X2
    
    # 転置行列化, 最小値・最大値・平均値・合計値の項目を除く
    # 要素化を防ぐため、数値データのみとする
    t_temp <- as.data.frame(t(dplyr::select(temp, X4:X51)), row.names = F)
    
    # 一日ごとの日付時刻ラベル作成
    date_time <- paste(date_lab, hour_lab, sep = " ")
    
    n_temp <- t_temp
    colnames(n_temp) <- init_colnames
    n_lab <- date_time
    
  } else if(i < 6) { # 2018年4月6日からc19の列名が変わったため!!!!(怒)
    # ファイルから日付の取得
    temp_date <- read_csv(paste0(work_dir, file_names[i]), col_names = F,
                          locale = locale(encoding = "SJIS"),
                          skip = 0, n_max = 1)
    
    # 日付ラベルの作成
    date_lab <- paste0(substr(temp_date$X2, 1, 4), "-", 
                       substr(temp_date$X3, 1, 2), "-",
                       substr(temp_date$X4, 1, 2))
    
    # データを取得 
    temp <- read_csv(paste0(work_dir, file_names[i]), 
                     locale = locale(encoding = "SJIS"), col_names = F, skip = 2)
    
    # 列名とするベクトルの抽出
    cnames <- temp$X2
    
    # 転置行列化, 最小値・最大値・平均値・合計値の項目を除く
    # 要素化を防ぐため、数値データのみとする
    t_temp <- as.data.frame(t(dplyr::select(temp, X4:X51)), row.names = F)
    
    # 列名の追加
    names(t_temp) <- cnames
    
    # 列名で整列させる(元データに余分な全角スペースが入っている)
    c1 <- t_temp$`東ｷｬﾝﾊﾟｽ受電電力量　　　　　　　`
    c2 <- t_temp$`西ｷｬﾝﾊﾟｽ受電電力量　　　　　　　`
    c3 <- t_temp$`中地区方面電力量　　　　　　　　`
    c4 <- t_temp$`西地区方面電力量　　　　　　　　`
    c5 <- t_temp$`北地区方面電力量　　　　　　　　`
    c6 <- t_temp$`6号館方面電力量 　　　　　　　　`
    c7 <- t_temp$`16号館方面電力量　　　　　　　　`
    c8 <- t_temp$`2号館電力量 　　　　　　　　　　`
    c9 <- t_temp$`1号館電力量 　　　　　　　　　　`
    c10 <- t_temp$`5号館電力量 　　　　　　　　　　`
    c11 <- t_temp$`3･7･8号館電力量 　　　　　　　　`
    c12 <- t_temp$`19･20号館電力量 　　　　　　　　`
    c13 <- t_temp$`10号館電力量　　　　　　　　　　`
    c14 <- t_temp$`ｷｬﾝﾊﾟｽﾌﾟﾗｻﾞ･15号館電力量　　　　`
    c15 <- t_temp$`33号館電力量　　　　　　　　　　`
    c16 <- t_temp$`17･11号館電力量 　　　　　　　　`
    c17 <- t_temp$`30･31号館電力量 　　　　　　　　`
    c18 <- t_temp$`32号館電力量　　　　　　　　　　`
    c19 <- t_temp$`第一学生ﾎｰﾙ･9号館電力量 　　　　`
    c20 <- t_temp$`図書館電力量　　　　　　　　　　`
    c21 <- t_temp$`図書館新館電力量　　　　　　　　`
    c22 <- t_temp$`21号館電力量　　　　　　　　　　`
    c23 <- t_temp$`22号館(東)電力量　　　　　　　　`
    c24 <- t_temp$`24号館(総合情報ｾﾝﾀｰ)電力量　　　`
    c25 <- t_temp$`23号館(ﾘｻｰﾁｾﾝﾀｰ)電力量　　　　　`
    c26 <- t_temp$`ﾒﾓﾘｱﾙﾎｰﾙ電力量　　　　　　　　　`
    c27 <- t_temp$`体育･文化ｾﾝﾀｰ電力量 　　　　　　`
    c28 <- t_temp$`5号館屋外電力量 　　　　　　　　`
    c29 <- t_temp$`図書館(空調)電力量　　　　　　　`
    c30 <- t_temp$`22号館(西)電力量　　　　　　　　`
    c31 <- t_temp$`25号館方面電力量　　　　　　　　`
    c32 <- t_temp$`ｸﾞﾗｳﾝﾄﾞ方面電力量 　　　　　　　`
    c33 <- t_temp$`70号館方面電力量　　　　　　　　`
    c34 <- t_temp$`50号館方面電力量　　　　　　　　`
    c35 <- t_temp$`50･51号館電力量 　　　　　　　　`
    c36 <- t_temp$`53号館(地上)電力量　　　　　　　`
    c37 <- t_temp$`52号館電力量　　　　　　　　　　`
    c38 <- t_temp$`ﾌﾛﾝﾃｨｱ研究棟電力量　　　　　　　`
    c39 <- t_temp$`高電圧実験室電力量　　　　　　　`
    c40 <- t_temp$`体育館電力量　　　　　　　　　　`
    c41 <- t_temp$`ｸﾞﾗｳﾝﾄﾞ電力量 　　　　　　　　　`
    c42 <- t_temp$`29号館(ｸﾗﾌﾞ･ｻｰｸﾙﾌﾟﾗｻﾞ)電力量　　`
    c43 <- t_temp$`ﾃﾆｽｺｰﾄ電力量　　　　　　　　　　`
    c44 <- t_temp$`53号館(屋上)電力量　　　　　　　`
    c45 <- t_temp$`超伝導実験棟電力量　　　　　　　`
    c46 <- t_temp$`72号館電力量　　　　　　　　　　`
    c47 <- t_temp$`体育館(空調)電力量　　　　　　　`
    c48 <- t_temp$`55号館電力量　　　　　　　　　　`
    c49 <- t_temp$`70･71号館電力量 　　　　　　　　`
    c50 <- t_temp$`武道体育館電力量　　　　　　　　`
    c51 <- t_temp$`25号館電力量　　　　　　　　　　`
    c52 <- t_temp$`14号館方面電力量　　　　　　　　`
    c53 <- t_temp$`その他電力量　　　　　　　　　　`
    c54 <- t_temp$`不言実行館電力量　　　　　　　　`
    c55 <- t_temp$`外気温度　　　　　　　　　　　　`
    c56 <- t_temp$`外気湿度　　　　　　　　　　　　`
    
    # この順に強制的に並べ替え
    t_temp2 <- cbind.data.frame(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,
                                c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,
                                c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,
                                c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,
                                c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,
                                c51,c52,c53,c54,c55,c56)
    # 一日ごとの日付時刻ラベル作成
    date_time <- paste0(date_lab, " ", hour_lab)
    
    x_temp <- t_temp2
    names(x_temp) <- init_colnames
    # n_tempの更新
    n_temp <- rbind(n_temp, x_temp)
    x_lab <- date_time
    # n_labの更新
    n_lab <- cbind(n_lab, x_lab)
  } else {
    # ファイルから日付の取得
    temp_date <- read_csv(paste0(work_dir, file_names[i]), col_names = F,
                          locale = locale(encoding = "SJIS"),
                          skip = 0, n_max = 1)
    
    # 日付ラベルの作成
    date_lab <- paste0(substr(temp_date$X2, 1, 4), "-", 
                       substr(temp_date$X3, 1, 2), "-",
                       substr(temp_date$X4, 1, 2))
    
    # データを取得 
    temp <- read_csv(paste0(work_dir, file_names[i]), 
                     locale = locale(encoding = "SJIS"), col_names = F, skip = 2)
    
    # 列名とするベクトルの抽出
    cnames <- temp$X2
    
    # 転置行列化, 最小値・最大値・平均値・合計値の項目を除く
    # 要素化を防ぐため、数値データのみとする
    t_temp <- as.data.frame(t(dplyr::select(temp, X4:X51)), row.names = F)
    
    # 列名の追加
    names(t_temp) <- cnames
    
    # 列名で整列させる(元データに余分な全角スペースが入っている)
    c1 <- t_temp$`東ｷｬﾝﾊﾟｽ受電電力量　　　　　　　`
    c2 <- t_temp$`西ｷｬﾝﾊﾟｽ受電電力量　　　　　　　`
    c3 <- t_temp$`中地区方面電力量　　　　　　　　`
    c4 <- t_temp$`西地区方面電力量　　　　　　　　`
    c5 <- t_temp$`北地区方面電力量　　　　　　　　`
    c6 <- t_temp$`6号館方面電力量 　　　　　　　　`
    c7 <- t_temp$`16号館方面電力量　　　　　　　　`
    c8 <- t_temp$`2号館電力量 　　　　　　　　　　`
    c9 <- t_temp$`1号館電力量 　　　　　　　　　　`
    c10 <- t_temp$`5号館電力量 　　　　　　　　　　`
    c11 <- t_temp$`3･7･8号館電力量 　　　　　　　　`
    c12 <- t_temp$`19･20号館電力量 　　　　　　　　`
    c13 <- t_temp$`10号館電力量　　　　　　　　　　`
    c14 <- t_temp$`ｷｬﾝﾊﾟｽﾌﾟﾗｻﾞ･15号館電力量　　　　`
    c15 <- t_temp$`33号館電力量　　　　　　　　　　`
    c16 <- t_temp$`17･11号館電力量 　　　　　　　　`
    c17 <- t_temp$`30･31号館電力量 　　　　　　　　`
    c18 <- t_temp$`32号館電力量　　　　　　　　　　`
    c19 <- t_temp$`第一学生ﾎｰﾙ電力量 　　　　　　　`
    c20 <- t_temp$`図書館電力量　　　　　　　　　　`
    c21 <- t_temp$`図書館新館電力量　　　　　　　　`
    c22 <- t_temp$`21号館電力量　　　　　　　　　　`
    c23 <- t_temp$`22号館(東)電力量　　　　　　　　`
    c24 <- t_temp$`24号館(総合情報ｾﾝﾀｰ)電力量　　　`
    c25 <- t_temp$`23号館(ﾘｻｰﾁｾﾝﾀｰ)電力量　　　　　`
    c26 <- t_temp$`ﾒﾓﾘｱﾙﾎｰﾙ電力量　　　　　　　　　`
    c27 <- t_temp$`体育･文化ｾﾝﾀｰ電力量 　　　　　　`
    c28 <- t_temp$`5号館屋外電力量 　　　　　　　　`
    c29 <- t_temp$`図書館(空調)電力量　　　　　　　`
    c30 <- t_temp$`22号館(西)電力量　　　　　　　　`
    c31 <- t_temp$`25号館方面電力量　　　　　　　　`
    c32 <- t_temp$`ｸﾞﾗｳﾝﾄﾞ方面電力量 　　　　　　　`
    c33 <- t_temp$`70号館方面電力量　　　　　　　　`
    c34 <- t_temp$`50号館方面電力量　　　　　　　　`
    c35 <- t_temp$`50･51号館電力量 　　　　　　　　`
    c36 <- t_temp$`53号館(地上)電力量　　　　　　　`
    c37 <- t_temp$`52号館電力量　　　　　　　　　　`
    c38 <- t_temp$`ﾌﾛﾝﾃｨｱ研究棟電力量　　　　　　　`
    c39 <- t_temp$`高電圧実験室電力量　　　　　　　`
    c40 <- t_temp$`体育館電力量　　　　　　　　　　`
    c41 <- t_temp$`ｸﾞﾗｳﾝﾄﾞ電力量 　　　　　　　　　`
    c42 <- t_temp$`29号館(ｸﾗﾌﾞ･ｻｰｸﾙﾌﾟﾗｻﾞ)電力量　　`
    c43 <- t_temp$`ﾃﾆｽｺｰﾄ電力量　　　　　　　　　　`
    c44 <- t_temp$`53号館(屋上)電力量　　　　　　　`
    c45 <- t_temp$`超伝導実験棟電力量　　　　　　　`
    c46 <- t_temp$`72号館電力量　　　　　　　　　　`
    c47 <- t_temp$`体育館(空調)電力量　　　　　　　`
    c48 <- t_temp$`55号館電力量　　　　　　　　　　`
    c49 <- t_temp$`70･71号館電力量 　　　　　　　　`
    c50 <- t_temp$`武道体育館電力量　　　　　　　　`
    c51 <- t_temp$`25号館電力量　　　　　　　　　　`
    c52 <- t_temp$`14号館方面電力量　　　　　　　　`
    c53 <- t_temp$`その他電力量　　　　　　　　　　`
    c54 <- t_temp$`不言実行館電力量　　　　　　　　`
    c55 <- t_temp$`外気温度　　　　　　　　　　　　`
    c56 <- t_temp$`外気湿度　　　　　　　　　　　　`
    
    # この順に強制的に並べ替え
    t_temp2 <- cbind.data.frame(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,
                                c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,
                                c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,
                                c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,
                                c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,
                                c51,c52,c53,c54,c55,c56)
    # 一日ごとの日付時刻ラベル作成
    date_time <- paste0(date_lab, " ", hour_lab)
    
    x_temp <- t_temp2
    names(x_temp) <- init_colnames
    # n_tempの更新
    n_temp <- rbind(n_temp, x_temp)
    x_lab <- date_time
    # n_labの更新
    n_lab <- cbind(n_lab, x_lab)
  }
}


# forループ後の処理 --------------------------------------------------------------

# データ結合の判定
judge <- 
  if(i == length(file_names)) {
    print("結合成功")
  } else {
    print("結合失敗")
  }

# 文字列の余分な全角スペースの削除
cnames2 <- gsub("　", "", init_colnames, fixed = T)

# 列名の追加
names(n_temp) <- cnames2
# 型を数値型(numeric)に統一
y <- n_temp %>% mutate_if(is.character, as.numeric)

# ラベルと結合
label <- c(n_lab)
dataset <- cbind(label, y) %>% as_data_frame()

# 1時間間隔のデータに変換
# 外気温度と外気湿度を抜いたデータ
year2018_1 <- dataset %>% mutate(
  date_time = paste0(substr(label,1,14), "00:00")
) %>% 
  group_by(date_time) %>% 
  select(-c(label, 外気温度, 外気湿度)) %>% 
  summarise_each(funs(sum))
# 外気温度と湿度のデータ
year2018_2 <- dataset %>% mutate(
  date_time = paste0(substr(label,1,14), "00:00")
) %>% 
  group_by(date_time) %>% 
  select(date_time, 外気温度, 外気湿度) %>% 
  summarise_each(funs(mean))
# 2018年度のデータ
year2018 <- right_join(year2018_1, year2018_2)

# 統合ファイルの保存 ---------------------------------------------------------------

# save用のディレクトリ
save_dir <- paste0(user_dir, "\\Dropbox\\Yamaha-lab\\0_semi\\2019Temp\\5years data\\")
# UTF-8のcsvファイルとして保存
write_excel_csv(year2018, file.path(save_dir, "year2018.csv"))

