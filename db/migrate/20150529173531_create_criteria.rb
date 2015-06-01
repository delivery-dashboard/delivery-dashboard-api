class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.string :name
      t.integer :ordering

      t.timestamps
    end
  end
end
