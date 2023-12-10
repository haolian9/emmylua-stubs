---@meta _

---@alias _awesome_signals
---| "debug::error"          # A call into the Lua code aborted with an error.
---| "debug::deprecation"    # A deprecated Lua function was called.
---| "debug::index::miss"    # An invalid key was read from an object.
---| "debug::newindex::miss" # An invalid key was written to an object.
---| "systray::update"       # The systray should be updated.
---| "wallpaper_changed"     # The wallpaper has changed.
---| "xkb::map_changed"      # Keyboard map has changed.
---| "xkb::group_changed"    # Keyboard group has changed.
---| "refresh"               # Refresh. This signal is emitted as a kind of idle signal in the event loop.
---| "startup"               # AwesomeWM is about to enter the event loop.
---| "exit"                  # AwesomeWM is exiting / about to restart.
---| "screen::change"        # The output status of a screen has changed.
---| "spawn::canceled"       # For some reason the application aborted startup
---| "spawn::change"         # When one of the fields from the spawn::initiated table changes
---| "spawn::completed"      # An application finished starting
---| "spawn::initiated"      # When a new client is beginning to start
---| "spawn::timeout"        # An application started a spawn event but didn't start in time.

---@alias _client_signals
---| "scanning" # Emitted when AwesomeWM is about to scan for existing clients.
---| "scanned" # Emitted when AwesomeWM is done scanning for clients.
---| "focus" # Emitted when a client gains focus.
---| "list" # Emitted before request::manage, after request::unmanage, and when clients swap.
---| "swapped" # Emitted when 2 clients are swapped
---| "request::manage" # Emitted when a new client appears and gets managed by Awesome.
---| "request::unmanage" # Emitted when a client is going away.
---| "button::press" # Emitted when a mouse button is pressed in a client.
---| "button::release" # Emitted when a mouse button is released in a client.
---| "mouse::enter" # Emitted when the mouse enters a client.
---| "mouse::leave" # Emitted when the mouse leaves a client.
---| "mouse::move" # Emitted when the mouse moves within a client.
---| "request::activate" # Emitted when a client should get activated (focused and/or raised).
---| "request::autoactivate" # Emitted when an event could lead to the client being activated.
---| "request::geometry" # Emitted when something request a client's geometry to be modified.
---| "request::tag" # Emitted when a client requests to be moved to a tag or needs a new tag.
---| "request::urgent" # Emitted when any client's urgent property changes.
---| "request::default_mousebindings" # Emitted once to request default client mousebindings during the initial startup sequence.
---| "request::default_keybindings" # Emitted once to request default client keybindings during the initial startup sequence.
---| "tagged" # Emitted when a client gets tagged.
---| "unfocus" # Emitted when a client gets unfocused.
---| "untagged" # Emitted when a client gets untagged.
---| "raised" # Emitted when the client is raised within its layer.
---| "lowered" # Emitted when the client is lowered within its layer.
---| "property::floating_geometry" # The last geometry when client was floating.
---| "request::titlebars" # Emitted when a client need to get a titlebar.
---| "request::border" # Emitted when the border client might need to be update.

---@alias client_signals
---| "request::manage" # Emitted when a new client appears and gets managed by Awesome.
---| "request::unmanage" # Emitted when a client is going away.
---| "property::window"
---| "property::name"
---| "property::skip_taskbar"
---| "property::type"
---| "property::class"
---| "property::instance"
---| "property::pid"
---| "property::role"
---| "property::machine"
---| "property::icon_name"
---| "property::icon"
---| "property::icon_sizes"
---| "property::screen"
---| "property::hidden"
---| "property::minimized"
---| "property::size_hints_honor"
---| "property::border_width"
---| "property::border_color"
---| "property::urgent"
---| "property::opacity"
---| "property::ontop"
---| "property::above"
---| "property::below"
---| "property::fullscreen"
---| "property::maximized"
---| "property::maximized_horizontal"
---| "property::maximized_vertical"
---| "property::transient_for"
---| "property::group_window"
---| "property::leader_window"
---| "property::size_hints"
---| "property::motif_wm_hints"
---| "property::sticky"
---| "property::modal"
---| "property::focusable"
---| "property::shape_bounding"
---| "property::shape_clip"
---| "property::shape_input"
---| "property::client_shape_bounding"
---| "property::client_shape_clip"
---| "property::startup_id"
---| "property::valid"
---| "property::first_tag"
---| "property::buttons"
---| "property::keys"
---| "property::marked"
---| "property::is_fixed"
---| "property::floating"
---| "property::geometry"
---| "property::size"
---| "property::position"
---| "property::x"
---| "property::y"
---| "property::width"
---| "property::height"
---| "property::dockable"
---| "property::requests_no_titlebar"
---| "property::shape"

---@alias _drawable_signals
---| "button::press"
---| "button::release"
---| "mouse::enter"
---| "mouse::leave"
---| "mouse::move"
---| "property::geometry"
---| "property::height"
---| "property::width"
---| "property::x"
---| "property::y"
---| "property::surface"

---@alias _screen_signals
---| "scanning" # AwesomeWM is about to scan for existing screens.
---| "scanned" # AwesomeWM is done scanning for screens.
---| "primary_changed"
---| "added" # This signal is emitted when a new screen is added to the current setup.
---| "removed" # This signal is emitted when a screen is removed from the setup.
---| "list" # This signal is emitted when the list of available screens changes.
---| "swapped" # When 2 screens are swapped
---| "property::viewports" # This signal is emitted when the list of physical screen viewport changes.
---| "request::desktop_decoration" # Emitted when a new screen is added.
---| "request::wallpaper" # Emitted when a new screen needs a wallpaper.
---| "request::create" # When a new (physical) screen area has been added.
---| "request::remove" # When a physical monitor viewport has been removed.
---| "request::resize" # When a physical viewport resolution has changed or it has been replaced.
---| "tag::history::update" # When the tag history changed.

---@alias screen_signals
---| "property::geometry"
---| "property::index"
---| "property::workarea"
---| "property::padding"
---| "property::outputs"

---@alias _tag_signals
---| "request::select" # Emitted when a tag requests to be selected.
---| "request::default_layouts" # This signal is emitted to request the list of default layouts.
---| "request::layouts" # This signals is emitted when a tag needs layouts for the first time.
---| "tagged" # Emitted when a client gets tagged with this tag.
---| "untagged" # Emitted when a client gets untagged with this tag.
---| "cleared" # Emitted when all clients are removed from the tag.
---| "property::urgent" # Emitted when the number of urgent clients on this tag changes.
---| "property::urgent_count" # Emitted when the number of urgent clients on this tag changes.
---| "request::screen" # Emitted when a screen is removed.
---| "removal-pending" # Emitted after request::screen if no new screen has been set. The tag will be deleted, this is a last chance to move its clients before they are sent to a fallback tag. Connect to request::screen if you wish to salvage the tag.

---@alias tag_signals
---| "property::name"
---| "property::selected"
---| "property::activated"
---| "property::index"
---| "property::screen"
---| "property::master_width_factor"
---| "property::layout"
---| "property::volatile"
---| "property::gap"
---| "property::gap_single_client"
---| "property::master_fill_policy"
---| "property::master_count"
---| "property::icon"
---| "property::column_count"
