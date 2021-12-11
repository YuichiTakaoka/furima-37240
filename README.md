##　usersテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday_year      | date       | null: false                    |

### Association
has_many: items
has_many: orders



## itemテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_concept       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivary_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| derivary_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to: user

has_one: order


## order　テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |

### Association

belongs_to: user
belongs_to: item
belongs_to: address





##　addressテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| postal_cord        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| lot_number         | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

belongs_to: order


