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

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|password|string|null: false|
|email|string|null: false|
|profile|text||
|image|string||

### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :reviews
- has_many :messages
- has_many :orders
- has_one :card
- has_one :address
- has_one :telepone

## addresses

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||


### Association
- belongs_to :user

## cards

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user

## items

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|text|text|null: false|
|condition|string|null: false|
|price|string|null: false|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|fee_burden|string|null: false|
|service|string|null: false|
|area|string|null: false|
|handling_time|string|null: false|
|size_id|references|foreign_key: true|

### Association
- belongs_to :size
- belongs_to :brand
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :likes
- has_many :comments
- has_many :reviews
- has_many :messages
- has_one :order

## categories

|Column|Type|Options|
|------|----|-------|
|path|integer|null: false|
|name|string|null: false|

### Association
- has_many :items

## images

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item

## telepones

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|tel|string|null: false|

### Association
- belongs_to :user


* ---以下は見作成のテーブルです---

## comments

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## brands

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## sizes

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## likes

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## reviews

|Column|Type|Options|
|------|----|-------|
|rate|integer||
|text|text||
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## messages

|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## orders

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

