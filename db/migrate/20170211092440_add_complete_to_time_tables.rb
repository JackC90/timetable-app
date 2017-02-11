class AddCompleteToTimeTables < ActiveRecord::Migration[5.0]
  def change
    add_column :time_tables, :complete, :boolean, default: false
  end
end
