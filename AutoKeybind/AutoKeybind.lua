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
    'F1', 'F2', 'F3', 'ALT-NUMPAD1', 'SHIFT-G', 'F4', 'ALT-G', 'NUMPAD7', 'NUMPAD6', 'NUMPADDIVIDE', false, false
}

action_bar_four = {
    'SHIFT-A', 'SHIFT-Z', 'H', 'SHIFT-H', 'NUMPAD2', 'NUMPAD4', 'Y', 'NUMPAD3', 'ALT-W', 'END', 'CTRL-NUMPAD1'
}

action_bar_five = {
    'ALT-1', 'ALT-2', 'ALT-3', 'ALT-4', 'SHIFT-D', 'SHIFT-E', 'CTRL-E', 'CTRL-W', 'SHIFT-W', false, 'SHIFT-T', 'NUMPAD1'
}

action_bar_six = {
    'CTRL-1', 'CTRL-2', 'CTRL-3', false, false, false, false, false, false, false, false, false
}

auto_keybind.bars = {
    action_bar_one,
    action_bar_two,
    action_bar_three,
    action_bar_four,
    action_bar_five,
    action_bar_six,
}

action_paging = {
    'ACTIONPAGE1', 'ACTIONPAGE2', 'ACTIONPAGE3', 'ACTIONPAGE4', 'ACTIONPAGE5', 'PREVIOUSACTIONBAR', 'NEXTACTIONBAR'
}

movement = {
    'MOVEFORWARD', 'MOVEBACKWARD', 'TURNLEFT', 'TURNRIGHT', 'JUMP'
}

on_login_frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- bind keys
        auto_keybind.set_keybinds()

        -- unbind primary action paging keys
        auto_keybind.unbind_keys(action_paging, true, true)

        -- unbind secondary movement keys
        auto_keybind.unbind_keys(movement, false, true)

        -- bind guild pane
        auto_keybind.bind_specific_key('TOGGLEGUILDPANE', 'J', false)

        -- bind auto run
        auto_keybind.bind_specific_key('TOGGLEAUTORUN', 'NUMPAD5', true)

        print("Keybinds Set!")
    end
end)

function auto_keybind.bind_specific_key(action, keybind, is_secondary)
    local key_1, key_2 = GetBindingKey(action)

    if not is_secondary or not key_1 then
        SetBinding(keybind, action)
    else
        if key_2 then
            SetBinding(key_2)
        end
        SetBinding(keybind, action)
    end

    SaveBindings(2)
end

function auto_keybind.unbind_keys(group, primary, secondary)
    for _, keybind in ipairs(group) do
        local key_1, key_2 = GetBindingKey(keybind)

        if primary and key_1 then
            SetBinding(key_1)
        end

        if secondary and key_2 then
            SetBinding(key_2)
        end
    end
end

function auto_keybind.set_keybinds()
    local action_bars = {
        "ACTIONBUTTON",
        "MULTIACTIONBAR1BUTTON",
        "MULTIACTIONBAR2BUTTON",
        "MULTIACTIONBAR3BUTTON",
        "MULTIACTIONBAR4BUTTON",
        "ELVUIBAR2BUTTON"
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
    SaveBindings(1)
    SaveBindings(2)
end