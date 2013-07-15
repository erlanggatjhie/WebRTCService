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

  context "connect" do
    before(:each) do
      @room = stub_model(Room)
      @room.stub(:offerer_sdp).and_return("offerer sdp")
      Room.stub(:count).and_return(1)
      Room.stub(:first).and_return(@room)

      post :connect, { format: :json, answerer_sdp: "answerer sdp" } 
    end

    it "should update answerer sdp" do
      @room.answerer_sdp.should == "answerer sdp"
    end

    it "should get offerer sdp" do
      response.body.should == "{\"offerer_sdp\":\"offerer sdp\"}"
    end
  end

  context "get_answerer_sdp" do
    it "should fetch room" do 
      room = stub_model(Room)
      room.answerer_sdp = "answerer sdp"
      Room.stub(:count).and_return(1)
      Room.stub(:first).and_return(room)
      get :get_answerer_sdp, { format: :json }
      response.body.should == "{\"answerer_sdp\":\"answerer sdp\"}"
    end
  end
end
