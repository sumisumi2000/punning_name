module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    fontFamily: {
      dela: ["Dela Gothic One"],
      kaisei: ["Kaisei Decol"],
      noto: ["Noto Sans Japanese"],
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    darkTheme: false,
  },
};
