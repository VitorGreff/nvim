return {
  "Fildo7525/pretty_hover",
  event = "LspAttach",
  opts = {},
  keys = {
    {
      "<S-k>",
      function()
        require("pretty_hover").hover()
      end,
      desc = "pretty_hover",
    },
  }
}
