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
