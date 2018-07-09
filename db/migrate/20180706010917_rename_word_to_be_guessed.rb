class RenameWordToBeGuessed < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :word_to_be_guessed, :word
  end
end
