class AddedScoreToTests < ActiveRecord::Migration[5.0]
  def change
      add_column :tests, :score, :integer
  end
end
