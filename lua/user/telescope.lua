require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("vim_bookmarks")
require("telescope").load_extension("refactoring")
lvim.builtin.telescope.defaults.file_ignore_patterns = {
	"vendor/*",
	"%.lock",
	"__pycache__/*",
	"%.sqlite3",
	"%.ipynb",
	"node_modules/*",
	"%.jpg",
	"%.jpeg",
	"%.png",
	"%.svg",
	"%.otf",
	"%.ttf",
	".git/",
	"%.webp",
	".dart_tool/",
	".github/",
	".gradle/",
	".idea/",
	".settings/",
	".vscode/",
	"__pycache__/",
	"build/",
	"env/",
	"gradle/",
	"node_modules/",
	"target/",
	"%.pdb",
	"%.dll",
	"%.class",
	"%.exe",
	"%.cache",
	"%.ico",
	"%.pdf",
	"%.dylib",
	"%.jar",
	"%.docx",
	"%.met",
	"smalljre_*/*",
	".vale/",
	"%.burp",
	"%.mp4",
	"%.mkv",
	"%.rar",
	"%.zip",
	"%.7z",
	"%.tar",
	"%.bz2",
	"%.epub",
	"%.flac",
	"%.tar.gz",
}
