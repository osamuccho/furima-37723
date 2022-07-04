
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

has_many :items, dependent: :destroy
has_many :purchase_history, dependent: :destroy



## purchase_historyテーブル

| Column     | Type      | Options     |
| -------    | --------- | ----------- |
|  user   | references| null: false, foreign_key: true |
|  item   | references| null: false, foreign_key: true |

belongs_to :user
has_one :sending_destination, dependent: :destroy



## items テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| item_name_id       | integer    | null: false |
| introduction_id    | integer    | null: false |
| price_id           | integer    | null: false |
| brand_id           | integer    | null: false |
| item_condition_id  | integer    | null: false |
| postage_payer_id   | integer    | null: false |
| prefecture_code_id | integer    | null: false |
| category_id        | integer    | null: false |
| user               | references | null: false,foreign_key: true |

 belongs_to :user
 has_one :purchase_history, dependent: :destroy





## sending_destinations テーブル

| Column                      | Type         | Options                        |
| ------                      | ----------   | ------------------------------ |
| post_code                   | string       | null: false                   |
| prefecture_code_id          | integer      | null: false                    |
| city                        | string       | null: false                    |
| house_number                | string       | null: false                    |
| building_name               | string       |                                |
| phone_number                | string       | unique: true                   |

 belongs_to :purchase_history, dependent: :destroy







