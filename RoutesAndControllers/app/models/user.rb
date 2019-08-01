# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ApplicationRecord
  validates :username, presence: true 


  has_many :artwork_views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_views,
    source: :artwork,
    dependent: :destroy

  has_many :comments,
  dependent: :destroy

  has_many :likes,
  foreign_key: :user_id,
  class_name: :Like

  has_many :collections,
    dependent: :destroy
end
