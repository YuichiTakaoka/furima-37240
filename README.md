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
| price              | integer    | null: false                    |
| item_name          | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivary_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| derivary_day_id    | integer    | null: false                    |

### Association

belongs_to: user

has_one: order


## order　テーブル
| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | referrences| null: false, foreign_key: true |

### Association

belongs_to: user
berongs_to: item



##　addressテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| postal_cord        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| lot_number         | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |


### Association

belongs_to: order


