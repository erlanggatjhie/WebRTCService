require 'spec_helper'

describe RoomController do
  context "create" do
    before(:each) do
      post :create, {format: :json, offerer_sdp: "offerer_sdp"}
    end

    it "should add one room into database" do
      Room.count.should == 1
    end

    it "should add the right details" do
      Room.find(1).offerer_sdp.should == "offerer_sdp"
    end
  end
end
