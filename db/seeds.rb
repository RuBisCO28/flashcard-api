# require "csv"

# CSV.foreach('db/books.csv', headers: true) do |row|
#   Book.create!(name: row['name'])
# end

# CSV.foreach('db/sections.csv', headers: true) do |row|
#   book = Book.find_by(id: row['book'].to_i)
#   Section.create!(
#     book: book,
#     name: row['name'].to_s
#   )
# end

# CSV.foreach('db/contents.csv', headers: true) do |row|
#   section = Section.find_by(id: row['section'].to_i)
#   Content.create!(
#     section: section,
#     question: row['japanese'],
#     answer: row['english']
#   )
# end
