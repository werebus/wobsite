var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: {
    site: './source/javascripts/site.js'
  },

  resolve: {
    modules: [path.join(__dirname, 'source', 'javascripts'), 'node_modules'],
  },

  output: {
    path: path.join(__dirname, '.tmp', 'dist'),
    filename: 'javascripts/[name].js',
  },
};
