# DB 設計

## Kids table
| Column       | Type      | Options                   | Description |
|--------------|-----------|---------------------------|-------------|
| nickname     | string    | null: false               | ニックネーム
| age          | integer   | null: false               | 年齢

### Association
* has_many :brushing_logs


## BrushingLogs table
| Column       | Type      | Options                  | Description |
|--------------|-----------|--------------------------|-------------|
| id           | integer   | null: false, primary key | ログID（自動生成）
| kid_nickname | string    | null: false, foreign key | 子供ニックネーム
| date         | date      | null: false              | 日付
| brushed_at   | datetime  | null: false              | 記録をつけた時間
| time_of_day  | integer   | null: false              | 歯磨きしたトータルの記録
| icon_type    | varchar   | null: false              | 三段階評価のアイコン
### Association
- belongs_to :kid



