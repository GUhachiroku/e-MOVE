class AddMicropostToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :room, foreign_key: true
  end
end
