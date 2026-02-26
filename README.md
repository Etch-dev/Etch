<img src="https://raw.githubusercontent.com/Etch-dev/Etch/main/images/etch.png" align="left"  width="51.2" height="51.2"/>

# Etch

<p>
    <a href="https://github.com/Etch-dev/Etch/actions">
        <img src="https://github.com/Etch-dev/Etch/workflows/build/badge.svg" alt="Build Passing" />
    </a>
    <a href="https://github.com/Etch-dev/Etch/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-blue" alt="License" />
    </a>
</p>

Etch is an **infinite canvas drawing/note-taking app that is focused on performance, small savefiles and simplicity**. It's not based on bitmap images like Krita, Gimp or Photoshop; it rather saves brush strokes as a collection of points and renders them at runtime (kind of like SVG). It's primarily designed to be used as a digital notebook and as brainstorming tool. While it can totally be used to make small sketches and diagrams, it is not meant to replace traditional art programs that operate on bitmap images. It is entirely written in the [Godot Game Engine](https://godotengine.org/). For an overview on how to use Etch have a look [at the manual](docs/manuals/manual_v0.6.0.md).

![Etch demo](https://raw.githubusercontent.com/Etch-dev/Etch/main/images/etch_demo.png)

⚠ **This is very much a WIP and still a bit rough around the edges** ⚠. The savefile format *might* also change in the future. Contributions (be it bug reports, code, art or [translations](docs/i18n.md)) are very welcome.

> [!Note]
> Etch is a community fork of [Lorien](https://github.com/mbrlabs/Lorien) to make its development faster.

## Features as of v0.1.0-dev1

- Infinite canvas
- Infinite undo/redo
- (Almost) Infinite zoom
- Infinite grid
- Zen mode (toggles the UI on/off)
- Extremely small savefiles ([File format specs](docs/file_format.md))
- Work on multiple documents simultaneously
- [Tools](docs/manuals/manual_v0.7.0.md): Freehand brush, eraser, line tool, rectangle tool, circle/ellipse tool, selection tool
- Move and delete selected brush strokes
- SVG export
- Rebindable keyboard shortcuts
- Built-in and custom color palettes
- Designed to be used with a drawing tablet (Wacom, etc.). It also supports pressure sensitivity
- A little Surprise Mechanic™ when pressing F12
- Runs on Windows, Linux & macOS
- Localizations: German, English, Spanish, French, Italian, Korean, Brasilian Portuguese, Russian, Turkish, Ukrainian, Chinese

## Download

You can download the latest stable releases on [Github](https://github.com/Etch-dev/Etch/releases).

If you want to check out the bleeding edge main branch without building the project yourself you can also check out the [CI builds](https://github.com/Etch-dev/Etch/actions). But make sure to backup your files and be prepared for bugs if you do that.

## More information

- [Contributing Guide](docs/contributing.md)
- [Localization](docs/i18n.md)
- [Changelog](docs/changelog.md)
- [Roadmap](docs/roadmap.md)

## Credits

- Base project: [Lorien](https://github.com/mbrlabs/Lorien)
- Brush stroke antialiasing: [godot-antialiased-line2d](https://github.com/godot-extended-libraries/godot-antialiased-line2d)
- Icons used for the UI: [Remix Icon](https://remixicon.com/)
- Blurred background image of demo screenshot: <https://unsplash.com/photos/nO0V_T0g2fM>
