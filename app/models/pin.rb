class Pin < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
	validates :title, presence: true
	validates :discription, presence: true

	has_attached_file :image, styles: { medium: "300x300>"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	validates_attachment_presence :image
end
