# Roadmap

> *Notes by [Marcus Brummer](https://github.com/mbrlabs) for Lorien v0.6:*  
> This file provides an overview of the direction this project is heading. There is no timeline attached to milestones, because I don't know much I'm going to work on this in the future and how much people are willing to help.
>
> There are still a lot of placeholders in the program. While I did my best to implement as much features as possible before I made the project public, there is still a lot to do. This is a list of features which i would expect from a program like this ~~(and which are not implemented yet)~~

## Milestone 1 - Basic functionality and stability

- [x] Basic shape tools (rectangle, line, maybe a circle/oval)
- [x] Color picker tool (picks colors from brush strokes on the canvas)
- [x] Persist last opened projects, so you don't have to reopen files between program restarts
- [x] Different themes (at least 1 dark and 1 light theme)
- [ ] Cleanup UI
- [ ] More settings (max zoom level, zoom speed, min/max brush size etc.)
- [x] Improvements to project tabs ~~(currently custom ui; maybe replace with Godot's `Tabs` to take advantage of scrolling and reordering)~~
- [x] Improve the brush stroke filter and optimizer
- [ ] Improve zooming
- [x] `Save as` functionality
- [ ] Stability across all platforms + bugfixing
- [ ] Stabilize savefile format (can still change later (before 1.0) but hopefully not as much)
- ~~[x] Improve the logo. I'm actually pretty proud of myself for the current logo, but i'm sure it can be improved. It's supposed to be a leaf by the way ;)~~
- [ ] Make logo more visible in small size
- [ ] Setup unit tests (maybe)
- [x] i18n
- [x] Implement a selection tool to select and move multiples strokes. 
- [x] Implement a brush stabilizer (can optionally be enabled for the brush tool)
- [x] Color palettes / list of previously used colors
- [x] SVG export
- [ ] PNG/JPG export
- [x] Grid

## Milestone 2 - More fueatures (all optional)
- [ ] Layers
- [ ] Ruler
