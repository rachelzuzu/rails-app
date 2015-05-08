class Article < ActiveRecord::Base
	# all articles will have a title 5 characters long
	validates :title, presence: true,
	length: {minimum: 5}
	# # added
	# before_create :user
	belongs_to :user
    # paperclip
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    #comments model
    has_many :comments
  	validates :title, presence: true,
                    length: { minimum: 5 }

	def summary
		self.content.first(100)
	end












end
