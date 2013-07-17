module Middleman
  module Blog
    class BlogData

      def authors
        authors = []
        @_articles.each do |article|
          article.authors.each do |author|

            author.articles << article
            authors << author
          end
        end

        authors.uniq
      end

    end
  end
end
