class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    def self.order_product_table_update(user_id,order_id)
        @a=$redis.rpop(user_id);
        while @a != nil
            OrderProduct.create(:order_id => order_id, :product_id => @a.to_i, :quantity => "..")
            @a=$redis.rpop(user_id)
        end
        $redis.del(user_id)
    end
end
