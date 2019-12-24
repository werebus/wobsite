# frozen_string_literal: true

webpack_build = './node_modules/webpack/bin/webpack.js --bail'
webpack_watch = './node_modules/webpack/bin/webpack.js --watch -d'
activate :external_pipeline,
  name: :webpack,
  command: build? ? webpack_build : webpack_watch,
  source: '.tmp/dist',
  latency: 1
