
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |

has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_one :profile, dependent: :destroy
has_one :sending_destination, dependent: :destroy
has_one :credit_card, dependent: :destroy



## comments テーブル

| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| content | text      | null: false                    |
| user    | references| null: false, foreign_key: true |
|  item   | references| null: false, foreign_key: true |

belongs_to :user
belongs_to :item



## profiles テーブル

| Column          | Type         | Options                        |
| ------          | ----------   | ------------------------------ |
| first_name      | string       | null: false                    |
|family_name      | string       | null: false                    |
|first_name_kana  | string       | null: false                    |
|family_name_kana | string       | null: false                    |
| birthday        | date         | null: false                    |
| user_id         | references   | null: false, foreign_key: true |

belongs_to :user


## items テーブル

| Column          | Type       | Options                        |
| ------          | ---------- | ------------------------------ |
| name            | string     | null: false |
| introduction    | text       | null: false |
| price           | integer    | null: false |
| brand           | text       | null: false |
| items_condition | integer    | null: false |
| postage_payer   | integer    | null: false |
| prefecture_code | references | null: false,foreign_key: true |
| category        | references | null: false,foreign_key: true |
| seller          | references | null: false,foreign_key: true |
| buyer           | references | null: false,foreign_key: true |
 
 has_many :comments, dependent: :destroy
 has_many :item_imgs, dependent: :destroy
 belongs_to :category
 belongs_to :user


## credit_card テーブル

| Column      | Type         | Options                        |
| ------      | ----------   | ------------------------------ |
| user_id     | integer      | null: false                    |
| card_id     | string       | null: false                    |
|customer_id  | string       | null: false                    |

belongs_to: user


## sending_destinations テーブル

| Column                      | Type         | Options                        |
| ------                      | ----------   | ------------------------------ |
|destination_first_name       | string       | null: false                    |
|destination_family_name      | string       | null: false                    |
|destination_first_name_kana  | string       | null: false                    |
|destination_family_name_kana | string       | null: false                    |
| post_code                   | integer(7)   | null: false                    |
| prefecture_code             | integer      | null: false                    |
| city                        | string       | null: false                    |
| house_number                | string       | null: false                    |
| building_name               | string       |                                |
| user_id                     |  references  | null: false, foreign_key: true |
 phone_number                 | integer      | unique: true                   |

 belongs_to: user





## categories テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| name            | string     | null: false |
| ancestry        | string     | null: false |

has_many :items


## item_imgs テーブル

| Column   | Type         | Options                        |
| ------   | ----------   | ------------------------------ |
| url      | string       | null: false                    |
| item     | references   | null: false,foreign_key: true  |

belongs_to :item
