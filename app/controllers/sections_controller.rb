class SectionsController < ApplicationController
  def show
    section = Section.find_by(id: params[:id])
    contents = section.contents.map do |content|
      {
        id: content.id,
        question: content.question,
        answer: content.answer,
      }
    end

    render status: :ok, json: {
      section: section.id,
      contents:,
    }
  end
end
