class Projects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.integer :duration
      t.integer :user_id
    end
  end
end
