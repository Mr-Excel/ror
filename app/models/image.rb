class Image < ApplicationRecord
  # include ImageUploader::Attachment(:image) 
  belongs_to :imageable, polymorphic: true
  has_one_attached :image_data
  # before_create :set_image_filename

  # private

  # def set_image_filename
  #   extension = File.extname(image_file_name).downcase
  #   self.image_file_name = "#{SecureRandom.hex(8)}#{extension}"
  # end
end
