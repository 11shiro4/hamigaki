# DB 設計

## Kids table
| Column       | Type      | Options                   | Description |
|--------------|-----------|---------------------------|-------------|
| nickname     | string    | null: false               | ニックネーム
| age          | integer   | null: false               | 年齢

### Association
* has_many :brushing_logs, foreign_key: "kid_nickname"
* has_many :kids_bacteria, foreign_key: "kid_nickname"


## BrushingLogs table
| Column       | Type      | Options                  | Description |
|--------------|-----------|--------------------------|-------------|
| id           | integer   | null: false, primary key | ログID（自動生成）
| kid_nickname | string    | null: false, foreign key | 子供ニックネーム（Kidsテーブルの外部キー）
| date         | date      | null: false              | 日付
| time_of_day  | integer   | null: false              | 歯磨きの時間帯
| brushed_at   | datetime  | null: false              | 記録をつけた時間
| icon_type    | varchar   | null: false              | 三段階評価のアイコン
### Association
- belongs_to :kid, class_name: "Kids", foreign_key: "kid_nickname"



