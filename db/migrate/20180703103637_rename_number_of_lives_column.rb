class RenameNumberOfLivesColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :number_of_lives, :initial_number_of_lives
  end
end
