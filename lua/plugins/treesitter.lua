return
{
	"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install {"lua","javascript", "c", "c_sharp", "css", "html", "python"}
	end
}
