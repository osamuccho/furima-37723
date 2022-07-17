
# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------       | -----------                    |
| name               | string       | null: false                    |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false                    |
| first_name         | string       | null: false                    |
|family_name         | string       | null: false                    |
|first_name_kana     | string       | null: false                    |
|family_name_kana    | string       | null: false                    |
| birthday           | date         | null: false                    |

has_many :items
has_many :purchase_histories



## purchase_historiesテーブル

| Column     | Type      | Options     |
| -------    | --------- | ----------- |
|  user   | references| null: false, foreign_key: true |
|  item   | references| null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :sending_destination



## items テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| item_name          | string     | null: false |
| introduction       | text       | null: false |
| price              | integer    | null: false |
| delivery_days_id   | integer    | null: false | 
| item_condition_id  | integer    | null: false |
| postage_payer_id   | integer    | null: false |
| prefecture_code_id | integer    | null: false |
| category_id        | integer    | null: false |
| user               | references | null: false,foreign_key: true |

 belongs_to :user
 has_one :purchase_history





## sending_destinations テーブル

| Column                      | Type         | Options                        |
| ------                      | ----------   | ------------------------------ |
| post_code                   | string       | null: false                    |
| prefecture_code_id          | integer      | null: false                    |
| city                        | string       | null: false                    |
| house_number                | string       | null: false                    |
| building_name               | string       |                                |
| phone_number                | string       | null: false                    |
| purchase_history            | references   |  null: false,foreign_key: true |

 belongs_to :purchase_history







