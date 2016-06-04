require "rails_helper"

RSpec.describe ShiftsController do
  describe "GET index" do
    it "should get index" do
      get :index
      expect(response).to be_success
    end
  end
end