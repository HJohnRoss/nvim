return {
	"seblyng/roslyn.nvim",
	ft = "cs", -- Only load for C# files
	opts = {
		-- Your configuration goes here
		config = {
			settings = {
				["csharp|completion"] = {
					showCompletionItemsFromUnimportedNamespaces = true,
					provideDefaultRelevantCompletionItems = true,
				},
			},
		},
	},
}
