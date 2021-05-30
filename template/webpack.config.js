const webpack = require('webpack');
const path = require('path');

const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

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
      filename: '_webpack_body.html',
      templateContent: ({htmlWebpackPlugin}) => `${htmlWebpackPlugin.tags.bodyTags}`,
      inject: false
    }),
    new HtmlWebpackPlugin({
      filename: '_webpack_head.html',
      templateContent: ({htmlWebpackPlugin}) => `${htmlWebpackPlugin.tags.headTags}`,
      inject: false
    }),
    new MiniCssExtractPlugin({
      filename: 'stylesheets/[name].[contenthash].css'
    })
  ],

  module: {
    rules: [
      {
        test: /\.(scss)$/,
        use: [
          MiniCssExtractPlugin.loader,
          { loader: 'css-loader' },
          { loader: 'postcss-loader' },
          { loader: 'sass-loader' }
        ]
      }
    ],
  }
};
