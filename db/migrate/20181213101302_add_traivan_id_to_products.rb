class AddTraivanIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :traivan_id, :integer
  end
end
