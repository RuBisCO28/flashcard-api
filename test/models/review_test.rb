# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  registered_at :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  content_id    :integer          not null
#
# Indexes
#
#  index_reviews_on_content_id  (content_id)
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
