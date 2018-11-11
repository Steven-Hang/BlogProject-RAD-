class Comment < ApplicationRecord
	belongs_to :post
	validates :post_id, presence: true

	#belongs_to :user
	#validates :user_id, presence: true
	default_scope -> { order(created_at: :desc) }
	validates:content, presence: true
	validates:content, :length => {:minimum => 3, :maximum => 1000}
end
