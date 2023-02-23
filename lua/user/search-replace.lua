local status_ok, search_replace = pcall(require, "search-replace")
if not status_ok then
  return
end

search_replace.setup {
  -- optionally override defaults
  default_replace_single_buffer_options = "gcI",
  default_replace_multi_buffer_options = "egcI",
}
