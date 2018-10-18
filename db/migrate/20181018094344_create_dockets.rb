class CreateDockets < ActiveRecord::Migration[5.2]
  def change
    create_table :dockets do |t|
      t.date :start
      t.date :end
      t.string :title

      t.timestamps
    end
  end
end
