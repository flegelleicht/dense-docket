class AddUserRefToDockets < ActiveRecord::Migration[5.2]
  def change
    add_reference :dockets, :user, foreign_key: true
  end
end
