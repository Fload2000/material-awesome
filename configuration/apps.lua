local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'konsole',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'konsole',
    screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = 'sleep 10 ; ~/.config/awesome/configuration/utils/screenshot -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'firefox',
    mail = 'thunderbird',
    editor = 'kate', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'dolphin',
    music = rofi_command
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet', -- wifi
    --'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    'scream -u -p 4011 -i virbr1', -- scream audio sink
    'numlockx on', -- enable numlock
    --'/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    '/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager KDE
    -- MATE'/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
     'flameshot',
     'steam -silent',
     'discord',
     'thunderbird',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    --'~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
