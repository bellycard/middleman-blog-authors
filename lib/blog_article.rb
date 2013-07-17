module Middleman
  module Blog
    module BlogArticle

        def authors
          data["authors"].split(',').map{|author| ::BlogAuthors::Author.new(author, data)}
        end

        def author_slugs
          authors.map{|a| a.parameterize}
        end

    end
  end
end