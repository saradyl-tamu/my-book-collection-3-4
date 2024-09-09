require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with a title, author, price, and published_date' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it 'is invalid without a title' do
    book = Book.new(
      title: nil,
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to_not be_valid
  end

  it 'is invalid with a blank title' do
    book = Book.new(
      title: '',
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to_not be_valid
  end

  it 'is valid with a valid author' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it 'is invalid without an author' do
    book = Book.new(
      title: 'Test Book',
      author: nil,
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to_not be_valid
  end

  it 'is valid with a valid price' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it 'is invalid without a price' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: nil,
      published_date: Date.today
    )
    expect(book).to_not be_valid
  end

  it 'is valid with a valid published_date' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it 'is invalid without a published_date' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: nil
    )
    expect(book).to_not be_valid
  end

  it 'is invalid with a price less than 0' do
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: -1,
      published_date: Date.today
    )
    expect(book).to_not be_valid
  end

  it 'is invalid with a published date in the future' do
    future_date = Date.today + 1
    book = Book.new(
      title: 'Test Book',
      author: 'Test Author',
      price: 19.99,
      published_date: future_date
    )
    expect(book).to_not be_valid
  end

end
