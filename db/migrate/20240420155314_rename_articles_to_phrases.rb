class RenamePhrasesToPhrases < ActiveRecord::Migration[7.1]
  def change
    rename_table :phrases, :phrases
  end
end
