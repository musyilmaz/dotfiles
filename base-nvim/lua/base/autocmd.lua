local utils = {}

function utils.empty_buff()
  vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
      if vim.bo.filetype ~= "" then -- Check if the buffer has a filetype
        return
      end

      -- if it doesn't we check if it is empty
      if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
        vim.cmd("NeoTreeFocusToggle")
      end
    end,
  })
end

return utils
