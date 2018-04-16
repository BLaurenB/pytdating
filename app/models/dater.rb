class Dater < ApplicationRecord
  belongs_to :user
  has_many :dater_backers
  has_many :backers, through: :dater_backers
  has_many :matches
  has_many :comments
  has_many :personalities, through: :dater_backers

  has_one :trait
  has_many :backer_evals
  has_one :mate_preference

  def pool
    matches.map do |match|
        Dater.where(id: match.match_id)
    end
  end

  def traits_complete?
    Trait.find_by_sql("select traits.* from traits inner join daters on traits.dater_id = daters.id").any? {|t| t != nil}
  end

  def personalities_complete?
    Personality.find_by_sql("select personalities.* from personalities inner join dater_backers on personalities.dater_backer_id = dater_backers.id inner join daters on dater_backers.dater_id = daters.id").any? {|t| t != nil}
  end

  def mate_preferences_complete?
    MatePreference.find_by_sql("select mate_preferences.* from mate_preferences inner join daters on mate_preferences.dater_id = daters.id").any? {|t| t != nil}
  end


end


Personality.find_by_sql("select personalities.* from personalities inner join dater_backers on personalities.dater_backer_id = dater_backers.id inner join daters on dater_backers.dater_id = daters.id")
