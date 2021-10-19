class ArticlePresenter < BasePresenter
  def publish_date
    if published_at?
      "#{h.time_ago_in_words(published_at)} ago"
    else
      'Draft'
    end
  end
end
