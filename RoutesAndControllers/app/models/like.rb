# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  like_type  :string           not null
#  like_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  validates :like_type, presence: true
  validates :like_id, presence: true
  validates :user_id, presence: true
  validate :like_type_word

  validates :like_id, uniqueness: { scope: [:user_id, :like_type],
  message: "cannot like the same thing twice"}

  def like_type_word
    types = ["artwork", "comment"]
    unless types.include?(self.like_type)
      errors[:like_type] << "must like either a comment or artwork"
    end 
  end 

belongs_to :artwork,
  foreign_key: :like_id,
  class_name: :Artwork,
  optional: true 

belongs_to :comment,
  foreign_key: :like_id,
  class_name: :Comment,
  optional: true

belongs_to :user,
  foreign_key: :user_id,
  class_name: :User


end

#Like.create!(user_id: 1, like_id: 1, like_type: "artwork")