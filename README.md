# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth              | date                | null: false               |

### Association

- has_many :items
- has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item_name                           | string     | null: false       |
| item_info                           | string     | null: false       |
| item_category_id                    | integer    | null: false       |
| item_sales_status_id                | integer    | null: false       |
| item_detail_id                      | integer    | null: false       |
| item_shipping_fee_status_id         | integer    | null: false       |
| item_prefecture_id                  | integer    | null: false       |
| item_price                          | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| item                                | references | foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping_address
- belongs_to :user

## shipping_addresses

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| item_prefecture_id                  | integer    | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| building                            | string     |                   |
| phone_number                        | string     | null: false       |
| order                               | references | foreign_key: true |

### Association

- belongs_to :order