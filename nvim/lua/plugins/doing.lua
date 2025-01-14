return {
	"Hashino/doing.nvim",
	cmd = "Do",
	keys = {
		{
			"<leader>Da",
			function()
				require("doing").add()
			end,
			desc = "Add task to Doing",
		},
		{
			"<leader>Dn",
			function()
				require("doing").done()
			end,
			desc = "Mark task as Done",
		},
		{
			"<leader>De",
			function()
				require("doing").edit()
			end,
			desc = "Edit task in Doing",
		},
	},
}
