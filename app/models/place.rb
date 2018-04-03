class Place < ApplicationRecord
has_many :comments, dependent: :destroy
belongs_to :user
mount_uploader :image, ImageUploader
end
