return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true, -- 显示隐藏文件
          ignored = false, -- ✅ 显示 gitignored 文件
        },
        grep = {
          hidden = true,
          ignored = false, -- grep 时也包含 ignored 文件
        },
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
