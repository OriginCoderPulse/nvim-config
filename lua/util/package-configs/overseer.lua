return {
	repo = "AllenSpaces/OverseerForTelescope.nvim",
	config = function()
		local status, overseer = pcall(require, "overseer")
		if not status then
			vim.notify("overseer is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		overseer.setup({
			dap = false,
			templates = { "cmake", "npm", "cargo", "sh" },
			task_list = {
				direction = "left",
			},
		})

		overseer.add_template_hook({
			module = "^make$",
		}, function(task_defn, util)
			util.add_component(task_defn, "task_list_on_start")

			util.add_component(task_defn, {
				"on_output_write_file",
				filename = task_defn.cmd[1] .. ".log",
			})

			util.add_component(task_defn, {
				"on_output_quickfix",
				open_on_exit = "failure",
			})

			util.add_component(task_defn, "on_complete_notify")

			util.add_component(task_defn, {
				"display_duration",
				detail_level = 1,
			})

			util.add_component(task_defn, "unique")

			util.remove_component(task_defn, "on_output_summarize")
		end)

		overseer.add_template_hook({
			module = "^remake Fit$",
		}, function(task_defn, util)
			util.add_component(task_defn, "unique")
		end)
	end,
}
