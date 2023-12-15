## users テーブル

| Column         | Type   | Options                   |
|----------------|--------| --------------------------|
| nickname       | string | null: false               |
| email          | string | null: false, unique: true |
| password       | string | null: false               |
| last name      | string | null: false               |
| first name     | string | null: false               |
| lase name kana | string | null: false               |
| firs name kana | string | null: false               |
| birthday       | Data   | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :buy

## items テーブル

| Column          | Type       | Options                        |
|-----------------|------------| -------------------------------|
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| coat_burden     | string     | null: false                    |
| origin_location | string     | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user
- has_one    :buy


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
| state          | string     | null: false                    |
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