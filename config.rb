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
# configure :development do
#   activate :livereload
# end

# contentful info
activate :contentful do |f|
  f.space         = { playground: 'sihh9h4tsjaz' }
  f.access_token  = 'dcd91f17b749a1ce2ab08ec8f40796ba8b8ebf717b095e2f4c39fc807cc3a53b'
  f.content_types = {
    blogPost: 'k5KOOOcoDKgAsUAOgaKMg'
  }
end

# using markdown for contentful stuff
set :markdown_engine, :kramdown
