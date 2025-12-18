# Documentation Quick Reference

## 🚀 Quick Start

Generate all documentation in one command:
```bash
python3 generate_all.py
```

## 📂 What Gets Generated

| Artifact | Location | Description |
|----------|----------|-------------|
| Markdown Docs | `docs/` | 43+ markdown files extracted from GDScript |
| HTML Website | `website/` | Browsable documentation website |
| Directory Tree | `DIRECTORY_STRUCTURE.md` | Visual project structure |

## 🔧 Individual Commands

```bash
# Generate only markdown documentation
python3 generate_docs.py

# Generate only HTML website
python3 generate_website.py

# Generate only directory structure
python3 generate_directory.py
```

## 👀 View Documentation

**Recommended: Open HTML website**
```bash
# Open in browser (Linux/Mac)
xdg-open website/index.html  # Linux
open website/index.html       # Mac

# Or with Python's HTTP server
cd website && python3 -m http.server 8080
# Then visit: http://localhost:8080
```

**Alternative: Read markdown**
```bash
cat docs/index.md
# Or open any .md file in your editor
```

## 📝 Writing Documentation

Use `##` (double hash) for documentation comments in GDScript:

```gdscript
## Main description of the script
## Can span multiple lines
extends Node

## Variable description
var my_variable = 0

## Function description
## param:Type - Parameter description
## Returns:Type - Return value description
func my_function(param):
    pass
```

## 📊 Documentation Statistics

- **42 GDScript files** documented
- **43 HTML pages** generated
- **43 Markdown files** created
- **Organized by directory** for easy navigation

## 🎨 Features

- ✅ Automatic extraction from GDScript comments
- ✅ Beautiful HTML website with navigation
- ✅ Sidebar menu for quick access
- ✅ Responsive design
- ✅ Markdown fallback option
- ✅ Complete project directory tree

## 🔄 When to Regenerate

Run `python3 generate_all.py` when:
- Adding new GDScript files
- Updating documentation comments
- Project structure changes
- Before releasing new version

## 📚 Full Documentation

See [DOCUMENTATION.md](./DOCUMENTATION.md) for complete documentation generation guide.

---

*Generated documentation system for T3 — Odie : Rebirth of the KPI*
