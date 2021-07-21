class Recruitment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :sport, presence: true
  validates :event_date, presence: true
  validates :due_date, presence: true
  validates :prefecture, presence: true
  validates :place, presence: true
  validates :recruit_number, presence: true
  validates :level, presence: true
  validates :body, presence: true

  enum sport:{
    "---":0,
    野球:1,サッカー:2,フットサル:3,バレーボール:4,バスケットボール:5,テニス:6,卓球:7,陸上競技:8,水泳:9,バドミントン:10,
    ラグビー:11,ドッジボール:12,フィギュアスケート:13,ボクシング:14,ゴルフ:15,アイスホッケー:16,相撲:17,キックボクシング:18,サーフィン:19,馬術:20,
    ボウリング:21,スノーボード:22,スキー:23,剣道:24,新体操:25,クライミング:26,空手:27,アメリカンフットボール:28,ソフトボール:29,マラソン:30
  }, _prefix: true

  enum prefecture:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }, _prefix: true

  enum level:{
    "---":0,
    初級:1,初級～中級:2,中級:3,中級～上級:4,上級:5,どなたでも歓迎！:6
  }, _prefix: true
end
