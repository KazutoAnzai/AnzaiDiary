class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 5, message: 'Too short!!' }
	validates :author, presence: true

	has_many :comments, dependent: :destroy

	mount_uploader :picture, PictureUploader
end
