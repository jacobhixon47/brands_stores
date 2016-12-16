require('spec_helper')

describe('add a store', {:type => :feature}) do
  it('allows a user to add a store to the database') do
    visit('/')
    find('#add_store_div').click
    fill_in('store_name', :with => 'DSW')
    find('#add_store_submit').click
    expect(page).to have_content('DSW')
  end
end
