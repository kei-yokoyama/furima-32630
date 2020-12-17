# テーブル設計

## users テーブル

| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| email            | string      | null: false |
| password         | string      | null: false |
| familyName       | string      | null: false |
| firstName        | string      | null: false |
| familyNameKana   | string      | null: false |
| firstNameKana    | string      | null: false |
| birthday         | integer     | null: false |


### Association

- has_many :items
- has_many :purchases
- has_many :addresses



## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| name             | string        | null: false                    |
| image            | text          | null: false                    |
| description      | text          | null: false                    |
| category         | string        | null: false                    |
| condition        | string        | null: false                    |
| shippingPayer    | string        | null: false                    |
| shippingFromArea | string        | null: false                    |
| shippingDuration | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |


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
- belongs_to :address


## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postalCode | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| telephone  | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
| purchase   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :purchases
