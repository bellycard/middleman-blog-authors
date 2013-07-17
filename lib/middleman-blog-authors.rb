# Require core library
require "middleman-core"

class BlogAuthors < ::Middleman::Extension
  option :author_path, "authors/:author.html", 'Path to the individual author pages'
  option :author_template, "author.html", 'Template for the individual author pages'

  def initialize(app, options_hash={}, &block)
    super
    require 'blog_article'
    require 'blog_data'
    require 'author_pages'
    require 'author'

    app.set :blog_authors, options
  end

  def after_configuration
    @app.sitemap.register_resource_list_manipulator(
      :author_pages,
      ::Middleman::BlogAuthors::AuthorPages.new(@app, self),
      false
    )

  end

  helpers do
    def link_to_author(author)
      author_path = ::Middleman::BlogAuthors::AuthorPages.link(self.blog_authors, author.permalink)
      link_to author.name, "/#{author_path}"
    end
  end
end

::Middleman::Extensions.register(:authors, BlogAuthors)
