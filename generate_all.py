#!/usr/bin/env python3
"""
Master script to generate all documentation, directory structure, and website.
"""

import sys
import os
from pathlib import Path

# Import the generation modules
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from generate_docs import GDScriptDocParser
from generate_website import generate_website
from generate_directory import generate_directory_doc


def main():
    """Generate all documentation artifacts."""
    print("=" * 60)
    print("T3 Odie - Documentation Generation")
    print("=" * 60)
    print()
    
    project_root = os.path.dirname(os.path.abspath(__file__))
    
    # Step 1: Generate markdown documentation from GDScript
    print("Step 1: Generating markdown documentation from GDScript files...")
    print("-" * 60)
    parser = GDScriptDocParser(project_root)
    parser.generate_docs('docs')
    print()
    
    # Step 2: Generate HTML website
    print("Step 2: Generating HTML website...")
    print("-" * 60)
    generate_website('docs', 'website')
    print()
    
    # Step 3: Generate directory structure
    print("Step 3: Generating directory structure documentation...")
    print("-" * 60)
    generate_directory_doc(project_root, 'DIRECTORY_STRUCTURE.md')
    print()
    
    # Summary
    print("=" * 60)
    print("✅ Documentation generation complete!")
    print("=" * 60)
    print()
    print("Generated artifacts:")
    print(f"  📁 docs/              - Markdown documentation ({len(list(Path('docs').glob('*.md')))} files)")
    print(f"  📁 website/           - HTML website ({len(list(Path('website').glob('*.html')))} pages)")
    print(f"  📄 DIRECTORY_STRUCTURE.md - Project directory structure")
    print()
    print("To view the documentation:")
    print("  - Open website/index.html in a web browser")
    print("  - Read docs/index.md for markdown version")
    print()


if __name__ == '__main__':
    main()
