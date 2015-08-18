require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the list path', {:type => :feature}) do
  it('allows the user to see all lists') do
    visit('/')
    click_on('View all lists')
    expect(page).to have_content('View All Lists')
  end

  it('allow the user to add a new list') do
    visit('/')
    click_on('Add a list')
    expect(page).to have_content('New List:')
  end

  it('allow the user to click on a specific list and view its tasks') do
    visit('/')
    click_on('Add a list')
    fill_in('new_list',  :with => 'Groceries')
    click_button('Add')
    click_link('Groceries')
    expect(page).to have_content('Groceries')
  end

end
