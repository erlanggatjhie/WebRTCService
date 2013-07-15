class RoomController < ApplicationController
  def create
    success = false

    if (Room.count == 0)
      success = true if Room.create(offerer_sdp: params[:offerer_sdp])
    else
      room = Room.first
      room.offerer_sdp = params[:offerer_sdp]
      success = room.save
    end  
  
    respond_to do |format|
      format.json { render json: success }
    end
  end

  def connect
    if Room.count > 0
      room = Room.first
      room.answerer_sdp = params[:answerer_sdp]
      room.save
    else
      room = false
    end

    respond_to do |format|
      format.json { render json: room.to_json(only: [:offerer_sdp]) }
    end
  end

  def get_answerer_sdp
    if Room.count > 0
      room = Room.first
    else
      room = false
    end

    respond_to do |format|
      format.json { render json: room.to_json(only: [:answerer_sdp])  }
    end 
  end
end
