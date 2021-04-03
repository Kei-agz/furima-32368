#　テーブル設計

## users テーブル
| Column              | Type     | Options                       |
| nickname            | string   | null: false                   |
| email               | string   | null: false, uniqueness: true |
| encrypted_password  | string   | null: false                   |
| first_name          | string   | null: false                   |
| last_name           | string   | null: false                   |
| first_name_read     | string   | null: false                   |
| last_name_read      | string   | null: false                   |
| born                | date     | null: false                   |

- has_many : products
- belongs_to : buyers
- belongs_to : address


## products テーブル
| Column           | Type       | Options     |
| name             | string     | null: false |
| explanation      | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| delivery_fee_id  | integer    | null: false |
| delivery_day_id  | integer    | null: false |
| price_id         | integer    | null: false |
| sipping_area_id  | integer    | null: false |
| user             | references |             |
| buyer            | references |             |

- belongs_to : users
- belongs_to : buyers

## buyers テーブル
| Column           | Type       | Options     |
| user             | references |             |
| product          | references |             |

- belongs_to : users
- belongs_to : address

## address テーブル
| Column          | Type    | Options     |
| city            | string  | null: false |
| house_number    | integer | null: false |
| building_number | integer | null: false |
| postal_code     | integer | null: false |
| phone_number    | integer | null: false |

- belongs_to : users
- belongs_to : buyers
