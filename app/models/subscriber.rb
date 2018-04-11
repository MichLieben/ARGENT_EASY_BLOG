class Subscriber < ApplicationRecord
  validates :firstname, :name, :email, presence: true
end
