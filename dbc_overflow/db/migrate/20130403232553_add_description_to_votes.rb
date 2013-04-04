class AddDescriptionToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :description, :integer
  end
end
