local status_ok, everforest = pcall(require, "everforest")
if not status_ok then
  return
end

everforest.setup({
  background = "hard",
})

everforest.load()
