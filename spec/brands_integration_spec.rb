require('spec_helper')

describe('add a brand', {:type => :feature}) do
  it('allows a user to add a brand to the database') do
    visit('/')
    fill_in('brand_name', :with => 'Nike')
    find('#add_brand_submit').click
    expect(page).to have_content('Nike')
  end
end

describe('shows all brands on side menu', {:type => :feature}) do
  it('allows a user to view all brands in the database') do
    visit('/')
    fill_in('brand_name', :with => 'Nike')
    find('#add_brand_submit').click
    click_link("Home")
    fill_in('brand_name', :with => 'Adidas')
    find('#add_brand_submit').click
    click_link("Brands")
    expect(page).to have_content('Adidas')
    expect(page).to have_content('Nike')
  end
end

# describe('add brand to store', {:type => :feature}) do
#   it('allows a user to add a brand to a store') do
#     visit('/')
#     fill_in('brand_name', :with => 'Nike')
#     find('#add_brand_submit').click
#     click_link('Home')
#     click_link('Brands')
#     click_link('Nike')
#     expect(page).to have_content('Adidas')
#     expect(page).to have_content('Nike')
#   end
# end
