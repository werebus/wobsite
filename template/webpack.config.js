var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: {
    js: './source/js/site.js',
    style: './source/style/site.css.scss'
  },

  resolve: {
    modules: [path.join(__dirname, 'source', 'javascripts'), 'node_modules'],
  },

  output: {
    path: path.join(__dirname, '.tmp', 'dist'),
    filename: 'javascripts/[name].js',
  },

  module: {
    rules: [
      {
        test: /\.(scss)$/,
        use: [
          { loader: 'style-loader' },
          { loader: 'css-loader' },
          {
            loader: 'postcss-loader',
            options: {
              plugins: function () {
                return [require('autoprefixer')];
              }
            }
          },
          { loader: 'sass-loader' }
        ]
      }
    ],
  }
};
