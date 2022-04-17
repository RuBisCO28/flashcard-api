# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :book do
    sequence(:name) { |n| "book_#{n}" }
  end
end
