-- Function to load a template for .cpp files
-- local function load_cpp_template()
--     local template_path = "/home/debraj/Desktop/DSA/CPSetup/Main_Boiler_Template.cpp"
--     local current_buf = vim.api.nvim_get_current_buf()

--     -- Check if the buffer is empty
--     if vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)[1] == "" then
--         -- Read the template and insert it into the buffer
--         local template = vim.fn.readfile(template_path)
--         vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, template)
--     end
-- end

-- -- Auto-command to trigger the template loading
-- vim.api.nvim_create_autocmd("BufNewFile", {
--     pattern = "*.cpp",
--     callback = load_cpp_template,
-- })
