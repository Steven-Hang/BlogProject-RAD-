class Post < ApplicationRecord
	has_many :comments
    has_many :comments, dependent: :destroy

	belongs_to :user
	validates :user_id, presence: true
	
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true, length: { minimum: 10, maximum: 200 }
	
#    validates:source, :format => URI::regexp(%w(http https))


#	validates_with Validate_url
end
