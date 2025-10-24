return require("schema-companion").setup_client(
	require("schema-companion").adapters.yamlls.setup({
		sources = {
			-- your sources for the language server
			require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
			require("schema-companion").sources.lsp.setup(),
			require("schema-companion").sources.schemas.setup({
				{
					name = "Kubernetes",
					uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
				},
				{
					name = "Gitlab",
					uri = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
				},
			}),
		},
	}),

	-- lsp configuration
	{
		settings = {
			yaml = {
				customTags = {
					"!reference",
					"!reference sequence",
					"!override",
					"!reset sequence",
				},
			},
		},
	}
)
