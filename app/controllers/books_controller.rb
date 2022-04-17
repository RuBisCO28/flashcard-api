class BooksController < ApplicationController
  def index
    books = Book.all.map do |book|
      {
        id: book.id,
        name: book.name,
      }
    end

    render status: :ok, json: {
      books:,
    }
  end

  def show
    book = Book.find_by(id: params[:id])
    sections = book.sections.map do |section|
      {
        name: section.name,
      }
    end

    render status: :ok, json: {
      book: book.id,
      sections:,
    }
  end
end
