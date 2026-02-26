# Changelog

All notable changes to this project will be documented in this file. (Notable changes means some internal changes may not be here!)

The format is based on [Keep a Changelog (1.1)](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning (2.0)](https://semver.org/spec/v2.0.0.html).

## [unreleased] 

### Added
- Brush stroke stabilizer/smoothing
- Adaptive frame rate for reduced GPU/CPU load when the user is idle
- Velocity based line thickness (in addition to pen pressure)
- File tabs are now responsive and can be scrolled when not enough screen width is availble
- File tabs can be moved via drag and drop
- Native file dialogs
- Option to change the internally used drawing tablet driver in the settings
- Setting to disable pressure sensitivity and always draw with a constant brush width
- Quit shortcut (`CTRL+Q` by default)
- Alternative way to pan the canvas by holding `SPACE` and moving the mouse
- The rectangle tool will now draw a perfect square while holding `SHIFT`
- Translations: Ukrainian, Arabic, Simplified Chinese, Traditional Chinese, Turkish, Brazilian Portuguese, Korean, French, Spanish, Russian, English, German and Italian
- Rebindable keyboard shortcuts
- Use eraser tool while tablet pen is inverted
- Dotted grid pattern; can be changed to lines (or none at all) in the settings
- Zooming with CTRL+MMB
- Automatically remembering and auto-opening project files upon exit & launch
- Fullscreen support
- Basic SVG exporter
- Circle/Ellipse tool
- SuperEraser: intersecting a brush stroke with the eraser brush removes the entiry brush stroke 
- The window size will be saved and restored across program restarts
- Center the canvas based on current mouse position (shortcut: `SPACE`)
- UI scaling for high-dpi monitors
- Toolbar can be scrolled through when the entire toolbar cannot be shown
- Changing the brush color while having strokes actively selected changes the color of these strokes
- Distraction free mode which hides the UI. Can be toggled with TAB
- Color palettes: You can use the built-in palette or create custom palettes yourself
- Easteregg: Pressing F12 spwans a playable character who can walk on the drawn lines
- Rectangle tool: Easily draw rectangular shapes
- Infinite grid
- Copy-Paste selected brush strokes with CTRL+C/CTRL+V or duplicate in one step with CTRL+D
- The selection tool can now also deselect seperate brush strokes by holding down shift
- "Save as" functionality to save a file as a new file with a new file name, while keeping the original
- Implemented "Open" and "Save" functionality in menu
- Open files via drag'n drop from the filesystem
- Open files via cli arguments and "Open with..." functionality on Windows
- Option to set foreground and backgound FPS in the settings menu
- Option to set the line cap in settings menu (flat & round)
- Option to change the pressure sensitivity by a fixed multilpier
- Mention contributors in the About Dialog
- Export the whole canvas as PNG image
- Implemented the color picker tool, which let's you pick any color on the canvas
- Selection tool
- Ability to move selected brush strokes
- Ability to delete selected brush strokes with delete key
- Added an option to switch between languages
- Line Tool: snap in 15° steps when holding down shift 
- Infinite canvas
- Infinite undo/redo
- (Almost) Infinite zoom
- Extremely small savefiles
- Work on multiple documents simultaneously
- Tools: Freehand brush, eraser, line tool
- You can choose different colors for brush strokes and the canvas background via an easy to use color picker
- Designed to be used with a drawing tablet (Wacom, etc.). It also supports pressure sensitivity
- Runs on Windows, Linux & Mac

[unreleased]: https://github.com/mbrlabs/lorien/compare/v0.0.0...HEAD
