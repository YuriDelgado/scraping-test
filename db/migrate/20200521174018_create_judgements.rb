class CreateJudgements < ActiveRecord::Migration[6.0]
  def change
    create_table :judgements do |t|
      t.string :file_number
      t.string :claimant
      t.string :defendant
      t.text :summary
      t.string :court

      t.timestamps
    end
  end
end
