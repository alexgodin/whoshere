class SmsController < ApplicationController
  
  def main
    if params["body"] != nil
      room = params["body"][0, 4]
      Message.create(:body => params["body"], :place => Place.find_by_room_id(room))
      @messages = Place.find_by_room_id(room).messages
    end
  end
end
