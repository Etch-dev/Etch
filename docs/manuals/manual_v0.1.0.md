# Etch Manual v0.1.0

Drawing tablets are supported and recommended, but you can also just use Keyboard + Mouse. 

## Basic Usage
- Draw with the left mouse button (<kbd>LMB</kbd>) or with your drawing tablet's pen
- Pan/drag across the canvas with the middle mouse button (<kbd>MMB</kbd>) / <kbd>Space</kbd> (You can map a button on your pen to the <kbd>MMB</kbd> / <kbd>Space</kbd> for easy navigation)
- Zoom with the mouse wheel. You can also zoom while holding <kbd>Ctrl</kbd> and the <kbd>MMB</kbd> while moving the mose up/down. This is especially useful when using a drawing tablet with a pen.
- You can open files by dragging them into the window or by opening it via the menu (Shortcut <kbd>Ctrl + O</kbd>)

## Tools

Etch provides you with different tools which you can find in the toolbar. If you want to enable a tool all you have to do is click on it or use the keyboard shortcut. If you hover over the icons you can also see a short description including the keyboard shortcut.

### Brush Tool
- The brush tool is selected by default. It allows you to freely draw on the canvas with your mouse or drawing tablet. 
- You can change the brush size with the adjuster in the toolbar
- The brush color can be changed by clicking on the colored button in the toolbar next to the brush size adjuster 
- It is pressure sensitve

### Rectangle Tool
- You can use the rectangle tool to create perfect (unfilled) rectagles and squares
- Not pressure sensitive 
- Hold <kbd>Shift</kbd> to make a perfect square

### Line Tool
- Allows you to draw perfect lines
- You can hold down <kbd>Shift</kbd> while using the line tool to snap the line in 15° increments 
- Not pressure sensitve

### Circle Tool
- Allows you to draw perfect ellipses and circles
- You can hold down <kbd>Shift</kbd> while using the circle tool to draw perfect circles. Otherwise it defaults to ellipses
- Not pressure sensitve

### Eraser Tool
- Allows you to erease brush strokes by drawing over it. Once the eraser intersects with a brush stroke, the whole brush stroke will be removed
- The brush size affects the area of effect
- When using a stylus/pen that supports erasing with the other side, Etch automatically switches into the eraser mode

### Selection Tool
- With the Selection tool you can select a number of brush strokes by dragging across the screen with your <kbd>LMB</kbd> pressed. Brush strokes which are considered inside the selection recatangle will be added to the current selection. You can add more strokes to your current selection by holding down <kbd>Shift</kbd> while dragging.
- You can deselect your current selection by pressing <kbd>RMB</kbd> or <kbd>Esc</kbd>.
- To move the selected strokes simply drag them while holding down <kbd>LMB</kbd>. If you did not move your mouse while pressing <kbd>LMB</kbd>, everything will be deselected automatically.
- Press <kbd>Delete</kbd> to delete the current selection
- Press <kbd>Ctrl + C</kbd> to copy the current selection
- Press <kbd>Ctrl + V</kbd> to paste the copied brush strokes
- Press <kbd>Ctrl + D</kbd> to duplicate the current selection

## Color Palettes
- Color palettes allow you to easily switch between different pre-defined colors. To open the pallete you have to click on the colored button in the toolbar next to the brush size adjsuter.
- You can add/edit/delete custom color palettes
- The default color palette can't be edited or deleted. If you want to customize it you can can make a copy of it and edit that instead.

## Keyboard shortcuts
- <kbd>Ctrl + S</kbd>: Saves the current file
- <kbd>Ctrl + N</kbd>: Open a new file
- <kbd>Ctrl + O</kbd>: Open a new empty tab
- <kbd>Ctrl + E</kbd>: Opens the SVG export dialog
- <kbd>Ctrl + Z</kbd>: Undo a brush stroke
- <kbd>Ctrl + Y</kbd>: Redo a brush stroke
- <kbd>Ctrl + C</kbd>: Copy selected brush strokes
- <kbd>Ctrl + V</kbd>: Paste copied brush strokes
- <kbd>Ctrl + D</kbd>: Duplicate selected brush strokes
- <kbd>B</kbd>: Brush tool
- <kbd>R</kbd>: Rectangle tool
- <kbd>E</kbd>: Eraser tool
- <kbd>L</kbd>: Line tool
- <kbd>C</kbd>: Circle tool
- <kbd>S</kbd>: Selection tool
- <kbd>Esc</kbd> or <kbd>RMB</kbd>: Deselect everything
- <kbd>Delete</kbd>: Deletes selected brush strokes
- <kbd>Tab</kbd>: Toggle zen mode (no UI)
- <kbd>Ctrl + Shift + E</kbd>: Easteregg: spwans a playable character at the mouse position who can walk/jump/crouch on brush strokes!
- <kbd>Space</kbd>: Hold to pan (like <kbd>MMB</kbd>)
