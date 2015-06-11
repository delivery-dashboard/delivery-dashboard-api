class ChangeCriteriaNameField < ActiveRecord::Migration
  def change
    rename_column :criteria, :name, :description
  end
end
