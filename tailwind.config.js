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
    extend: {
      animation: {
        "text-pop-up-top":
          "text-pop-up-top 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940)   both",
      },
      keyframes: {
        "text-pop-up-top": {
          "0%": {
            transform: "translateY(0)",
            "transform-origin": "50% 50%",
            "text-shadow": "none",
          },
          to: {
            transform: "translateY(-5px)",
            "transform-origin": "50% 50%",
            "text-shadow":
              "0 1px 0 #ccc, 0 2px 0 #ccc, 0 3px 0 #ccc, 0 4px 0 #ccc, 0 5px 0 #ccc, 0 6px 0 #ccc, 0 7px 0 #ccc, 0 8px 0 #ccc, 0 9px 0 #ccc, 0 20px 30px rgba(0, 0, 0, .1)",
          },
        },
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    darkTheme: false,
    themes: ["autumn"],
  },
};
