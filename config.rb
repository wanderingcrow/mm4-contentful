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

activate :dotenv

# contentful info
activate :contentful do |f|
  f.access_token  = ENV['CONTENTFUL_TOKEN']
  f.space         = { playground: 'sihh9h4tsjaz' }
  f.cda_query       = { limit: 10000 }
  f.content_types = {
    blogPost: 'k5KOOOcoDKgAsUAOgaKMg'
  }
end

# page "/post/#{blogPost[1][:slug]}.html", layout: 'layout'
# locals: { blogPost: OpenStruct.new(blogPost[1]) }
if Dir.exist?(config.data_dir)
  data.playground.blogPost.each do |id, blogPost|
    proxy "post/#{ blogPost.slug }", "post/template.html", :ignore => true, layout: 'layout'
  end
end

# using markdown for contentful stuff
set :markdown_engine, :kramdown
