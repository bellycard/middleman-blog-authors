module Middleman
  module Blog
    module BlogArticle
      def authors
        author_permalinks.map{|permalink| @app.blog_authors_data[permalink]}
      end

      def author_permalinks
        data.authors.split(',').map{|author| Middleman::BlogAuthors::AuthorPages.permalink(author)}
      end

      def author_names
        data.authors.split(',').map{|author| author.strip}
      end
    end
  end
end