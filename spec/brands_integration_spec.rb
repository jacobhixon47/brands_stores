require('spec_helper')

describe('add a brand', {:type => :feature}) do
  it('allows a user to add a brand to the database') do
    visit('/')
    fill_in('brand_name', :with => 'Nike')
    find('#add_brand_submit').click
    expect(page).to have_content('Nike')
  end
end
