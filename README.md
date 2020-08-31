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
| date             | date    | nul: false |

### Association
- has_many :items
- has_many :managements

## items テーブル

| Column           | Type       | Options    |
| ---------------- | ---------- | ---------- |
| image            | string     | nul: false |
| name             | string     | nul: false |
| comment          | text       | nul: false |
| category         | integer    | nul: false |
| status           | integer    | nul: false |
| delivery_fee     | integer    | nul: false |
| shipping_origin  | integer    | nul: false |
| shipping_days    | integer    | nul: false |
| price            | integer    | nul: false |

### Association
- belongs_to :user
- has_one :management

## managements テーブル

| Column  | Type | Options                             |
| ------- | ---- | ----------------------------------- |
| user    | references | nul: false, foreign_key: true |
| item    | references | nul: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | nul: false                    |
| prefecture    | integer    | nul: false                    |
| city          | string     | nul: false                    |
| house_number  | string     | nul: false                    |
| building_name | string     |                               |
| phone_number  | string     | nul: false                    |
| management    | references | nul: false, foreign_key: true |

### Association
- belongs_to :management