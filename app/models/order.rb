class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shop
    has_many :order_products, dependent: :destroy
    has_many :products, through: :order_products
    acts_as_paranoid

    after_initialize :set_defaults

    def set_defaults
        self.status ||= 'Request Sent' 
    end

    def self.order_product_table_update(user_id)
        @a=$redis.rpop(user_id);
        while @a != nil
            @a=$redis.rpop(user_id)
        end
    end
end
