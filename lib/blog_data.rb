module Middleman
  module Blog
    class BlogData

      def authors
        authors = {}
        @_articles.each do |article|
          article.authors.each do |author|
            authors[author.permalink] = author if authors[author.permalink].nil?
            authors[author.permalink].articles << article
          end
        end

        authors.values
      end

    end
  end
end
