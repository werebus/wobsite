require 'pathname'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

webpack_build = './node_modules/webpack/bin/webpack.js --bail'
webpack_watch = './node_modules/webpack/bin/webpack.js --watch -d'
activate :external_pipeline,
  name: :webpack,
  command: build? ? webpack_build : webpack_watch,
  source: '.tmp/dist',
  latency: 1

::SassC.load_paths.concat [Pathname(__dir__).join('node_modules')]
