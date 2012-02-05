=begin

ActiveRecord::Base.logger.level = 1
require 'json'
f = File.open("/home/tomek/rails_apps/bitspudlo/products.json")
arr = JSON.parse(f.read)
arr.each do |h|
  p = Product.find(h['id'])
  p.master.cost_price = h['our_cost_netto']
  putc 'X' if(p.master.cost_price_changed?)
  p.master.save
end;nil

=end



namespace :maintenance do
  desc "Exports current stock to CSV"
  task :stocktaking => [:environment] do |t|
    puts "id;code;name;netto unit cost;in stock;netto total cost"
#    products = Product.includes(:master).where("variants.count_on_hand > 0").order(:sku)
    products = Product.includes(:master).where("variants.count_on_hand > 0").where("available_on < ?", Time.now).where(:deleted_at => nil).order(:sku)
    products = products.reject{|p| p.master.cost_price.nil?}
    products = products.reject{|p| p.master.count_on_hand == 0}

    products.each do |p|
      STDERR.puts p.id
      netto_total = p.master.cost_price * p.master.count_on_hand
      puts "#{p.id};#{p.sku};#{p.name};#{p.master.cost_price};#{p.master.count_on_hand};#{netto_total}"
    end
  end
  
end
