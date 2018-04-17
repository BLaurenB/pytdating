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

  def non_self_backers(dater)
    DaterBacker.where(dater_id: dater.id).where.not(backer_id: dater.id)
  end

  def traits_complete?(current_dater_id)
    Trait.find_by_sql(["select traits.* from traits inner join daters on traits.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def personalities_complete?(current_dater_id)
    Personality.find_by_sql(["select personalities.* from personalities inner join dater_backers on personalities.dater_backer_id = dater_backers.id inner join daters on dater_backers.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def mate_preferences_complete?(current_dater_id)
    MatePreference.find_by_sql(["select mate_preferences.* from mate_preferences inner join daters on mate_preferences.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def dater_images(current_user_id)  # current USER!!!!
    Image.where(subject: current_user_id)
  end


end


Personality.find_by_sql("select personalities.* from personalities inner join dater_backers on personalities.dater_backer_id = dater_backers.id inner join daters on dater_backers.dater_id = daters.id")
