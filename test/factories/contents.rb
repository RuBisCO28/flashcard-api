# == Schema Information
#
# Table name: contents
#
#  id         :bigint           not null, primary key
#  answer     :string           not null
#  question   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint
#
# Indexes
#
#  index_contents_on_answer      (answer)
#  index_contents_on_question    (question)
#  index_contents_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
FactoryBot.define do
  factory :content do
    sequence(:question) { |n| "question_#{n}" }
    sequence(:answer) { |n| "answer_#{n}" }
    trait :with_review do
      after(:create) do |content|
        create(:review, content:)
      end
    end

    association :section
  end
end
