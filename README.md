# テーブル設計

## users テーブル

| Column             | Type        | Options     |
| ------------------ | ----------- | ----------- |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false |
| nickname           | string      | null: false |
| family_name        | string      | null: false |
| first_name         | string      | null: false |
| family_name_kana   | string      | null: false |
| first_name_kana    | string      | null: false |
| birthday           | date        | null: false |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column                | Type          | Options                        |
| --------------------- | ------------- | ------------------------------ |
| name                  | string        | null: false                    |
| description           | text          | null: false                    |
| category_id           | integer       | null: false                    |
| condition_id          | integer       | null: false                    |
| shipping_payer_id     | integer       | null: false                    |
| prefecture_id         | integer       | null: false                    |
| shipping_duration_id  | integer       | null: false                    |
| user                  | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase



##  purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     |                                |
| telephone     | string     | null: false                    |

### Association

- has_one :purchase
