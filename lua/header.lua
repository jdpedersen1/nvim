-- Define function to insert header
local function insertHeader()
    -- Get current date and time
    local currentDateTime = os.date("%Y-%m-%d %H:%M:%S")
    -- Define the header content
    local header = "#!/usr/bin/env bash\n\n"
    .. "Created By: Jake@Linux\n"
    .. "Created On: " .. currentDateTime .. "\n"
    .. "Project Name: \n"
    .. "Project Desc:\n\n"

    -- Get current buffer
    local buf = vim.api.nvim_get_current_buf()
    -- Insert header at the beginning of the buffer
    vim.api.nvim_buf_set_lines(buf, 0, 0, false, {header})
end

-- Map the function to a keybinding
vim.api.nvim_set_keymap('n', '<Space>sb', ':lua insertHeader()<CR>', {noremap = true, silent = true})

