# assignment_190614
## Shinyツールチームへの6月11日（金）までの課題
shinyチームに配属されたメンバーは、*combineData_example.R*とその解説書*commentary_doc.pdf*を参考にして、**year2018_ブランチ名.csv**を出力して保存するR Scriptファイルを作成してください。
期限は、**6月11日(火）の午後9時まで**とします。

**year2018.csv**の仕様を以下に示します。
- 1列目に時刻日付ラベル（format=“%Y-%m-%d %H:%M:%S”, tz=“UTC”)、2列目以降は数値(numeric)型のデータが格納されたdata.frame
- 行（下）方向に時が進む時系列データであり、時間間隔は1時間とする
- 文字符号化形式UTF-8のcsvファイル

## csvファイルの出力について
例えば、倉田君であれば`Kurata`ブランチに`year2018_Kurata.csv`というファイル名(`year2018.csv`というファイル名にしないこと！）で、`Kurata`ブランチにcsvファイルを保存し、各自のブランチでcommit&push(`master`ブランチでしないこと！）してください。
