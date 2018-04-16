require 'rails_helper'

describe "As an authenticated User" do
  describe "when I sign in I see my dashboard with my User Details" do
    let (:user) { create(:user) }
    let (:dater) { create(:dater, user: user) }
    let (:backer) { create(:backer, user: user) }

    it "I see my Auth name, first and last names, and email address" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
      allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)

      visit '/dashboard'

      expect(page).to have_content(user.f_name)
      expect(page).to have_content(user.l_name)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.image)
    end

    it "I see links to start my Dater and Backer Profiles" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
      allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)

      visit '/dashboard'
      click_link "Dater"
      expect(current_path).to eq("/daters/#{user.id}/edit")

      visit '/dashboard'
      click_link "Backer"
      expect(current_path).to eq("/backers/#{user.id}/edit")
    end
  end


end
