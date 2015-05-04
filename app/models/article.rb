class Article < ActiveRecord::Base
	# all articles will have a title 5 characters long
	validates :title, presence: true,
	length: {minimum: 5}
	# # added
	# before_create :user
	belongs_to :user
	# added
# 	def owner
#     self.user_id = current_user.id
# end
end
