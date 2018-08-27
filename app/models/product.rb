class Product < ApplicationRecord

    has_many :order_products

    acts_as_paranoid

    mount_uploader :image, UserImageUploader
    
    def self.addProduct(user_id,product_id)
        if ($redis.exists(user_id))
            $redis.rpush(user_id,product_id);
        else
            $redis.rpush(user_id, product_id)
        end
    end
end