# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## userテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|nickname|text|null: false|
|email|text|null: false , unique: true|
|password|text|null: false|
### Association
- has_many :user_groups, through: :groups
- has_many :posts


## groupテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false , unique: true|
### Association
- has_many :user_groups, through: :users
- has_many :posts


## user_groupテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false , foreign_key: true|
|group_id|integer|null: false , foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group


## postテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|message|text||
|image|string||
|user_id|integer|null: false|
|group_id|integer|null: false|
|timestamp|timestamp|null: false|
### Association
- belongs_to :user
- belongs_to :group



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
