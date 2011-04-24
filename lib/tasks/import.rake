namespace :import do
  namespace :json do
    
    desc 'import categories from JSON file'
    task :categories => [:environment] do
      if(ARGV[1].blank?)
        puts "ERROR: need path to JSON file for loading"
        abort
      end
      json_file = File.open(ARGV[1])
      taxonomy = Taxonomy.first
      root_taxon = taxonomy.taxons.where(:parent_id => nil).first
      imported_categories = ActiveSupport::JSON.decode(json_file.read)
      imported_categories.sort_by{|ic| ic['id']}.each do |imported_category|
        next if(Taxon.find_by_id(imported_category['id']))
        next if(imported_category['parent_id']!=0 && Taxon.find_by_id(imported_category['parent_id']).nil?)
        putc '.'
        taxon = taxonomy.taxons.new
        taxon.id = imported_category['id']
        if(imported_category['parent_id']==0)
          taxon.parent_id = root_taxon.id
        else
          taxon.parent_id = imported_category['parent_id']
        end
        #taxon.name = imported_category['name']
        taxon.name_pl = imported_category['name_pl']
        taxon.name_en = imported_category['name_en']
        #taxon.description = imported_category['description']
        taxon.description_pl = imported_category['description_pl']
        taxon.description_en = imported_category['description_en']
        taxon.save
      end
      puts "done!"
    end
    
    
    desc 'import products from JSON file'
    task :products => [:environment] do
      if(ARGV[1].blank?)
        puts "ERROR: need path to JSON file for loading"
        abort
      end
      json_file = File.open(ARGV[1])
      imported_products = ActiveSupport::JSON.decode(json_file.read)
      imported_products.sort_by{|ic| ic['id']}.each do |imported_product|
        next if(Product.find_by_id(imported_product['id']))
        putc '.'
        product = Product.new
        product.id = imported_product['id']
        product.price = imported_product['price']
        product.cost_price = imported_product['our_cost_netto']
        product.sku = imported_product['code']
        product.count_on_hand = imported_product['in_stock']
        #product.name = imported_product['title']
        product.name_pl = imported_product['title_pl']
        product.name_en = imported_product['title_en']
        #product.description = imported_product['description']
        product.description_pl = imported_product['description_pl']
        product.description_en = imported_product['description_en']
        
        product.save
        taxon = Taxon.find_by_id(imported_product['category_id'])
        if(taxon)
          product.taxons << taxon 
        else
          putc 'e'
        end
      end
      puts "done!"
    end
  end
end
