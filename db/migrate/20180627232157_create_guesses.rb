class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.string :guessed_letter
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
