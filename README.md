# Middleman-Blog-Authors

## Installation

In your Gemfile:

```
gem "middleman-blog-authors"
```

## Configuration

In your config.rb:

```
activate :authors
```

In your blog posts, add authors to the metadata:

```
---
title: Building Middleman Addons
date: 2013-07-17
authors: Darby Frey
---
```

Create a template for the author page. If this is not your main template, put it
in source/layouts:

`source/layouts/author.html.haml`

```
---
title: #{author.name}
pageable: true
per_page: 10
---

%h1= author.name

%ul
  - page_articles.each do |article|
    %li= link_to article.title, article

```
