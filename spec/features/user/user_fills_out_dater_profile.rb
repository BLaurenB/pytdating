require 'rails_helper'
describe "As an authenticated User" do

  describe "When I visit my Dater profile for the first time" do

    let (:user) { create(:user) }
    let (:dater) { create(:dater, user: user) }
    let (:backer) { create(:backer, user: user) }

    it "I can add new images" do

    end

    it "I can add new backers" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
        allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)


    end

    it "I can fill in my physical and lifestyle data" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
        allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)


    end

    it "I can fill in my personality traits" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
        allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)


    end

    it "I can fill in my mate preferences" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(ApplicationController).to receive(:current_dater).and_return(dater)
        allow_any_instance_of(ApplicationController).to receive(:current_backer).and_return(backer)


    end

end
