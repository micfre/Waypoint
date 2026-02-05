# Waypoint: Lightweight TomTom-Compatible Navigation

A simple, lightweight addon that brings TomTom-style waypoint functionality using the game's own pin setting system that's been built-in since Shadowlands.

## Waypoint

**Waypoint** lets you set, manage, and navigate to custom points of interest on your map and minimap. It supports multiple active waypoints, custom descriptions, and zone-specific coordinates, making it great for quick navigation.

*   Supports the same **TomTom** `/way` format that you'll find in chat or on **WowHead**
*   Lets you make **multiple waypoints**
*   Is lightweight with **no libraries** or dependencies
    *   it's not flashy, no big arrows, no laser beams, just the built-in pin to get you where you want to go

## Usage

### Basic Commands

#### Set a Waypoint

```
/way X Y [Description]
```

Example: `/way 45.2 32.8 Engineering Trainer`

#### Set a Waypoint in a Specific Zone

```
/way #ZoneID X Y [Description]
```

Example: `/way #1464 45.2 32.8 Dalaran Engineering Trainer`

#### Set a Waypoint with Custom ID

```
/way X Y @ID [Description]
```

Example: `/way 45.2 32.8 @5 Engineering Trainer`

### Waypoint Management

#### List All Waypoints

```
/way
```

Displays all active waypoints with their IDs, locations, and descriptions.

#### Remove a Waypoint

```
/way remove ID
/way del ID
```

Example: `/way remove 5`

#### Clear All Waypoints

```
/way clear
```

#### Track a Specific Waypoint

```
/way goto ID
```

Example: `/way goto 5`

### Location Commands

#### Show Current Location

```
/way me
```

Displays your current map name and coordinates.