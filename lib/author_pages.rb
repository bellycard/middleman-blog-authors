module Middleman
  class BlogAuthors

    # A sitemap plugin that adds author pages to the sitemap
    # based on the authors of blog articles.
    class AuthorPages
      class << self
        def link(blog_authors_options, author)
          ::Middleman::Util.normalize_path(blog_authors_options.author_path.sub(':author', author.parameterize))
        end
      end

      def initialize(app, controller=nil)
        @app = app
        @blog_controller = controller
      end

      def blog_data
        @app.blog
      end

      def blog_authors_options
        @app.blog_authors
      end

      def manipulate_resource_list(resources)
        resources + self.blog_data.authors.map do |author|
          path = AuthorPages.link(self.blog_authors_options, author.name)
        
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