class RenameCommentPhrasesRelation < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :article_id, :phrase_id
  end
end
