class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :period, index: true
      t.references :criteria, index: true
      t.references :project, index: true
      t.string :situation
      t.text :comments
      t.timestamps
    end
  end
end
