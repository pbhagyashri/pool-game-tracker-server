class RemoveWinnerFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :winner, :integer
  end
end
