const path = require('path');

module.exports = {
  entry: './index.js',  // Entry point of your application
  output: {
    filename: 'bundle.js',  // Output file name
    path: path.resolve(__dirname, 'dist'),  // Output directory
  },
  mode: 'development',  // Ensure the mode is set at the top level, not in resolve
  resolve: {
    fallback: {
      "http": require.resolve("stream-http"),
      "buffer": require.resolve("buffer/"),
      "url": require.resolve("url/"),
      // Add other necessary fallbacks here
    },
  },
};
