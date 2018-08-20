class Shop < ApplicationRecord
    belongs_to :user
    has_many :products, dependent: :delete_all, validate: false
    has_many :orders, dependent: :destroy
    acts_as_paranoid

    mount_uploader :logo, UserImageUploader
end
