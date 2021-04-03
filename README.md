#　テーブル設計

## users テーブル
| Column    | Type     | Options     |
| nickname  | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |
| name      | string   | null: false |
| name_read | string   | null: false |
| born      | datetime | null: false |

## products テーブル
| Column        | Type       | Options     |
| product_name  | string     | null: false |
| explanation   | text       | null: false |
| category      | string     | null: false |
| status        | string     | null: false |
| delivery_fee  | integer    | null: false |
| delivery_days | integer    | null: false |
| price         | integer    | null: false |
| user          | references |             |

## buyers テーブル
| Column           | Type       | Options     |
| user             | references |             |
| card_information | integer    | null: false |
| available_limit  | datetime   | null: false |