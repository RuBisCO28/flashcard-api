class ReviewsController < ApplicationController
  def index
    reviews = if params[:limit].present?
                Review.joins(:content).order(:id).limit(params[:limit].to_i)
              else
                Review.joins(:content).order(:id)
              end
    contents = reviews.map do |review|
      {
        id: review.id,
        question: review.content.question,
        answer: review.content.answer,
      }
    end

    render status: :ok, json: {
      contents:,
    }
  end

  def create
    render status: :ok if params[:contents].blank?

    contents = params[:contents].split(",")
    begin
      contents.map do |content|
        Review.create!(
          content_id: content,
          registered_at: Time.zone.now
        )
      end
      render status: :ok
    rescue StandardError => e
      raise e
    end
  end

  def destroy_multiple
    render status: :ok if params[:reviews].blank?

    reviews = Review.where(id: params[:reviews].split(","))
    begin
      ActiveRecord::Base.transaction do
        reviews.each(&:destroy!)
      end
      render status: :ok
    rescue StandardError => e
      raise e
    end
  end
end
