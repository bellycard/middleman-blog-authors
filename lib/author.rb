module Middleman
  class BlogAuthors
    class Author
      attr_accessor :attributes, :articles
      def initialize(name, local_data = nil)
        @articles = []
        @attributes = {
          "name" => name,
          "permalink" => BlogAuthors::AuthorPages.permalink(name)
        }

        if local_data.try(:authors)
          @attributes.merge!(local_data.authors[@attributes["permalink"]]) if local_data.authors[@attributes["permalink"]]
        end

        @attributes.each do |attribute|
          eval "def #{attribute[0]}; @attributes['#{attribute[0]}']; end" 
        end
      end
    end
  end
end