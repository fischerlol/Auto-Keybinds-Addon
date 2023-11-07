# Auto Keybind Configuration for WoW

This Lua script provides a configuration for automatic keybindings in World of Warcraft. It sets up custom keybindings upon player login.

## Features

- Automatically binds keys to action bars on login.
- Allows custom key bindings for five action bars.
- Unbinds primary action paging keys and secondary movement keys.
- Provides functionality to bind and unbind keys.

## How It Works

The script uses predefined arrays for each action bar (`action_bar_one`, `action_bar_two`, etc.) and for other functionalities like `action_paging` and `movement`.

On the `PLAYER_LOGIN` event, the script:
- Binds the keys as per the configurations.
- Unbinds action paging and movement keys.
- Binds a specific key for the guild pane.
- Binds a specific key for auto-run.

## Usage

To use this script:
1. Rename AddOn to AutoKeybind and move it to your World of Warcraft add-on directory.
2. Customize the keybindings within the script as needed.
3. The script will automatically set your keybindings when you log into the game.

## Customization

You can modify the action bar keybindings arrays and the `movement` and `action_paging` arrays to change the default keys.

For example:
```
action_bar_one = {
    1, 2, 3, 4, 5, 'T', 'G', '`', 'SHIFT-X', 'ALT-C', 'SHIFT-C', 'Z'
}
```
Replace the keys within the arrays with your desired keybindings.

## Contributions
Feel free to fork the project and submit pull requests with enhancements or fixes.

License
This project is open-source and available under the MIT License.

