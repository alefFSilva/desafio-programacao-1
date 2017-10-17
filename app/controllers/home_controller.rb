class HomeController < ApplicationController
  
    def index
        @receitaBruta = 0.0
    end
    
 def upload
    
     @receitaBruta = 0.0
     
     arquivo = params[:arquivoTxt]
     
     if arquivo.respond_to?(:read)
         linhas = arquivo.read.force_encoding("UTF-8")
         
        
         linhas.each_line.with_index do |linha, index|
                 next if index == 0
             
             purchaser_name_arq, 
             item_description_arq, 
             item_price_arq, 
             purchase_count_arq,
             merchant_address_arq,
             merchant_name_arq  = linha.strip.split("\t")
             
             
             @receitaBruta += item_price_arq.to_i * purchase_count_arq.to_i
             
             
             @Venda = Venda.new(
                 
                 purchaser_name:    purchaser_name_arq,
                 item_description:  item_description_arq,
                 item_price:        item_price_arq,
                 purchase_count:    purchase_count_arq,
                 merchant_address:  merchant_address_arq,
                 merchant_name:     merchant_name_arq             
                 )
             
             @Venda.save
             
             end            
                  
     end
         

     render :index
         

     
end
    
end