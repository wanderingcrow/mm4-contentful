require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

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
