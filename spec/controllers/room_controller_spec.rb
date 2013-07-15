require 'spec_helper'

describe RoomController do
  context "create" do
    it "should create room" do
      room = stub_model(Room)
      room.offerer_sdp = "offerer sdp"
      Room.stub(:create).and_return(room)
      
      post :create, { format: :json, offerer_sdp: room.offerer_sdp } 
      response.body.should == "{\"id\":#{room.id},\"answerer_sdp\":null,\"offerer_sdp\":\"#{room.offerer_sdp}\"}"
    end
  end

  context "join" do
    it "should update room" do
      room = stub_model(Room)
      room.stub(:offerer_sdp).and_return("offerer sdp")
    
      Room.stub(:find).and_return(room)

      post :join, { format: :json, answerer_sdp: "answerer sdp" }
      response.body.should == "{\"id\":#{room.id},\"answerer_sdp\":\"answerer sdp\",\"offerer_sdp\":\"offerer sdp\"}"
    end
  end
end
