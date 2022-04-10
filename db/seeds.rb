# require "csv"

# book = Book.create!(name: "Duo")

# sections = []
# CSV.foreach('db/contents.csv', headers: true) do |row|
#   sections << row[1]
# end

# sections.uniq.each do |section|
#   Section.create!(
#     book: book,
#     name: section.to_s,
#   )
# end

# CSV.foreach('db/contents.csv', headers: true) do |row|
#   section = Section.find_by(id: row['section'].to_i)
#   Content.create!(
#     section: section,
#     question: row['japanese'],
#     answer: row['english'],
#   )
# end
