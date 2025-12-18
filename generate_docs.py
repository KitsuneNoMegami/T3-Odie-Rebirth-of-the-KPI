#!/usr/bin/env python3
"""
Documentation generator for GDScript files.
Extracts documentation comments (##) and generates markdown documentation.
"""

import os
import re
import json
from pathlib import Path
from typing import List, Dict, Tuple

class GDScriptDocParser:
    """Parser for GDScript documentation comments."""
    
    def __init__(self, project_root: str):
        self.project_root = Path(project_root)
        self.docs = {}
        
    def parse_file(self, filepath: Path) -> Dict:
        """Parse a single GDScript file and extract documentation."""
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        doc = {
            'path': str(filepath.relative_to(self.project_root)),
            'filename': filepath.name,
            'class_name': None,
            'extends': None,
            'description': [],
            'signals': [],
            'variables': [],
            'functions': [],
            'constants': []
        }
        
        lines = content.split('\n')
        i = 0
        current_doc_block = []
        
        while i < len(lines):
            line = lines[i].strip()
            
            # Collect documentation comments
            if line.startswith('##'):
                doc_text = line[2:].strip()
                current_doc_block.append(doc_text)
                i += 1
                continue
            
            # Skip empty lines
            if not line or line.startswith('#'):
                if not line.startswith('##'):
                    current_doc_block = []
                i += 1
                continue
            
            # Extract class name
            if line.startswith('class_name '):
                doc['class_name'] = line.split('class_name ')[1].split()[0]
            
            # Extract extends
            elif line.startswith('extends '):
                doc['extends'] = line.split('extends ')[1].split()[0]
            
            # Extract signals
            elif line.startswith('signal '):
                signal_match = re.match(r'signal\s+(\w+)', line)
                if signal_match:
                    doc['signals'].append({
                        'name': signal_match.group(1),
                        'description': '\n'.join(current_doc_block) if current_doc_block else ''
                    })
            
            # Extract constants
            elif line.startswith('const '):
                const_match = re.match(r'const\s+(\w+)\s*=\s*(.+)', line)
                if const_match:
                    doc['constants'].append({
                        'name': const_match.group(1),
                        'value': const_match.group(2).split('#')[0].strip(),
                        'description': '\n'.join(current_doc_block) if current_doc_block else ''
                    })
            
            # Extract variables
            elif line.startswith('var ') or line.startswith('@export var '):
                var_match = re.match(r'(?:@export\s+)?var\s+(\w+)', line)
                if var_match:
                    doc['variables'].append({
                        'name': var_match.group(1),
                        'line': line,
                        'description': '\n'.join(current_doc_block) if current_doc_block else ''
                    })
            
            # Extract functions
            elif line.startswith('func '):
                func_match = re.match(r'func\s+(\w+)\s*\((.*?)\)', line)
                if func_match:
                    doc['functions'].append({
                        'name': func_match.group(1),
                        'params': func_match.group(2),
                        'description': '\n'.join(current_doc_block) if current_doc_block else ''
                    })
            
            # Use doc block as file description if at the beginning
            elif not doc['description'] and current_doc_block and i < 20:
                doc['description'] = current_doc_block.copy()
            
            current_doc_block = []
            i += 1
        
        return doc
    
    def find_gdscript_files(self, directory: Path, exclude_dirs: List[str] = None) -> List[Path]:
        """Find all GDScript files in a directory, excluding specified directories."""
        if exclude_dirs is None:
            exclude_dirs = ['addons', '.godot', '.git']
        
        gdscript_files = []
        for root, dirs, files in os.walk(directory):
            # Remove excluded directories from search
            dirs[:] = [d for d in dirs if d not in exclude_dirs]
            
            for file in files:
                if file.endswith('.gd'):
                    gdscript_files.append(Path(root) / file)
        
        return sorted(gdscript_files)
    
    def generate_markdown_file(self, doc: Dict) -> str:
        """Generate markdown documentation for a single file."""
        md = []
        
        # Title
        title = doc['class_name'] if doc['class_name'] else doc['filename']
        md.append(f"# {title}\n")
        
        # Path
        md.append(f"**Path:** `{doc['path']}`\n")
        
        # Extends
        if doc['extends']:
            md.append(f"**Extends:** `{doc['extends']}`\n")
        
        # Description
        if doc['description']:
            md.append("## Description\n")
            md.append('\n'.join(doc['description']))
            md.append('\n')
        
        # Signals
        if doc['signals']:
            md.append("## Signals\n")
            for signal in doc['signals']:
                md.append(f"### {signal['name']}\n")
                if signal['description']:
                    md.append(f"{signal['description']}\n")
                md.append("")
        
        # Constants
        if doc['constants']:
            md.append("## Constants\n")
            for const in doc['constants']:
                md.append(f"### {const['name']} = {const['value']}\n")
                if const['description']:
                    md.append(f"{const['description']}\n")
                md.append("")
        
        # Variables
        if doc['variables']:
            md.append("## Variables\n")
            for var in doc['variables']:
                md.append(f"### {var['name']}\n")
                if var['description']:
                    md.append(f"{var['description']}\n")
                md.append(f"```gdscript\n{var['line']}\n```\n")
        
        # Functions
        if doc['functions']:
            md.append("## Functions\n")
            for func in doc['functions']:
                params = func['params'] if func['params'] else ''
                md.append(f"### {func['name']}({params})\n")
                if func['description']:
                    md.append(f"{func['description']}\n")
                md.append("")
        
        return '\n'.join(md)
    
    def generate_index(self, all_docs: List[Dict]) -> str:
        """Generate index page with table of contents."""
        md = []
        md.append("# T3 — Odie : Rebirth of the KPI - Code Documentation\n")
        md.append("Auto-generated documentation from GDScript source files.\n")
        md.append("## Table of Contents\n")
        
        # Group by directory
        by_directory = {}
        for doc in all_docs:
            path_parts = Path(doc['path']).parts
            if len(path_parts) > 1:
                dir_name = '/'.join(path_parts[:-1])
            else:
                dir_name = 'root'
            
            if dir_name not in by_directory:
                by_directory[dir_name] = []
            by_directory[dir_name].append(doc)
        
        # Generate TOC
        for dir_name in sorted(by_directory.keys()):
            md.append(f"\n### {dir_name}\n")
            for doc in sorted(by_directory[dir_name], key=lambda x: x['filename']):
                title = doc['class_name'] if doc['class_name'] else doc['filename']
                # Create safe filename for link (remove 'audit--rebirth-of-the-kpi/' prefix)
                path_without_prefix = doc['path'].replace('audit--rebirth-of-the-kpi/', '')
                safe_name = path_without_prefix.replace('.gd', '.md').replace('/', '_')
                md.append(f"- [{title}]({safe_name})")
        
        md.append("\n---\n")
        md.append("*Documentation generated automatically from GDScript source code.*")
        
        return '\n'.join(md)
    
    def generate_docs(self, output_dir: str = 'docs'):
        """Generate documentation for all GDScript files."""
        output_path = self.project_root / output_dir
        output_path.mkdir(exist_ok=True)
        
        # Find all GDScript files
        godot_project = self.project_root / 'audit--rebirth-of-the-kpi'
        gdscript_files = self.find_gdscript_files(godot_project)
        
        print(f"Found {len(gdscript_files)} GDScript files")
        
        # Parse all files
        all_docs = []
        for filepath in gdscript_files:
            try:
                doc = self.parse_file(filepath)
                all_docs.append(doc)
                
                # Generate markdown file
                md_content = self.generate_markdown_file(doc)
                
                # Create safe filename
                relative_path = filepath.relative_to(godot_project)
                safe_filename = str(relative_path).replace('.gd', '.md').replace('/', '_')
                
                output_file = output_path / safe_filename
                with open(output_file, 'w', encoding='utf-8') as f:
                    f.write(md_content)
                
                print(f"  Generated: {safe_filename}")
            except Exception as e:
                print(f"  Error parsing {filepath}: {e}")
        
        # Generate index
        index_content = self.generate_index(all_docs)
        with open(output_path / 'index.md', 'w', encoding='utf-8') as f:
            f.write(index_content)
        
        print(f"\nDocumentation generated in '{output_dir}/' directory")
        print(f"  - {len(all_docs)} files documented")
        print(f"  - Index page: {output_dir}/index.md")
        
        return all_docs


def main():
    """Main entry point."""
    import sys
    
    if len(sys.argv) > 1:
        project_root = sys.argv[1]
    else:
        project_root = os.path.dirname(os.path.abspath(__file__))
    
    parser = GDScriptDocParser(project_root)
    parser.generate_docs()


if __name__ == '__main__':
    main()
