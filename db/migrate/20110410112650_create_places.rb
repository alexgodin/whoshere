class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.integer :room_id
      t.string :square_id

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
