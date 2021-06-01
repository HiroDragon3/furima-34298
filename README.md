# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| name-kana          | string              | null: false             |
| birth              | string              | null: false             |

### Association

- has_many :items
- has_many :oders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item-image                          | string     | null: false       |
| item-name                           | string     | null: false       |
| item-info                           | string     | null: false       |
| item-category                       | string     | null: false       |
| item-sales-status                   | string     | null: false       |
| item-detail                         | string     | null: false       |
| item-shipping-fee-status            | string     | null: false       |
| item-prefecture                     | string     | null: false       |
| sell-price                          | string     | null: false       |
| item-price                          | string     | null: false       |
| add-tax-price                       | string     | null: false       |
| profit                              | string     | null: false       |
| item-scheduled-delivery             | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :oder

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
| postal-code                         | string     | null: false       |
| prefecture                          | string     | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| building                            | string     |                   |
| phone-number                        | string     | null: false       |
| order                               | references | foreign_key: true |

### Association

- belongs_to :oder