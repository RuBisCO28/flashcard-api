require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should success if request valid content id" do
    section = create(:section, :with_content)

    get section_path(section.id), headers: @stubbed_header, xhr: true
    assert_response :success
  end

  test "#show should success response having section" do
    section = create(:section, :with_content)

    get section_path(section.id), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal section.id, response_contents[:section]
  end

  test "#show should success response having contents" do
    section = create(:section)
    content = create(:content, id: rand(1..10), section:)

    get section_path(section.id), headers: @stubbed_header, xhr: true
    assert_response :success

    response_contents = JSON.parse(response.body).deep_symbolize_keys

    assert_equal content.question, response_contents[:contents].first[:question]
    assert_equal content.answer, response_contents[:contents].first[:answer]
  end
end
