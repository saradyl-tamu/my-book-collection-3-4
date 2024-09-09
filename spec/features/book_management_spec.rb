require 'rails_helper'

RSpec.feature 'Book management', type: :feature do
  scenario 'User adds a book with all attributes successfully' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'

    expect(Book.last.title).to eq('Test Book')
    expect(Book.last.author).to eq('Test Author')
    expect(Book.last.price).to eq(19.99)
    expect(Book.last.published_date).to eq(Date.today)

    click_link "Back to Home"
    expect(page).to have_content('Book was successfully created.')
  end

  scenario "User tries to create a book without an author" do
    visit new_book_path
    fill_in "Title", with: "A Great Book"
    fill_in "Price", with: "19.99"
    fill_in "Published date", with: "2024-01-01"
    click_button "Create Book"
    
    # Check that the error message appears on the page
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'User fails to add a book with a blank author' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'

    expect(page).to have_content("Author can't be blank")
  end

  scenario 'User fails to add a book with a blank price' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: ''
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'

    expect(page).to have_content("Price is not a number")
  end

  scenario 'User fails to add a book with a blank published date' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: ''
    click_button 'Create Book'

    expect(page).to have_content("Published date can't be blank")
  end

  scenario 'User tries to create a book with a price less than 0' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '-1'
    fill_in 'Published date', with: Date.today
    click_button 'Create Book'

    expect(page).to have_content('Price must be greater than or equal to 0')
  end

  scenario 'User tries to create a book with a future published date' do
    visit new_book_path
    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '19.99'
    fill_in 'Published date', with: Date.tomorrow
    click_button 'Create Book'

    expect(page).to have_content('Published date can\'t be in the future')
  end
end
