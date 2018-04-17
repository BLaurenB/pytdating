class Backer < ApplicationRecord
  belongs_to :user
  has_many :dater_backers
  has_many :daters, through: :dater_backers
  has_many :comments
  has_many :backer_evals
  has_many :personalities



end
