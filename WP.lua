local function printError(message)
  print("Error: " .. message)
end

local function getCoordinates(numbers)
  local x = numbers[1] and math.floor(numbers[1] * 100 + 0.5) / 100
  local y = numbers[2] and math.floor(numbers[2] * 100 + 0.5) / 100
  return x, y
end

local function setWaypoint(zoneID, x, y, order, description)
  if C_Map.CanSetUserWaypointOnMap(zoneID) then
    local vector = CreateVector2D(x / 100, y / 100)
    local mapPoint = UiMapPoint.CreateFromVector2D(zoneID, vector)
    C_Map.SetUserWaypoint(mapPoint)
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    print(string.format("Waypoint %d set at: |cffffff00%.2f, %.2f|r%s", order, x, y, description ~= "" and (" - |cffffa500" .. description .. "|r") or ""))
  else
    printError("Cannot set waypoints on this map.")
  end
end

local function Waypoint(args, editbox)
  args = strtrim(args)

  if args == "me" then
    local mapID = C_Map.GetBestMapForUnit("player")
    local mapInfo = C_Map.GetMapInfo(mapID)
    local position = C_Map.GetPlayerMapPosition(mapID, "player")

    if mapInfo and position then
      local mapName = mapInfo.name
      local x = math.floor(position.x * 10000 + 0.5) / 100
      local y = math.floor(position.y * 10000 + 0.5) / 100
      print(string.format("You are currently in |cffffa500%s|r at coordinates: |cffffff00%.2f, %.2f|r", mapName, x, y))
    else
      printError("Cannot determine your current location.")
    end
  else
    local zoneID, x, y, order, description
    local inputs = {strsplit(" ", args)}
    local numbers, texts = {}, {}

    for _, input in ipairs(inputs) do
      if input:match("^#%d+") then
        zoneID = tonumber(input:match("%d+"))
      elseif tonumber(input) then
        table.insert(numbers, tonumber(input))
      else
        table.insert(texts, input)
      end
    end

    x, y = getCoordinates(numbers)
    order = numbers[3] and math.max(1, math.floor(numbers[3])) or 1
    description = strtrim(table.concat(texts, " "))

    if not x or not y then
      printError("Coordinates expected in format: /way [#ZoneID] X Y [Order] [Description]")
    elseif x < 0 or x > 100 or y < 0 or y > 100 then
      printError("Coordinates must be between 0 and 100.")
    else
      zoneID = zoneID or C_Map.GetBestMapForUnit("player")
      setWaypoint(zoneID, x, y, order, description)
    end
  end
end

-- Register the slash command
SLASH_WAYPOINT1 = "/way"
SlashCmdList["WAYPOINT"] = Waypoint
