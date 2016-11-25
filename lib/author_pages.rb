module Middleman
  class BlogAuthors
    # A sitemap plugin that adds author pages to the sitemap
    # based on the authors of blog articles.
    class AuthorPages
      class << self
        def permalink(author_name)
          author_name.parameterize
        end

        def link(blog_authors_options, author)
          ::Middleman::Util.normalize_path(blog_authors_options.author_path.sub(':author', AuthorPages.permalink(author.name)))
        end
      end

      def initialize(app, controller=nil)
        @app = app
        @blog_controller = controller
      end

      def blog_data
        @app.extensions[:blog].first[1].data
      end

      def blog_authors_options
        @app.blog_authors_options
      end

      def manipulate_resource_list(resources)
        @app.blog_authors_data.clear
        # collect authors
        blog_data.articles.each do |article|
          article.author_names.each do |author|
            permalink = Middleman::BlogAuthors::AuthorPages.permalink(author)
            if @app.blog_authors_data[permalink].nil?
              @app.blog_authors_data[permalink] = ::Middleman::BlogAuthors::Author.new(author, @app.data)
            end
            @app.blog_authors_data[permalink].articles << article
          end
        end

        resources + self.blog_data.authors.map do |author|
          path = AuthorPages.link(self.blog_authors_options, author)
        
          p = ::Middleman::Sitemap::Resource.new(
            @app.sitemap,
            path
          )
          p.proxy_to(self.blog_authors_options.author_template)

          p.add_metadata :locals => {
            'page_type' => 'author',
            'author' => author,
            'articles' => author.articles,
          }

          p
        end
      end
    end
  end
end
