class CreateVendas < ActiveRecord::Migration[5.0]
  def change
    create_table :vendas do |t|
        
        t.string  :purchaser_name
        t.text    :item_description
        t.float   :item_price
        t.integer :purchase_count
        t.text    :merchant_address
        t.text    :merchant_name
    end
  end
end
