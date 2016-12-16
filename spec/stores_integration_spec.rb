require('spec_helper')

describe('add a store', {:type => :feature}) do
  it('allows a user to add a store to the database') do
    visit('/')
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    expect(page).to have_content('DSW')
  end
end

describe('shows all stores on side menu', {:type => :feature}) do
  it('allows a user to view all stores in the database') do
    visit('/')
    fill_in('store_name', :with => 'Saks Fifth')
    find('#add_store_submit').click
    click_link("Home")
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    click_link("Stores")
    expect(page).to have_content('Saks Fifth')
    expect(page).to have_content('DSW')
  end
end

describe('add a brand to the store', {:type => :feature}) do
  it('allows a user to add a brand to a store') do
    visit('/')
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    click_link("Home")
    fill_in('brand_name', :with => 'Nike')
    find('#add_brand_submit').click
    click_link('Home')
    click_link('Stores')
    click_link('DSW')
    select("Nike", :from => "store_brand_selector")
    click_button('Add')
    expect(page).to have_content('Nike')
  end
end

describe('edit name of store', {:type => :feature}) do
  it('allows a user to edit the name of the store') do
    visit('/')
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    click_link("Home")
    click_link('Stores')
    click_link('DSW')
    click_link('Edit')
    fill_in('new_store_name', :with => 'Journeys')
    find('#edit_store_submit').click
    expect(page).to have_content('Journeys')
  end
end

describe('delete a store', {:type => :feature}) do
  it('allows a user to delete a store') do
    visit('/')
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    click_link("Home")
    click_link('Stores')
    click_link('DSW')
    click_link('Delete')
    find('#delete_store_confirm').click
    expect(page).to have_content('There are no stores yet!')
  end
end
