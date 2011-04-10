class AddPlaceIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :place_id, :integer
  end

  def self.down
    remove_column :messages, :place_id
  end
end
