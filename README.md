# Middleman Blog Authors
[![Gemnasium](https://img.shields.io/gemnasium/hatchloyalty/middleman-blog-authors.svg)](https://gemnasium.com/hatchloyalty/middleman-blog-authors)


## Installation

Add the `middleman-blog-authors` gem to you Gemfile.

```
gem "middleman-blog-authors"
```


## Configuration
Activate this extension in your config.rb file

```
activate :authors
```

In your blog posts, add authors to the metadata:

```
---
title: Building Middleman Extensions
date: 2013-07-17
authors: Darby Frey
---
```

Create a template for the author page. If this is not your default template, put it
in source/layouts:

`source/layouts/author.html.haml`

```
---
title: #{author.name}
pageable: true
per_page: 10
---

<h1><%= author.name %></h1>

<ul>
  <% page_articles.each do |article| %>
    <li><%= link_to article.title, article %></li>
  <% end %>
</ul>
```

### License

[MIT](/LICENSE)
