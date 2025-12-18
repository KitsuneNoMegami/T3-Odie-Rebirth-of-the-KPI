# Documentation Generation Guide

This project uses automated documentation generation tools to extract documentation from GDScript source code and create both markdown and HTML documentation.

## Overview

The documentation system consists of three main components:

1. **GDScript Documentation Parser** - Extracts documentation comments (`##`) from `.gd` files
2. **Markdown Generator** - Creates structured markdown files from parsed documentation
3. **HTML Website Generator** - Converts markdown to a browsable static website
4. **Directory Structure Generator** - Creates a visual representation of the project structure

## Generated Artifacts

After running the documentation generation, the following artifacts are created:

- **`docs/`** - Directory containing markdown documentation files
  - `index.md` - Main index with table of contents
  - Individual `.md` files for each GDScript source file
  
- **`website/`** - Directory containing HTML website
  - `index.html` - Main documentation page
  - Individual `.html` pages for each script
  - Styled with CSS for easy navigation
  
- **`DIRECTORY_STRUCTURE.md`** - Visual tree of the project structure with file statistics

## Quick Start

### Generate All Documentation

To generate all documentation at once:

```bash
python3 generate_all.py
```

This will:
1. Parse all GDScript files in `audit--rebirth-of-the-kpi/`
2. Generate markdown documentation in `docs/`
3. Create HTML website in `website/`
4. Generate directory structure document

### View Documentation

**HTML Website (Recommended):**
```bash
# Open in your web browser
open website/index.html
# or on Linux
xdg-open website/index.html
```

**Markdown:**
```bash
# View in any markdown viewer or editor
cat docs/index.md
```

## Individual Tools

Each generation step can be run independently:

### 1. Generate Markdown Documentation Only

```bash
python3 generate_docs.py
```

This parses all GDScript files and creates markdown documentation in the `docs/` directory.

### 2. Generate HTML Website Only

```bash
python3 generate_website.py
```

Converts existing markdown files in `docs/` to HTML pages in `website/`.

### 3. Generate Directory Structure Only

```bash
python3 generate_directory.py
```

Creates `DIRECTORY_STRUCTURE.md` with a visual tree of the project.

## Documentation Comment Format

The documentation generator extracts comments that start with `##` (double hash). These are GDScript's documentation comments.

### Example: Documenting a Script

```gdscript
## Node/Script : GameState singleton
## Manages global game state and progression
##
## Signals : None
##
## Main Variables:
## - pause : Game pause state
## - fight_scene : Reference to combat scene
extends Node

## Game pause state
var pause = false

## Reference to the combat scene
var fight_scene

## Sets the pause state
## value:bool - New pause state
func set_pause(value: bool):
    pause = value

## Returns current pause state
func get_pause():
    return pause
```

### Documentation Best Practices

1. **File Headers**: Start files with a description using `##`
2. **Variable Documentation**: Document variables with `##` on the line before
3. **Function Documentation**: Describe parameters and return values
4. **Use Clear Language**: Write for someone unfamiliar with the code

Example:
```gdscript
## Calculates damage based on attacker stats
## attacker:Fighter - The attacking fighter
## defender:Fighter - The defending fighter
## Returns:int - Final damage amount after all calculations
func calculate_damage(attacker, defender) -> int:
    # Implementation...
```

## Project Structure for Documentation

The documentation generator automatically:

- **Excludes** addon directories (third-party code)
- **Groups** files by directory in the table of contents
- **Extracts** class names, extends relationships, signals, variables, functions
- **Preserves** code structure information

## Customization

### Excluding Directories

Edit `generate_docs.py` to modify excluded directories:

```python
def find_gdscript_files(self, directory: Path, exclude_dirs: List[str] = None):
    if exclude_dirs is None:
        exclude_dirs = ['addons', '.godot', '.git']  # Add more here
```

### Changing Output Directories

Pass custom directories to the generators:

```bash
python3 generate_docs.py custom_output_docs
python3 generate_website.py docs custom_website
```

### Styling the Website

Edit the CSS in `generate_website.py` in the `HTML_TEMPLATE` variable to customize appearance.

## Maintenance

### When to Regenerate Documentation

Regenerate documentation when:
- New GDScript files are added
- Documentation comments are updated
- Project structure changes significantly

### Automation

You can add documentation generation to your workflow:

**As a pre-commit hook:**
```bash
# .git/hooks/pre-commit
#!/bin/bash
python3 generate_all.py
git add docs/ website/ DIRECTORY_STRUCTURE.md
```

**In CI/CD:**
```yaml
# Example GitHub Actions
- name: Generate Documentation
  run: python3 generate_all.py
- name: Deploy Documentation
  run: |
    # Deploy website/ directory to GitHub Pages or other hosting
```

## Requirements

The documentation system requires:
- Python 3.6 or higher
- `markdown` library (for HTML generation)

Install dependencies:
```bash
pip3 install markdown
```

## Troubleshooting

### Problem: "Module not found" error
**Solution**: Make sure you're running from the project root directory.

### Problem: No documentation generated
**Solution**: Check that your GDScript files have `##` documentation comments.

### Problem: Links broken in HTML
**Solution**: Ensure you regenerate the website after updating markdown files.

## Contributing

When adding new features:
1. Document all public functions and variables with `##` comments
2. Run `generate_all.py` before committing
3. Include documentation updates in your pull request

## Resources

- [GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
- [Godot Documentation](https://docs.godotengine.org/)
- [Markdown Guide](https://www.markdownguide.org/)

---

*This documentation system is designed to make code more maintainable and accessible for all contributors.*
