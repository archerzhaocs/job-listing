class Resume < ApplicationRecord
  mount_uploader :attachment, AttachementUploader #Tell rails to use this uploader for this model.
  validates :name, presence: true #Make sure the owner's name is present.
  belongs_to :job
end
