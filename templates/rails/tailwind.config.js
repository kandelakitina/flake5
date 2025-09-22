module.exports = {
  content: [
    "./app/views/**/*.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/**/*.js",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("daisyui")
  ],
  daisyui: {
    themes: ["light", "dark", "cupcake"],   // or any theme(s) you like
  }
}
