class AddWinnerToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :winner, :string
  end
end
