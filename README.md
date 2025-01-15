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
| time_of_day  | integer   | null: false              | 歯磨きしたトータルの記録
| icon_type    | varchar   | null: false              | 三段階評価のアイコン
### Association
- belongs_to :kid

# シャカシャカにっき

## アプリケーション概要  
子供向けに作った歯磨きを習慣づけるためのアプリです。  

### URL  
[シャカシャカにっき](https://hamigaki.onrender.com)  

### テスト用アカウント  
- **ID**: admin  
- **Pass**: 2222  

### 利用方法  
1. ログイン後、三つのウイルスアイコンが表示されます。  
2. 朝昼晩の歯磨き記録をつけることを目標とします。  
3. 記録を残すと、ウイルスアイコンがスターアイコンに切り替わります。  

---

## アプリケーションを作成した背景  
前職で歯科衛生士として勤務していた際、家庭によっては歯磨き習慣がない子供が多いことを実感しました。この経験をもとに、子供たちが楽しく歯磨きを習慣づけられるアプリを作成しました。  

---

## 実装した機能  
- **歯磨き記録の可視化**: ウイルスアイコンからスターアイコンに変わるアニメーション。  
- **ユーザー体験を意識したデザイン**: 明るいカラーリングと子供向けのフォントを採用。  

### 実装の様子  
- [歯磨き記録の実装GIF①](https://gyazo.com/3f9f826bbfbc73d27cab9b380051d609)  
- [歯磨き記録の実装GIF②](https://gyazo.com/ac3997b653a8076b595a5f18f4d1f448)  

---

## 実装予定の機能  
- **非同期通信**: 記録の保存やアイコン切り替えをよりスムーズに動作させたい。  
- **デザインのバリエーション追加**: 複数のフォームデザインを用意し、子供が飽きないように工夫したい。  

---

## データベース設計  
https://gyazo.com/e66d2b73ca12b4d47b18fc7f5cdef326

---

## 開発環境  
- **使用言語**: Ruby, JavaScript  
- **デプロイ先**: Render  

---

## ローカルでの動作方法  
以下のコマンドを実行してください:  
```bash
git clone https://github.com/rails/rails.git
cd hamigaki
bundle install
rails db:create db:migrate
rails s



