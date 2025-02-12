return { 
	"ellisonleao/gruvbox.nvim", 
	priority = 1000 , 
	config = true, 
	config = function()
		vim.o.background = "dark"
		vim.cmd("colorscheme gruvbox")
		vim.opt.fillchars:append { eob = " " }
	end,
}
