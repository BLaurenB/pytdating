class DaterBacker < ApplicationRecord
  belongs_to :backer
  belongs_to :dater

  has_many :comments
  has_many :backer_evals
  has_many :personalities

  validates_presence_of :dater_id
  validates_presence_of :backer_id

end
