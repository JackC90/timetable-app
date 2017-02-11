class AddCompulsoryToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :compulsory, :boolean, default: false
  end
end
