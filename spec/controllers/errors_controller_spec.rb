require 'spec_helper'

describe ErrorsController do

  describe "GET 'internal_server_error'" do
    it "returns http success" do
      get 'internal_server_error'
      response.should be_success
    end
  end

  describe "GET 'not_found'" do
    it "returns http success" do
      get 'not_found'
      response.should be_success
    end
  end

end
