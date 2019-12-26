# frozen_string_literal: true

page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.xml', layout: false

set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true
set :markdown_engine, :redcarpet

webpack_build = 'yarn run webpack --bail -p'
webpack_watch = 'yarn run webpack --watch -d'
activate :external_pipeline,
  name: :webpack,
  command: build? ? webpack_build : webpack_watch,
  source: '.tmp/dist',
  latency: 1

ignore /^js\//
ignore /^style\//

configure :production do
  activate :minify_html
  activate :gzip
end
