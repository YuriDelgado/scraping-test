class AddUniqueIndexToJudgementsFileNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :judgements, :file_number, unique: true
  end
end
