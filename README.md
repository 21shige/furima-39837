## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
|------------------|------------| -------------------------------|
| title            | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| coat_burden_id   | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_many   :comments
- has_one    :buy
- belongs_to :user



## buys テーブル

| Column | Type       | Options                        |
|--------|----------- | -------------------------------|
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- has_one    :address
- belongs_to :item
- belongs_to :user


## addresses テーブル

| Column         | Type       | Options                        |
|----------------|------------| -------------------------------|
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| tell           | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to :buy


## comments テーブル

| Column  | Type       | Options                        |
|---------|----------- | -------------------------------|
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |   

### Association
- belongs_to :user
- belongs_to :item