# == Schema Information
#
# Table name: artworks
#
#  id               :bigint           not null, primary key
#  title            :string           not null
#  image_url        :string           not null
#  artist_id        :integer          not null
#  artist_favorite? :boolean          default(FALSE), not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id,
  message: "must be unique for an artist"}

    # t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
    
  has_many :comments,
  dependent: :destroy

  has_many :likes,
  foreign_key: :like_id,
  class_name: :Like

  has_many :collections,
    dependent: :destroy
end
