# テーブル設計

## users テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| email              | string      | null: false, unique: true |
| password           | string      | null: false |
| family_name        | string      | null: false |
| first_name         | string      | null: false |
| family_name_kana   | string      | null: false |
| first_name_kana    | string      | null: false |
| birthday           | integer     | null: false |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| name               | string        | null: false                    |
| description        | text          | null: false                    |
| category           | integer       | null: false                    |
| condition          | integer       | null: false                    |
| shipping_payer     | integer       | null: false                    |
| prefecture         | integer       | null: false                    |
| shipping_duration  | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchases



##  purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address1    | string     | null: false                    |
| address2    | string     |                                |
| telephone   | string     | null: false                    |
| purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
