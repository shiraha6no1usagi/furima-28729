# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## users テーブル

| Column           | Type    | Options    |
| ---------------- | ------- | ---------- |
| nickname         | string  | nul: false |
| emale            | string  | nul: false |
| password         | string  | nul: false |
| family_name      | string  | nul: false |
| name             | string  | nul: false |
| family_name_read | string  | nul: false |
| name_read        | string  | nul: false |
| ad               | integer | nul: false |
| month            | integer | nul: false |
| day              | integer | nul: false |

### Association
- has_many :items_sell
- has_one :items_buy
- has_one :shipping_address

## items_sell テーブル

| Column           | Type       | Options    |
| ---------------- | ---------- | ---------- |
| image            | string     | nul: false |
| item_name        | string     | nul: false |
| comment          | text       | nul: false |
| category         | integer    | nul: false |
| item_status      | integer    | nul: false |
| delivery_fee     | integer    | nul: false |
| shipping_origin  | integer    | nul: false |
| shipping_days    | integer    | nul: false |
| price            | integer    | nul: false |
| sales_commission | integer    | nul: false |
| sales_profit     | integer    | nul: false |

### Association
- belongs_to :users

## items_buy テーブル

| Column  | Type | Options                             |
| ------- | ---- | ----------------------------------- |
| price   | integer    | nul: false                    |
| user_id | references | nul: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | nul: false                    |
| prefecture    | integer    | nul: false                    |
| city          | string     | nul: false                    |
| house_number  | string     | nul: false                    |
| building_name | string     |                               |
| phone_number  | integer    | nul: false                    |
| user_id       | references | nul: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items_buy