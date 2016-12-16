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
  @new_store = Store.new({name: params.fetch('store_name')})
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


# ----- Brands -------

get('/brands') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
  erb(:brands)
end

post('/brands') do
  @new_brand = Brand.new({name: params.fetch('brand_name')})
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
