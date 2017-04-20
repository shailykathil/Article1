class Image < ApplicationRecord
  belongs_to :article
  mount_uploader :image, AvatarUploader
end
