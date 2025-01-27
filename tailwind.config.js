const { plugin } = require("postcss");

module.exports = {
  content: [
    '../Group1/app/views/**/*.html.erb',
    '../Group1/app/helpers/**/*.rb',
    '../Group1/app/assets/stylesheets/**/*.css',
    '../Group1/app/javascript/**/*.js'
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
