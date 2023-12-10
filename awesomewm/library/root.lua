---@meta

---awesome root window API
---ref: file:///usr/share/doc/awesome/doc/libraries/root.html
---@class root
root = {}

---Send fake keyboard or mouse events.
---Usually the currently focused client or the keybindings will receive those events. If a keygrabber or mousegrabber is running, then it will get them.
---@param event_type 'key_press'|'key_release'|'button_press'|'button_release'|'motion_notify'
---@param detail? string|boolean @in case of a key event, this is the keycode to send, in case of a button event this is the number of the button. In case of a motion event, this is a boolean value which if true makes the coordinates relatives.
---@param x? integer @In case of a motion event, this is the X coordinate.
---@param y? integer @In case of a motion event, this is the Y coordinate.
function root.fake_input(event_type, detail, x, y) end

---Get or set global key bindings. These bindings will be available when you press keys on the root window.
---@param keys_array? any[] @An array of key binding objects, or nothing.
---@return any[] @The array of key bindings objects of this client.
function root.keys(keys_array) end

---Get or set global mouse bindings. This binding will be available when you click on the root window.
---@param button_table? any[] @An array of mouse button bindings objects, or nothing.
---@return any[] @The array of mouse button bindings objects.
function root.buttons(button_table) end

---Set the root cursor
---@param cursor_name 'num_glyphs'|'cursor'|'arrow'|'basedarrowdown'|'basedarrowup'|'boat'|'bogosity'|'bottomleftcorner'|'bottomrightcorner'|'bottom_side'|'bottom_tee'|'box_spiral'|'center_ptr'|'circle'|'clock'|'coffee_mug'|'cross'|'cross_reverse'|'crosshair'|'diamond_cross'|'dot'|'dotbox'|'double_arrow'|'draft_large'|'draft_small'|'draped_box'|'exchange'|'fleur'|'gobbler'|'gumby'|'hand'|'hand'|'heart'|'icon'|'iron_cross'|'left_ptr'|'left_side'|'left_tee'|'leftbutton'|'ll_angle'|'lr_angle'|'man'|'middlebutton'|'mouse'|'pencil'|'pirate'|'plus'|'question_arrow'|'right_ptr'|'right_side'|'right_tee'|'rightbutton'|'rtl_logo'|'sailboat'|'sbdownarrow'|'sbhdouble_arrow'|'sbleftarrow'|'sbrightarrow'|'sbuparrow'|'sbvdouble_arrow'|'shuttle'|'sizing'|'spider'|'spraycan'|'star'|'target'|'tcross'|'topleftarrow'|'topleftcorner'|'toprightcorner'|'top_side'|'top_tee'|'trek'|'ul_angle'|'umbrella'|'ur_angle'|'watch'|'xterm'
function root.cursor(cursor_name) end

---Get the drawins attached to a screen.
---@return any[] @A table with all drawins.
function root.drawins() end

---Get the wallpaper as a cairo surface or set it as a cairo pattern.
---@param pattern any @A cairo pattern as light userdata
---@return userdata? @A cairo surface or nothing.
function root.wallpaper(pattern) end

---Get the size of the root window.
---@return integer,integer @Width,height of the root window.
function root.size() end

---Get the physical size of the root window, in millimeter.
---@return integer,integer @Width,height of the root window, in millimeters.
function root.size_mm() end

---Get the attached tags.
---@return any[]
function root.tags() end
