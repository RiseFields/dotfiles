return {
    "ariedov/android-nvim",
    config = function()
        -- OPTIONAL: specify android sdk directory
        vim.g.android_sdk = "/home/woutm/Android/Sdk"
        require('android-nvim').setup()
    end
}
