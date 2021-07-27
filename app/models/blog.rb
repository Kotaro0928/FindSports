class Blog < ApplicationRecord
  has_many :blog_comments, dependent: :destroy
  has_many :blog_likes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :sport, presence: true
  validates :body, presence: true

 enum sport:{
    "---":0,
    野球:1,サッカー:2,フットサル:3,バレーボール:4,バスケットボール:5,テニス:6,卓球:7,陸上競技:8,水泳:9,バドミントン:10,
    ラグビー:11,ドッジボール:12,フィギュアスケート:13,ボクシング:14,ゴルフ:15,アイスホッケー:16,相撲:17,キックボクシング:18,サーフィン:19,馬術:20,
    ボウリング:21,スノーボード:22,スキー:23,剣道:24,新体操:25,クライミング:26,空手:27,アメリカンフットボール:28,ソフトボール:29,マラソン:30,
    スケートボード:31,その他:32
  }, _prefix: true

  def liked_by?(user)
    blog_likes.where(user_id: user.id).exists?
  end
end
