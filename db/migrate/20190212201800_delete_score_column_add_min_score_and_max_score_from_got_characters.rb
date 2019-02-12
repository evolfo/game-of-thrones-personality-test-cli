class DeleteScoreColumnAddMinScoreAndMaxScoreFromGotCharacters < ActiveRecord::Migration[5.0]
  def change
    remove_column :got_characters, :score, :integer
  	add_column :got_characters, :min_score, :integer
  	add_column :got_characters, :max_score, :integer
  end
end
