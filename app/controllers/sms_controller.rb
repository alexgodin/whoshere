class SmsController < ApplicationController
  protect_from_forgery :only => [:update, :delete, :create]
  
  def main
    if params["paramaters"]["body"] != nil
      room = params["paramaters"]["body"][0, 4]
      logger.erro "room is #{room}" 
      Message.create(:body => params["paramaters"]["body"], :place => Place.find_by_room_id(room))
    end
  end
  def chat
    room = params[:id]
    @messages = Place.find_by_room_id(room).messages
    logger.info "testing"
  end
end
