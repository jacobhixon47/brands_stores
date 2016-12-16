require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  erb(:index)
end


# ------ Stores -------

get('/stores') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  erb(:stores)
end

post('/stores') do
  @new_store = Store.new({name: params.fetch('store_name').titlecase()})
  if @new_store.save()
    redirect("/stores/#{@new_store.id().to_s()}")
  else
    erb(:index)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @store_brands = @store.brands.order(:name)
  erb(:store)
end

post('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @store_brands = @store.brands.order(:name)
  multi_brands_ids = params[:multi_brands]
  multi_brands_ids.each() do |brand_id|
    @store.brands.push(Brand.find(brand_id))
  end
  erb(:store)
end

patch('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @store_brands = @store.brands.order(:name)
  new_name = params.fetch('new_store_name').titlecase()
  @store.update(name: new_name)
  erb(:store)
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @store.destroy
  erb(:stores)
end

# ----- Brands -------

get('/brands') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  erb(:brands)
end

post('/brands') do
  @new_brand = Brand.new({name: params.fetch('brand_name').titlecase()})
  if @new_brand.save()
    redirect("/brands/#{@new_brand.id().to_s()}")
  else
    erb(:index)
  end
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @brand_stores = @brand.stores.order(:name)
  erb(:brand)
end

post('/brands/:id') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  @brand = Brand.find(params.fetch('id').to_i())
  @brand_stores = @brand.stores.order(:name)
  multi_stores_ids = params[:multi_stores]
  multi_stores_ids.each() do |store_id|
    @brand.stores.push(Store.find(store_id))
  end
  erb(:brand)
end
