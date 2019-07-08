class Section < ApplicationRecord
	has_many :pages
	has_many :tasks
end
