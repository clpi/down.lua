--- @class down.C
local C = {
  ---@type table<string, { [1]: fun(event: down.event, content: table|any), [2]?: fun(event: down.event): boolean }>
  callback_list = {},
}

--- Triggers a new callback to execute whenever an event of the requested type is executed.
--- @param event_name string The full path to the event we want to listen on.
--- @param callback fun(event: down.event, content: table|any) The function to call whenever our event gets triggered.
--- @param content_filter? fun(event: down.event): boolean # A filtering function to test if a certain event meets our expectations.
function C.on(event_name, callback, content_filter)
  -- If the table doesn't exist then create it
  C.callback_list[event_name] = C.callback_list[event_name] or {}
  -- Insert the callback and content filter
  require("table").insert(
    C.callback_list[event_name],
    { callback, content_filter }
  )
end

--- Used internally by down to call all C with an event.
--- @param event down.event An event as returned by `mod.new_event()`
--- @see mod.new_event
function C.handle(event)
  -- Query the list of registered C
  local callback_entry = C.callback_list[event.type]

  -- If the C exist then
  if callback_entry then
    -- Loop through every callback
    for _, callback in ipairs(callback_entry) do
      -- If the filter event has not been defined or if the filter returned true then
      if not callback[2] or callback[2](event) then
        -- Execute the callback
        callback[1](event, event.content)
      end
    end
  end
end

return C
