local overseer = require("overseer")

return {
	name = "Spring Run Test",
	builder = function()
		return {
			cmd = { "./gradlew" },
			args = { "bootTestRun" },
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
	desc = "bootTestRun",
	tags = { overseer.TAG.BUILD },
	params = {},
	priority = 50,
	condition = {
		filetype = { "java", "gradle", "kts", "xml" },
	},
}
