# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

- has_many :items

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item-name                           | string     | null: false       |
| item-info                           | string     | null: false       |
| seller                              | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :users
- has_many :oders

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| buy-item-info                       | string     | null: false       |
| item-payment                        | string     | null: false       |
| credit-card                         | string     | null: false       |
| item                                | references | foreign_key: true |

### Association

- belongs_to :items
- has_one :shipping_addresses

## shipping_addresses

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal-code                         | string     | null: false       |
| prefecture                          | string     | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| building                            | string     | null: false       |
| phone-number                        | string     | null: false       |
| order                               | references | foreign_key: true |

### Association

- has_one :oders