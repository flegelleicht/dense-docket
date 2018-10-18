class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :start
      t.date :end
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
