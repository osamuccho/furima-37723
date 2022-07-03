
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
has_one :sending_destination, dependent: :destroy



## purchase_historyテーブル

| Column     | Type      | Options     |
| -------    | --------- | ----------- |
|  user_id   | references| null: false, foreign_key: true |
|  item_id   | references| null: false, foreign_key: true |

belongs_to :user
belongs_to :item



## items テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| item_name          | string     | null: false |
| introduction       | text       | null: false |
| price              | integer    | null: false |
| brand_id           | text       | null: false |
| items_condition_id | integer    | null: false |
| postage_payer_id   | integer    | null: false |
| prefecture_code_id | integer    | null: false |
| category_id        | integer    | null: false |
| user               | references | null: false,foreign_key: true |

 belongs_to :user





## sending_destinations テーブル

| Column                      | Type         | Options                        |
| ------                      | ----------   | ------------------------------ |
| post_code                   | string       | null: false                   |
| prefecture_code_id          | integer      | null: false                    |
| city                        | string       | null: false                    |
| house_number                | string       | null: false                    |
| building_name               | string       |                                |
| phone_number                | string       | unique: true                   |

 belongs_to: user







