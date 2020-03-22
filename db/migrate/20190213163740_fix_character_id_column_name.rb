class FixCharacterIdColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tests, :character_id, :got_character_id
  end
end
