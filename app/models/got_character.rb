class GotCharacter < ActiveRecord::Base
	has_many :tests
	has_many :users, through: :tests
end