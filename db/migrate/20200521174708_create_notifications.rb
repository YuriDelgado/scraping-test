class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :body
      t.references :judgement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
