require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "#index should be success" do
    create(:content, :with_review)

    get reviews_path, headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#index should be success when limit is set" do
    content1 = create(:content)
    content2 = create(:content)
    review1 = create(:review, content: content1, registered_at: Time.zone.now.ago(2.days))
    review2 = create(:review, content: content2, registered_at: Time.zone.now.ago(1.day))
    create(:review, content: content1, registered_at: Time.zone.now)
    limit_size = 2

    get reviews_path(limit: limit_size), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal limit_size, response_contents[:contents].count
    assert_equal review1.id, response_contents[:contents].first[:id]
    assert_equal review2.id, response_contents[:contents].second[:id]
  end

  test "#create should be success" do
    content1 = create(:content)
    content2 = create(:content)
    content3 = create(:content)
    content_ids = "#{content1.id}, #{content2.id}, #{content3.id}"

    post reviews_path, params: { contents: content_ids }, headers: @stubbed_header, xhr: true
    assert_response :success

    assert_equal 3, Review.count
  end

  test "#destroy should be success" do
    content1 = create(:content)
    content2 = create(:content)
    review1 = create(:review, content: content1, registered_at: Time.zone.now.ago(2.days))
    review2 = create(:review, content: content2, registered_at: Time.zone.now.ago(1.day))
    review3 = create(:review, content: content1, registered_at: Time.zone.now)
    correct_review_ids = "#{review1.id}, #{review2.id}"

    delete destroy_multiple_reviews_path, params: { reviews: correct_review_ids }, headers: @stubbed_header, xhr: true
    assert_response :success

    assert_equal 1, Review.count
    assert_equal review3.id, Review.first.id
  end
end
