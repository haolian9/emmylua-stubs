---@meta

---Notification library
---ref: file:///usr/share/doc/awesome/doc/libraries/naughty.html
---@class naughty
---
---@field config naughty.Config @a table containing common popup settings.
---@field notifications naughty.Notification[] @Index of notifications per screen and position.
naughty = {}

---Notification state
function naughty.is_suspended() end

---Suspend notifications
function naughty.suspend() end

---Resume notifications
function naughty.resume() end

---Toggle notification state
function naughty.toggle() end

---Destroy notification by notification object
---@param notification any @Notification object to be destroyed
---@param reason any @One of the reasons from notificationClosedReason
---@param keep_visible? boolean @If true, keep the notification visible (default false)
---@return true? @True if the popup was successfully destroyed, nil otherwise
function naughty.destroy(notification, reason, keep_visible) end

function naughty.destroy_all_notifications(screens, reason) end
---Destroy all notifications on given screens.
---@param screens? any[] @Table of screens on which notifications should be destroyed. If nil, destroy notifications on all screens.
---@param reason any @naughty.notificationClosedReason Reason for closing notifications.
---@return true? @True if all notifications were successfully destroyed, nil otherwise.

---Get notification by ID
---@param id any @ID of the notification
---@return userdata? @notification object if it was found, nil otherwise
function naughty.getById(id) end

---Increase notification ID by one
function naughty.get_next_notification_id() end

---Set new notification timeout.
---@param notification any @Notification object, which timer is to be reset.
---@param new_timeout integer @Time in seconds after which notification disappears.
function naughty.reset_timeout(notification, new_timeout) end

---Replace title and text of an existing notification.
---@param notification any @Notification object, which contents are to be replaced.
---@param new_title string @New title of notification. If not specified, old title remains unchanged.
---@param new_text string @New text of notification. If not specified, old text remains unchanged.
function naughty.replace_text(notification, new_title, new_text) end

---@class naughty.NotifyArgs
---@field text?          string  @Text of the notification. (default "")
---@field title?         string  @Title of the notification. (optional)
---@field timeout?       integer @Time in seconds after which popup expires. Set 0 for no timeout. (default 5)
---@field hover_timeout? integer @Delay in seconds after which hovered popup disappears. (optional)
---@field screen?        integer @or screen Target screen for the notification. (default focused)
---@field position 'top_right'|'top_left'|'bottom_left'|'bottom_right'|'top_middle'|'bottom_middle' @Corner of the workarea displaying the popups. (default "top_right")
---@field ontop?         boolean @Boolean forcing popups to display on top. (default true)
---@field height?        integer @Popup height. (default `beautiful.notification_height` or auto)
---@field width?         integer @Popup width. (default `beautiful.notification_width` or auto)
---@field max_height?    integer @Popup maximum height. (default `beautiful.notification_max_height` or auto)
---@field max_width?     integer @Popup maximum width. (default `beautiful.notification_max_width` or auto)
---@field font?          string  @Notification font. (default `beautiful.notification_font` or `beautiful.font` or `awesome.font`)
---@field icon?          string  @Path to icon. (optional)
---@field icon_size?     integer @Desired icon size in px. (optional)
---@field fg?            string  @Foreground color. (default `beautiful.notification_fg` or `beautiful.fg_focus` or `'#ffffff'`)
---@field bg?            string  @Background color. (default `beautiful.notification_fg` or `beautiful.bg_focus` or `'#535d6c'`)
---@field border_width?  integer @Border width. (default `beautiful.notification_border_width` or 1)
---@field border_color?  string  @Border color. (default `beautiful.notification_border_color` or `beautiful.border_focus` or `'#535d6c'`)
---@field shape?         any     @gears.shape Widget shape. (default `beautiful.notification_shape`)
---@field opacity?       any     @gears.opacity Widget opacity. (default `beautiful.notification_opacity`)
---@field margin?        any     @gears.margin Widget margin. (default `beautiful.notification_margin`)
---@field run?           fun()   @Function to run on left click. The notification object will be passed to it as an argument. You need to call e.g. notification.die(naughty.notificationClosedReason.dismissedByUser) from there to dismiss the notification yourself. (optional)
---@field destroy?       fun()   @Function to run when notification is destroyed. (optional)
---@field preset?        table   @Table with any of the above parameters. Note: Any parameters specified directly in args will override ones defined in the preset. (optional)
---@field replaces_id?   integer @Replace the notification with the given ID. (optional)
---@field callback?      func    @Function that will be called with all arguments. The notification will only be displayed if the function returns true. Note: this function is only relevant to notifications sent via dbus. (optional)
---@field actions?       table   @Mapping that maps a string to a callback when this action is selected. (optional)
---@field ignore_suspend boolean @If set to true this notification will be shown even if notifications are suspended via naughty.suspend. (default false)

---Create a notification.
---@param args naughty.NotifyArgs
---@return table? @The notification object, or nil in case a notification was not displayed.
function naughty.notify(args) end

---@class naughty.Config
---
---@field padding?      integer  @Space between popups and edge of the workarea. (default apply_dpi(4))
---@field spacing?      integer  @Spacing between popups. (default apply_dpi(1))
---@field icon_dirs?    string[] @List of directories that will be checked by getIcon(). (default {"/usr/share/pixmaps/"})
---@field icon_formats? string[] @List of formats that will be checked by getIcon(). (default { "png")
---
---Callback used to modify or reject notifications
---To reject a notification return nil from the callback. If the notification is a freedesktop notification received via DBUS, you can access the freedesktop hints via args.freedesktop_hints if any where specified. (optional)
---@field notify_callback? fun(args: naughty.NotifyArgs): naughty.NotifyArgs?
---
---@field presets naughty.ConfigPresets @Notification presets.
---@field defaults naughty.ConfigDefaults @Default values for the params to notify(). These can optionally be overridden by specifying a preset.
naughty.Config = {}

---ref: file:///usr/share/doc/awesome/doc/libraries/naughty.html#config.presets
---@class naughty.ConfigPresets: naughty.NotifyArgs
---@field low any
---@field normal any
---@field critical any
naughty.ConfigPresets = {}

---@class naughty.ConfigDefaults
---@field timeout      integer (default 5)
---@field text         string  (default "")
---@field screen       integer Defaults to awful.screen.focused. (optional)
---@field ontop        boolean (default true)
---@field margin       integer (default apply_dpi(5))
---@field border_width integer (default apply_dpi(1))
---@field position     string  (default "top_right")
naughty.ConfigDefaults = {}

---@class naughty.Notification
---@field box any @Wibox object containing the popup
---@field height integer @Popup height
---@field width integer @Popup width
---@field die fun() @Function to be executed on timeout
---@field id any @Unique notification id based on a counter
naughty.Notification = {}
