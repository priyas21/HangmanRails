class RenameGuessedLetter < ActiveRecord::Migration[5.2]
  def change
     rename_column :guesses, :guessed_letter, :letter
  end
end
