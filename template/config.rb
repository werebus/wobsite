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

webpack_build = 'yarn run webpack --mode=production'
webpack_watch = 'yarn run webpack --watch --mode=development'
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

helpers do
  def webpack_js
    ::Middleman::TemplateRenderer.resolve_template(
      app, '_scripts.html', try_static: true
    ).read
  end

  def webpack_css
    ::Middleman::TemplateRenderer.resolve_template(
      app, '_styles.html', try_static: true
    ).read
  end
end
