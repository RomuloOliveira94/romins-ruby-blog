class AddStatusToPhrases < ActiveRecord::Migration[7.1]
  def change
    add_column :phrases, :status, :string , default: 'public'
  end
end
