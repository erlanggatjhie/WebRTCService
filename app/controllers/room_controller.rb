class RoomController < ApplicationController
  def create
    room = Room.create(offerer_sdp: params[:offerer_sdp])

    respond_to do |format|
      format.json { render json: room.to_json(only: [:id, :offerer_sdp, :answerer_sdp]) }
    end
  end

  def join
    room = Room.find(params[:id])
    room.answerer_sdp = params[:answerer_sdp]
    room.save

    respond_to do |format|
      format.json { render json: room.to_json(only: [:id, :offerer_sdp, :answerer_sdp]) }
    end
  end
end
