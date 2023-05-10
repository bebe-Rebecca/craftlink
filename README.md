# アプリケーション名

craftlink

# アプリケーション概要

後継者を求める職人の方が仕事内容を投稿し、仕事に興味を持った人が質問をすることができる。

## URL

## テスト用アカウント

# 利用方法

## 仕事内容投稿

1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う

2.後継者を求める側は投稿ボタンから仕事内容（職種名、店舗名 or 工房名、仕事内容について、地域、画像）を入力し投稿する

## 質問投稿・回答

1.気になる仕事がある場合、記事の詳細ページにある質問投稿ボタンから質問することができる

2.質問した内容はマイページより確認できる

3.記事投稿者は質問があった場合、質問詳細ページにある回答フォームから回答を送信できる

# アプリケーションを作成した背景

以前より伝統工芸などの職人の方の後継者がなかなか見つからないという問題があります。
しかし、後継者が見つからないという問題よりも先にそもそも世の中にはどういった仕事がありどのような仕事内容なのか知る人が少ないのではと考えました。
そこでまずは簡単に仕事内容について知ることができる場があればいいのではと思い今回アプリを作成しました。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1IkkA2ZGR_daa-8xs5zKlKFpXK_cVxb0ZPOp_D2gPTNA/edit#gid=982722306

# 実装した機能についての画像や GIF およびその説明

# 実装予定の機能

- ユーザー管理（実装中）
- 職種内容管理（実装中）
- 検索機能（実装中）
- 問い合わせ管理（実装中）
- お気に入り管理（実装中）

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/c04e111ba333ad90dce962688ab3699f.png)](https://gyazo.com/c04e111ba333ad90dce962688ab3699f)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/a01c480debd448c410a7e9c47c557fda.png)](https://gyazo.com/a01c480debd448c410a7e9c47c557fda)

# 開発環境

- フロントエンド
- バックエンド
- タスク管理
- テキストエディタ
- Ruby

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string |                           |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :jobs
- has_many :questions
- has_many :favorites, through: :favorite_users

## jobs テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| job_title               | string     | null: false                    |
| workshop_name           | string     | null: false                    |
| description             | text       | null: false                    |
| origin_to_prefecture_id | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :questions
- has_many :favorites

## favorite_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| favorite | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :favorite

## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| job    | references | null: false, foreign_key: true |

### Association

- belongs_to :job
- has_many :users, through: :favorite_users

## questions テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| job     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job
- has_one :answer

## answers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| content  | text       | null: false                    |
| question | references | null: false, foreign_key: true |

### Association

- belongs_to :question
