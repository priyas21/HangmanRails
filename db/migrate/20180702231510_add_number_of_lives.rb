class AddNumberOfLives < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :number_of_lives, :integer
  end
end
