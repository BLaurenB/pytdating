class Personality < ApplicationRecord
  belongs_to :dater
  belongs_to :backer

  def self.avg
    binding.pry
  end

end
