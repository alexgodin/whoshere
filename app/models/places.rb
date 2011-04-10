class Places < ActiveRecord::Base
  has_many :messages
  def self.create_inc(place_id)
    create! do |user|
      user.square_id = place_id
      if Place.last != nil
        user.room_id = Place.last.room_id+1
      else
        user.room_id = 1111
      end
    end
  end
end
