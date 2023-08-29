auto_keybind = auto_keybind or {}

local on_login_frame = CreateFrame("Frame")

on_login_frame:RegisterEvent("PLAYER_LOGIN")

action_bar_one = {
    1, 2, 3, 4, 5, 'T', 'G', '`', 'SHIFT-X', 'ALT-C', 'SHIFT-C', 'Z'
}

action_bar_two = {
    'SHIFT-Q', 'X', 'V', 'SHIFT-V', 'CTRL-V', 'SHIFT-1', 'SHIFT-2', 'ALT-V', 'R', 'SHIFT-R', 'SHIFT-F', 'F'
}

action_bar_three = {
    'F1', 'F2', 'F3', 'ALT-NUMPAD1', 'SHIFT-G', 'F4', false, 'NUMPAD7', 'NUMPAD6', 'NUMPADDIVIDE','NUMPADMULTIPLY', false
}

action_bar_four = {
    'SHIFT-A', 'SHIFT-Z', 'H', 'SHIFT-H', 'NUMPAD2', 'NUMPAD4', 'Y', 'NUMPAD3', 'ALT-W', 'END', 'CTRL-NUMPAD1'
}

action_bar_five = {
    'ALT-1', 'ALT-2', 'ALT-3', 'ALT-4', 'SHIFT-D', 'SHIFT-E', 'CTRL-E', 'CTRL-W', 'SHIFT-W', false, 'SHIFT-T', 'NUMPAD1'
}

auto_keybind.bars = {
    action_bar_one,
    action_bar_two,
    action_bar_three,
    action_bar_four,
    action_bar_five
}

on_login_frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        auto_keybind.set_keybinds()
        print("Keybinds Set!")
    end
end)

function auto_keybind.set_keybinds()
    local action_bars = {
        "ACTIONBUTTON",
        "MULTIACTIONBAR1BUTTON",
        "MULTIACTIONBAR2BUTTON",
        "MULTIACTIONBAR3BUTTON",
        "MULTIACTIONBAR4BUTTON"
    }

    local action_bar_index = 1
    for _, bar in ipairs(auto_keybind.bars) do
        local current_bar_prefix = action_bars[action_bar_index]
        for slot, keybind in ipairs(bar) do
            if keybind then
                SetBinding(keybind, current_bar_prefix .. slot)
            end
        end
        action_bar_index = action_bar_index + 1
    end
    SaveBindings(2)
end