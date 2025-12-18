#!/usr/bin/env python3
"""
Generate a directory structure document for the project.
"""

import os
from pathlib import Path


def generate_tree(directory: Path, prefix: str = "", max_depth: int = 5, current_depth: int = 0, 
                  exclude_dirs: set = None, exclude_files: set = None) -> list:
    """Generate a tree structure of the directory."""
    if exclude_dirs is None:
        exclude_dirs = {'.git', '.godot', '__pycache__', 'node_modules', '.import', '.idea', '.vscode'}
    if exclude_files is None:
        exclude_files = {'.DS_Store', 'Thumbs.db'}
    
    if current_depth >= max_depth:
        return []
    
    lines = []
    
    try:
        entries = sorted(directory.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))
    except PermissionError:
        return lines
    
    # Filter out excluded items
    entries = [e for e in entries if e.name not in exclude_dirs and e.name not in exclude_files]
    
    for i, entry in enumerate(entries):
        is_last = i == len(entries) - 1
        current_prefix = "└── " if is_last else "├── "
        next_prefix = "    " if is_last else "│   "
        
        if entry.is_dir():
            lines.append(f"{prefix}{current_prefix}📁 {entry.name}/")
            # Recurse into subdirectory
            sublines = generate_tree(entry, prefix + next_prefix, max_depth, current_depth + 1, 
                                    exclude_dirs, exclude_files)
            lines.extend(sublines)
        else:
            # Add icon based on file extension
            icon = get_file_icon(entry.suffix)
            lines.append(f"{prefix}{current_prefix}{icon} {entry.name}")
    
    return lines


def get_file_icon(extension: str) -> str:
    """Get an icon for a file based on its extension."""
    icons = {
        '.gd': '📜',      # GDScript
        '.tscn': '🎬',   # Scene
        '.tres': '⚙️',   # Resource
        '.py': '🐍',     # Python
        '.md': '📄',     # Markdown
        '.json': '📋',   # JSON
        '.txt': '📝',    # Text
        '.png': '🖼️',    # Image
        '.jpg': '🖼️',    # Image
        '.svg': '🎨',    # SVG
        '.wav': '🔊',    # Audio
        '.mp3': '🔊',    # Audio
        '.ogg': '🔊',    # Audio
        '.sh': '⚡',     # Shell script
        '.cfg': '🔧',    # Config
        '.gitignore': '🚫',
    }
    return icons.get(extension.lower(), '📄')


def count_files_by_type(directory: Path, exclude_dirs: set = None) -> dict:
    """Count files by extension."""
    if exclude_dirs is None:
        exclude_dirs = {'.git', '.godot', '__pycache__', 'node_modules', '.import'}
    
    counts = {}
    
    for root, dirs, files in os.walk(directory):
        # Remove excluded directories
        dirs[:] = [d for d in dirs if d not in exclude_dirs]
        
        for file in files:
            ext = Path(file).suffix.lower() or 'no extension'
            counts[ext] = counts.get(ext, 0) + 1
    
    return dict(sorted(counts.items(), key=lambda x: x[1], reverse=True))


def generate_directory_doc(project_root: str, output_file: str = 'DIRECTORY_STRUCTURE.md'):
    """Generate comprehensive directory structure documentation."""
    root_path = Path(project_root)
    
    doc_lines = []
    
    # Header
    doc_lines.append("# Project Directory Structure\n")
    doc_lines.append("This document provides an overview of the project's directory structure.\n")
    doc_lines.append("---\n")
    
    # Project tree
    doc_lines.append("## Directory Tree\n")
    doc_lines.append("```")
    doc_lines.append("📦 " + root_path.name + "/")
    
    tree_lines = generate_tree(root_path, "", max_depth=4)
    doc_lines.extend(tree_lines)
    
    doc_lines.append("```\n")
    
    # File statistics
    doc_lines.append("## File Statistics\n")
    file_counts = count_files_by_type(root_path)
    
    doc_lines.append("| File Type | Count |")
    doc_lines.append("|-----------|-------|")
    for ext, count in file_counts.items():
        doc_lines.append(f"| {ext} | {count} |")
    doc_lines.append("")
    
    # Key directories
    doc_lines.append("## Key Directories\n")
    
    key_dirs = [
        ("audit--rebirth-of-the-kpi/", "Main Godot project directory"),
        ("audit--rebirth-of-the-kpi/scenes/", "Game scenes (exploration, fight, menu, etc.)"),
        ("audit--rebirth-of-the-kpi/scenes/exploration/", "Exploration gameplay scenes and scripts"),
        ("audit--rebirth-of-the-kpi/scenes/fight/", "Combat system scenes and scripts"),
        ("audit--rebirth-of-the-kpi/scenes/menu/", "Main menu interface"),
        ("audit--rebirth-of-the-kpi/dialogue/", "Dialogue system and text"),
        ("audit--rebirth-of-the-kpi/assets/", "Game assets (sprites, audio, etc.)"),
        ("audit--rebirth-of-the-kpi/addons/", "Third-party Godot addons"),
        ("docs/", "Generated markdown documentation"),
        ("website/", "Generated HTML documentation website"),
    ]
    
    for dir_path, description in key_dirs:
        full_path = root_path / dir_path
        if full_path.exists():
            doc_lines.append(f"### `{dir_path}`")
            doc_lines.append(f"{description}\n")
    
    # Important files
    doc_lines.append("## Important Files\n")
    
    important_files = [
        ("README.md", "Project overview and instructions"),
        ("WIKI.md", "Pedagogical documentation"),
        ("Cahier des charges.md", "Project specifications"),
        ("LICENSE", "Project license (Apache 2.0)"),
        ("audit--rebirth-of-the-kpi/project.godot", "Godot project configuration"),
        ("generate_docs.py", "Script to generate documentation from GDScript files"),
        ("generate_website.py", "Script to generate HTML website from documentation"),
    ]
    
    for file_path, description in important_files:
        full_path = root_path / file_path
        if full_path.exists():
            doc_lines.append(f"### `{file_path}`")
            doc_lines.append(f"{description}\n")
    
    # Write documentation
    output_path = root_path / output_file
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(doc_lines))
    
    print(f"Directory structure documentation generated: {output_file}")
    return output_path


def main():
    """Main entry point."""
    import sys
    
    if len(sys.argv) > 1:
        project_root = sys.argv[1]
    else:
        project_root = os.path.dirname(os.path.abspath(__file__))
    
    generate_directory_doc(project_root)


if __name__ == '__main__':
    main()
