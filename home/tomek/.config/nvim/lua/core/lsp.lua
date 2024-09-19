local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
  "n",
  "grn",
  ":lua vim.lsp.buf.rename()<Enter>",
  vim.tbl_extend("keep", { desc = "Rename all symbol references" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "grs",
  ":lua vim.lsp.buf.document_symbol()<Enter>",
  vim.tbl_extend("keep", { desc = "List all current buffer symbols" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "grr",
  ":lua vim.lsp.buf.references()<Enter>",
  vim.tbl_extend("keep", { desc = "List all symbol references" }, opts)
)
vim.api.nvim_set_keymap(
  "n",
  "gra",
  ":lua vim.lsp.buf.code_action()<Enter>",
  vim.tbl_extend("keep", { desc = "Select code action at cursor position" }, opts)
)
vim.api.nvim_set_keymap(
  "i",
  "<C-S>",
  "<cmd>lua vim.lsp.buf.signature_help()<Enter>",
  vim.tbl_extend("keep", { desc = "Display signature of the symbol" }, opts)
)

local H = {}

H.set_lsp_handlers_style = function()
  local handlers = {
    ["textDocument/hover"] = vim.lsp.handlers.hover,
    ["textDocument/signatureHelp"] = vim.lsp.handlers.signature_help,
  }
  local handlers_style = { focusable = true, style = "minimal", border = "rounded" }
  for name, handler in pairs(handlers) do
    vim.lsp.handlers[name] = vim.lsp.with(handler, handlers_style)
  end
end

H.set_lsp_options = function()
  vim.lsp.set_log_level("ERROR")
end

H.get_lsp_client_from_event = function(event)
  local client_id = vim.tbl_get(event, "data", "client_id")
  return client_id and vim.lsp.get_client_by_id(client_id) or nil
end

H.setup_lsp_highlight_symbol = function(delay)
  vim.validate({ delay = { delay, "number", true } })
  delay = delay or 500

  local function setup_lsp_highlight_symbol(event)
    local client = H.get_lsp_client_from_event(event)
    if not (client and client.supports_method("textDocument/documentHighlight")) then
      return
    end

    local group = vim.api.nvim_create_augroup("lsp_highlight_symbol", { clear = false })
    vim.api.nvim_clear_autocmds({ buffer = event.buf, group = group })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = event.buf,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = group,
      buffer = event.buf,
      callback = vim.lsp.buf.clear_references,
    })

    if vim.opt.updatetime:get() > delay then
      vim.opt.updatetime = delay
    end
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("lsp_setup_highlight_symbol", { clear = true }),
    callback = setup_lsp_highlight_symbol,
  })
end

H.setup_lsp_inlay_hints = function()
  local function setup_lsp_inlay_hints(event)
    local client = H.get_lsp_client_from_event(event)
    if not (client and client.supports_method("textDocument/inlayHint")) then
      return
    end

    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("lsp_setup_inlay_hints", { clear = true }),
    callback = setup_lsp_inlay_hints,
  })
end

H.set_lsp_options()
H.set_lsp_handlers_style()
H.setup_lsp_highlight_symbol()
H.setup_lsp_inlay_hints()
