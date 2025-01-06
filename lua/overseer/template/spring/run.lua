local overseer = require("overseer")

return {
	name = "Spring Run",
	builder = function()
		return {
			cmd = { "./gradlew" },
			args = { "bootRun" },
			name = "gradle",
			cwd = "",
			strategy = {
				"terminal",
				auto_scroll = false,
			},
			components = { "default" },
			metadata = {
				foo = "bar",
			},
		}
	end,
	desc = "bootRun",
	tags = { overseer.TAG.BUILD },
	params = {},
	priority = 50,
	condition = {
		filetype = { "java", "gradle", "kts", "xml" },
	},
}
