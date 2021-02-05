# テーブル設計

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| mail            | string     | null: false                    |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birthday        | integer    | null: false                    |
| buy             | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_one :buyer

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| state            | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer

## buyers テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| card_information   | integer      | null: false                    |
| card_expiration    | integer      | null: false                    |
| card_security_code | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer