module Middleman
  module Blog
    class BlogData

      def authors
        permalinks = @_articles.map{|article| article.author_permalinks}.flatten.uniq
        permalinks.map{|permalink| @app.blog_authors_data[permalink]}
      end

    end
  end
end
