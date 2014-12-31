class Customer < ActiveRecord::Base
    mount_uploader :avatar , AvatarUploader
    has_many :poster
end
