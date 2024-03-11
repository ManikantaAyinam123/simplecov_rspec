class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true
  
      # def self.ransackable_attributes(auth_object = nil)
      #   ["created_at", "email", "id", "id_value", "name", "updated_at"]
      # end
      # def self.ransackable_associations(auth_object = nil)
      #   ["articles"]
      # end
     
end
