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

    it "should render json object" do
      response.body.should == "{\"id\":1,\"answerer_sdp\":null,\"offerer_sdp\":\"offerer_sdp\"}"
    end
  end

  context "connect" do
    before(:each) do
      @room = Room.create(offerer_sdp: "offerer_sdp")
      post :connect, {format: :json, answerer_sdp: "answerer sdp"}
    end

    it "should update answerer sdp" do
      room = Room.first
      room.answerer_sdp.should == "answerer sdp"
    end

    it "should render json object" do
      response.body.should == "{\"offerer_sdp\":\"offerer_sdp\"}"
    end
  end

  context "get_answerer_sdp" do
    it "should get answerer sdp" do
      Room.create(answerer_sdp: "answerer sdp")
      get :get_answerer_sdp, { format: :json } 
      response.body.should == "{\"answerer_sdp\":\"answerer sdp\"}"
    end
  end
end
