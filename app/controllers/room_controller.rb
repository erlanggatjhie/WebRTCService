class RoomController < ApplicationController
  def create
    room = Room.create(offerer_sdp: params[:offerer_sdp])

    respond_to do |format|
      format.json { render json: room.to_json(only: [:id, :offerer_sdp, :answerer_sdp]) }
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
