#　テーブル設計

## users テーブル
| Column              | Type     | Options                   |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| first_name          | string   | null: false               |
| last_name           | string   | null: false               |
| first_name_read     | string   | null: false               |
| last_name_read      | string   | null: false               |
| born                | date     | null: false               |

- has_many : products
- has_one : buyer


## products テーブル
| Column           | Type       | Options           |
| name             | string     | null: false       |
| explanation      | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| delivery_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| sipping_area_id  | integer    | null: false       |
| user             | references | foreign_key: true |

- belongs_to : user
- has_one : buyer

## buyers テーブル
| Column           | Type       | Options           |
| user             | references | foreign_key: true |
| product          | references | foreign_key: true |

- belongs_to : user
- belongs_to : product

## address テーブル
| Column          | Type    | Options     |
| prefecture_id   | integer | null: false |
| city            | string  | null: false |
| house_number    | integer | null: false |
| building_number | integer |             |
| postal_code     | string  | null: false |
| phone_number    | string  | null: false |

