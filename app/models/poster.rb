class Poster < ActiveRecord::Base
    belongs_to :customer , :foreign_key => :author_id
    mount_uploader :cover , CoverUploader
end
