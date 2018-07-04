class AddWordToBeGuessed < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :word_to_be_guessed, :string
  end
end
