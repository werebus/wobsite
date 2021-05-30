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

ignore %r{^js/}
ignore %r{^style/}

configure :production do
  activate :minify_html
  activate :gzip
end

helpers do
  def webpack_body
    ::Middleman::TemplateRenderer.resolve_template(
      app, '_webpack_body.html', try_static: true
    ).read
  end

  def webpack_head
    ::Middleman::TemplateRenderer.resolve_template(
      app, '_webpack_head.html', try_static: true
    ).read
  end
end
