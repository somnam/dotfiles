local config = require("util.config")

local function set_lsp_options()
  local log_level = config.get("lsp.log_level")
  if log_level ~= nil then
    vim.lsp.set_log_level(log_level)
  end
end

---@param event vim.api.keyset.create_autocmd.callback_args
---@return vim.lsp.Client?
local function get_lsp_client_from_event(event)
  local client_id = vim.tbl_get(event, "data", "client_id")
  return client_id and vim.lsp.get_client_by_id(client_id) or nil
end

---@param event vim.api.keyset.create_autocmd.callback_args
---@param delay integer?
local function setup_lsp_highlight_symbol(event, delay)
  vim.validate("delay", delay, "number", true)
  delay = delay or 500

  local client = get_lsp_client_from_event(event)
  if not (client and client:supports_method("textDocument/documentHighlight", event.buf)) then
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

  if vim.go["updatetime"] > delay then
    vim.go.updatetime = delay
  end
end

---@param event vim.api.keyset.create_autocmd.callback_args
local function setup_lsp_inlay_hints(event)
  local client = get_lsp_client_from_event(event)
  if not (client and client:supports_method("textDocument/inlayHint")) then
    return
  end

  vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
end

set_lsp_options()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_setup", { clear = true }),
  callback = function(event)
    setup_lsp_highlight_symbol(event)
    setup_lsp_inlay_hints(event)
  end,
})
