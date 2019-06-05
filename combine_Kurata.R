# 外部パッケージの読み込み ------------------------------------------------------------

library(tidyverse)

# ディレクトリの設定 ---------------------------------------------------------------
# 各PCのアカウント名の取得
user_dir <- Sys.getenv("USERPROFILE")
# ワーキングディレクトリ
work_dir <- paste0(user_dir, "\\Dropbox\\Yamaha-lab\\0_semi\\2019Temp\\data_2018\\")
# ファイル名の取得
file_names <- dir(work_dir)
