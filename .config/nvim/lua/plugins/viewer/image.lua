-- > [!NOTE]
-- > written by Claude, could be broken!
return {
    "3rd/image.nvim",
    opts = {
        backend = "sixel",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown" },
            },
        },
    },
}
