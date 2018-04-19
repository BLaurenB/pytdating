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
    Trait.find_by_sql(["SELECT traits.* FROM traits INNER JOIN  daters ON traits.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def personalities_complete?(current_dater_id)
    Personality.find_by_sql(["SELECT personalities.* FROM personalities INNER JOIN  dater_backers ON personalities.dater_backer_id = dater_backers.id INNER JOIN  daters ON dater_backers.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def mate_preferences_complete?(current_dater_id)
    MatePreference.find_by_sql(["SELECT mate_preferences.* FROM mate_preferences INNER JOIN  daters ON mate_preferences.dater_id = ?", current_dater_id]).any? {|t| t != nil}
  end

  def dater_images(current_user_id)  # current USER!!!!
    Image.where(subject: current_user_id)
  end

  def avg_personality(id, trait)
    return 0 if Personality.joins(:dater_backer).where("dater_backers.dater_id = #{id}").average("#{trait}") == nil
    Personality.joins(:dater_backer).where("dater_backers.dater_id = #{id}").average("#{trait}").round(1)
  end

end
