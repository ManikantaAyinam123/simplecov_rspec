class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  # def self.ransackable_associations(auth_object = nil)
  #   ["articles"]
  # end
  # def self.ransackable_attributes(auth_object = nil)
  #   ["content", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  # end

end
