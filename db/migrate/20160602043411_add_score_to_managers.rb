class AddScoreToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :score, :integer, default: 100
  end
end
