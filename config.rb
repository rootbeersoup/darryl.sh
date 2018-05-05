# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'slim'

activate :livereload

set :livereload_css_target, 'css/style.css'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
  prefix.inline = true
end

activate :blog do |blog|
  blog.layout = "post"
  blog.permalink = "{permalink}"
  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
end

activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

configure :markdown do
  activate :syntax
end

set :css_dir, 'css'
set :source, 'src'