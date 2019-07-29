require 'rails_helper'
require 'support/controller_macros'

RSpec.describe Api::V1::UsersController, type: :controller do

  # let(:url) {'/api/v1/login'}
  # let(:params) {
  #   {api_v1_user: {
  #       email: "example@example.com",
  #       password: "changeme"}
  #   }
  # }
  # let(:auth_headers) {
  #   {'Authorization': response.headers['Authorization']}
  # }



  describe "GET #index" do
    login_admin

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it "should return list of users" do
      get 'index'
      expect(response).to JSON.parse(response.body)
    end
  end
end
