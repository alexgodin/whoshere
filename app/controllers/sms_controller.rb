class SmsController < ApplicationController
  protect_from_forgery :only => [:update, :delete, :create]
  
  def main
    if params["body"] != nil
      room = params["body"][0, 4]
      logger.info "room is #{room}" 
      Message.create(:body => params["body"], :place => Place.find_by_room_id(room))
    end
  end
  def chat
    room = params[:id]
    @messages = Place.find_by_room_id(room).messages
    logger.info "testing"
  end
end
