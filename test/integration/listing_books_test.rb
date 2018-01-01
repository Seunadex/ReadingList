require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'Pragramtic Programmer', rating: 3)
    Book.create!(title: 'Awesome Seun', rating: 5)
    Book.create!(title: 'YDKJ', rating: 4)
    Book.create!(title: 'Ajax on Rails', rating: 3)
  end

  test 'listing books' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

    assert_equal Book.count, json(response.body).size
  end

  test 'lists top rated books' do
    get '/books?rating=3'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 2, json(response.body).size
  end
end
