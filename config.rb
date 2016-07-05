require 'slim'

# Directories
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# pretty URLs
activate :directory_indexes

# hide private keys
activate :dotenv

# contentful info
activate :contentful do |f|
  f.space = { playground: 'sihh9h4tsjaz' }
  f.access_token = ENV['CONTENTFUL_TOKEN']
  f.cda_query = { limit: 10000 }
  f.content_types = {
    blogPost: 'k5KOOOcoDKgAsUAOgaKMg'
  }
end

if Dir.exist?(config.data_dir)

  data.playground.blogPost.each do |blogPost|
    proxy "post/#{ blogPost[1][:slug] }", "post/template.html", :ignore => true, :layout => 'layout', :locals => { blogPost: OpenStruct.new(blogPost[1]) }
  end

  # add more content models here
end

# using markdown for contentful stuff
set :markdown_engine, :kramdown
