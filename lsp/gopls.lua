return {
  cmd = { "gopls" },
  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl",
  },
  root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
  settings = {
    gopls = {
      usePlaceholders = false,
      staticcheck = true,
      analyses = {
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedresult = true,
        unusedwrite = true,
        atomic = true,
        fieldalignment = true,
        ST1005 = true,
      },
      codelenses = {
        gc_details = true,
        generate = true,
        regenerate_cgo = true,
        references = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      directoryFilters = {
        "-node_modules",
        "-.git",
      },
    },
  },
}
