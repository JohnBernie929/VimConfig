local status_ok, tailwindcss_colorizer = pcall(require, 'tailwindcss-colorizer-cmp')
if not status_ok then
  return
end

tailwindcss_colorizer.setup()
