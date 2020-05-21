class CreateJudgements < ActiveRecord::Migration[6.0]
  def change
    create_table :judgements do |t|
      t.string :file_number
      t.string :claimant
      t.string :defendant
      t.text :summary
      t.string :court_table
      t.references :notifications, null: false, foreign_key: true

      t.timestamps
    end
  end
end
