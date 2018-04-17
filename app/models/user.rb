class User < ApplicationRecord
  attr_accessor :image
  mount_uploader :image, ImageUploader,

 :mount_on => :image
  has_many :daters
  has_many :backers
  has_many :dater_backers, through: :daters
  has_many :dater_backers, through: :backers
  has_one :mate_preference
  has_many :images

  acts_as_messageable

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.auth_name = auth.info.name
      user.f_name = auth.info.first_name
      user.l_name = auth.info.last_name
      user.email = auth.info.email
      user.remote_image_url =  "https://s3.amazonaws.com/pytdating/p3.jpeg"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!

      dater = Dater.find_or_create_by(user_id: user.id, f_name: user.f_name, l_name: user.l_name, image_1: user.remote_image_url)
      backer = Backer.find_or_create_by(user_id: user.id, f_name: user.f_name, l_name: user.l_name, image_1: user.remote_image_url)
      MatePreference.find_or_create_by(dater_id: user.id)
      Trait.find_or_create_by(dater_id: user.id)
      db = DaterBacker.create(dater_id: dater.id, backer_id: backer.id)
      Personality.create(dater_backer_id: db.id)

    end
  end

  def mailboxer_email(object)
    return email
  end


end
