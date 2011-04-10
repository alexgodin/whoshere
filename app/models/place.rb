class Place < ActiveRecord::Base
  has_many :messages
  def self.create_inc(place_id)
    create! do |user|
      if self.find_by_square_id(place_id) == nil
        user.square_id = place_id
        if Place.last != nil
          user.room_id = Place.last.room_id+1
        else
          user.room_id = 1111
        end
      else
        return self.find_by_square_id(place_id)
      end
    end
  end
end
