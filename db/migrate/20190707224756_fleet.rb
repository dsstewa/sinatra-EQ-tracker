class Fleet < ActiveRecord::Migration
  def change
    create_table :equipment do  |t|
      t.string :make
      t.string :model
      t.string :rent_type
      t.float :rate
      t.integer :project_id
  end
  end
end
