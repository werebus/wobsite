# frozen_string_literal: true

page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.xml', layout: false

webpack_build = './node_modules/webpack/bin/webpack.js --bail'
webpack_watch = './node_modules/webpack/bin/webpack.js --watch -d'
activate :external_pipeline,
  name: :webpack,
  command: build? ? webpack_build : webpack_watch,
  source: '.tmp/dist',
  latency: 1

ignore 'js/**/*'
ignore 'style/**/*'
