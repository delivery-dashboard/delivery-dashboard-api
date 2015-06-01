class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :period, index: true
      t.references :criteria, index: true
      t.references :project, index: true
      t.string :status
      t.text :comments
      t.timestamps
    end
  end
end
