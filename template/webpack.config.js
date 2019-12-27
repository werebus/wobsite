const webpack = require('webpack');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

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
    filename: 'javascripts/[name].[contenthash].js',
  },

  optimization: {
    runtimeChunk: 'single'
  },

  plugins: [
    new CleanWebpackPlugin(),
    new HtmlWebpackPlugin({
      filename: '_scripts.html',
      template: 'scripts.ejs',
      inject: false
    })
  ],

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
