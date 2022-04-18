require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should success if request valid section id" do
    book = create(:book, :with_section)

    get book_path(book.id), headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#show should success response having book" do
    book = create(:book, :with_section)

    get book_path(book.id), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal book.id, response_contents[:book]
  end

  test "#show should success response having sections" do
    book = create(:book)
    section = create(:section, id: rand(1..10), book:)

    get book_path(book.id), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal section.name, response_contents[:sections].first[:name]
  end
end
