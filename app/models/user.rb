class User < ApplicationRecord
	has_secure_password
	has_many :tasks, primary_key: "id", foreign_key: "user_id"

	# attribute :role, :integer, default: 0
	# enum role: { regular: 0, manager: 1, admin: 2 }
end
