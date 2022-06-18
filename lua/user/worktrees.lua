local Worktree = require("git-worktree")
local Job = require("plenary.job")
--- Check if a file or directory exists in this path
local function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

Worktree.on_tree_change(function(op, metadata)
	if op == Worktree.Operations.Switch then
		-- print(metadata.prev_path)
		local ok = exists(vim.loop.cwd() .. "/package.json")
		if ok then
			local option = vim.fn.input("What to do with node_modules: ", "N")
			if option == "L" then
				local node_exist = exists(vim.loop.cwd() .. "/node_modules")
				if node_exist then
					Job
						:new({
							command = "rm",
							args = { "-r", vim.loop.cwd() .. "/node_modules" },
							cwd = vim.loop.cwd(),
						})
						:start()
				end
				Job
					:new({
						command = "ln",
						args = { "-sf", metadata.prev_path .. "/node_modules" },
						cwd = vim.loop.cwd(),
						on_exit = function()
							Job
								:new({
									command = "notify-send",
									args = { "Linked node_modules" },
								})
								:start()
						end,
					})
					:start()
			elseif option == "I" then
				Job
					:new({
						command = "yarn",
						cwd = vim.loop.cwd(),
						on_exit = function()
							Job
								:new({
									command = "notify-send",
									args = { "Linked node_modules" },
								})
								:start()
						end,
					})
					:start()
			end
		end
	end
end)
