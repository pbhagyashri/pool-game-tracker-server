class AddWinnerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :winner, :string
  end
end
