class Media
  include ActiveModel::Serialization

  def attributes
    {
      movies: movies,
      seasons: seasons
    }
  end

  private

  def movies
    Movie.order(:created_at)
  end

  def seasons
    Season.order(:created_at).includes(:tv_show, :episodes)
  end
end
