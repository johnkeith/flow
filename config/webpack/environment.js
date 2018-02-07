const { environment } = require('@rails/webpacker')

const babelLoader = environment.loaders.get('babel')

environment.loaders.insert('svg', {
  test: /\.svg$/,
  use: babelLoader.use.concat([
    {
      loader: 'react-svg-loader',
      options: {
        jsx: true // true outputs JSX tags
      }
    }
  ])
}, { after: 'file' })

const fileLoader = environment.loaders.get('file')
fileLoader.exclude = /\.(svg)$/i

module.exports = environment
