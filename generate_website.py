#!/usr/bin/env python3
"""
Generate a static HTML website from markdown documentation.
"""

import os
import markdown
from pathlib import Path

HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title} - T3 Odie Documentation</title>
    <style>
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}
        
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f5f5f5;
        }}
        
        .container {{
            display: flex;
            min-height: 100vh;
        }}
        
        .sidebar {{
            width: 280px;
            background: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }}
        
        .sidebar h1 {{
            font-size: 1.4em;
            margin-bottom: 20px;
            color: #3498db;
        }}
        
        .sidebar a {{
            color: #ecf0f1;
            text-decoration: none;
            display: block;
            padding: 5px 0;
            transition: color 0.3s;
        }}
        
        .sidebar a:hover {{
            color: #3498db;
        }}
        
        .content {{
            flex: 1;
            margin-left: 280px;
            padding: 40px;
            background: white;
            max-width: 1200px;
        }}
        
        .content h1 {{
            color: #2c3e50;
            margin-bottom: 20px;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }}
        
        .content h2 {{
            color: #34495e;
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 1px solid #ecf0f1;
            padding-bottom: 5px;
        }}
        
        .content h3 {{
            color: #2c3e50;
            margin-top: 20px;
            margin-bottom: 10px;
        }}
        
        .content code {{
            background: #f8f9fa;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            color: #e74c3c;
        }}
        
        .content pre {{
            background: #2c3e50;
            color: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
            margin: 15px 0;
        }}
        
        .content pre code {{
            background: none;
            color: #ecf0f1;
            padding: 0;
        }}
        
        .content ul {{
            margin: 15px 0 15px 30px;
        }}
        
        .content li {{
            margin: 5px 0;
        }}
        
        .content a {{
            color: #3498db;
            text-decoration: none;
        }}
        
        .content a:hover {{
            text-decoration: underline;
        }}
        
        .nav-home {{
            background: #3498db;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: inline-block;
        }}
        
        .nav-home:hover {{
            background: #2980b9;
        }}
        
        @media (max-width: 768px) {{
            .sidebar {{
                display: none;
            }}
            
            .content {{
                margin-left: 0;
                padding: 20px;
            }}
        }}
    </style>
</head>
<body>
    <div class="container">
        <nav class="sidebar">
            <h1>T3 Odie Docs</h1>
            <a href="index.html" class="nav-home">📖 Home</a>
            <hr style="border: 1px solid #34495e; margin: 15px 0;">
            {nav_links}
        </nav>
        <main class="content">
            {content}
        </main>
    </div>
</body>
</html>
"""


def generate_nav_links(docs_dir: Path) -> str:
    """Generate navigation links from markdown files."""
    links = []
    
    # Add index
    links.append('<div style="margin-bottom: 10px;"><strong>📄 Main</strong></div>')
    links.append('<a href="index.html">→ Documentation Index</a>')
    links.append('<br><br>')
    
    # Group files by directory
    by_directory = {}
    for md_file in sorted(docs_dir.glob('*.md')):
        if md_file.name == 'index.md':
            continue
        
        # Extract directory from filename
        parts = md_file.stem.split('_')
        if len(parts) > 2:
            dir_name = parts[0]
        else:
            dir_name = 'root'
        
        if dir_name not in by_directory:
            by_directory[dir_name] = []
        by_directory[dir_name].append(md_file)
    
    # Generate grouped links
    for dir_name in sorted(by_directory.keys()):
        links.append(f'<div style="margin: 15px 0 5px 0;"><strong>📁 {dir_name}</strong></div>')
        for md_file in sorted(by_directory[dir_name]):
            html_name = md_file.stem + '.html'
            # Shorten display name
            display_name = md_file.stem.replace(dir_name + '_', '')
            links.append(f'<a href="{html_name}" style="font-size: 0.9em; padding-left: 10px;">→ {display_name}</a>')
    
    return '\n'.join(links)


def convert_markdown_to_html(md_file: Path, output_dir: Path, nav_links: str):
    """Convert a single markdown file to HTML."""
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    
    # Convert markdown to HTML
    html_content = markdown.markdown(md_content, extensions=['fenced_code', 'tables', 'codehilite'])
    
    # Fix links: replace .md with .html
    html_content = html_content.replace('.md"', '.html"').replace('.md\'', '.html\'')
    
    # Extract title from first heading
    title = md_file.stem
    if md_content.startswith('# '):
        title = md_content.split('\n')[0][2:].strip()
    
    # Generate full HTML
    full_html = HTML_TEMPLATE.format(
        title=title,
        nav_links=nav_links,
        content=html_content
    )
    
    # Write HTML file
    html_file = output_dir / (md_file.stem + '.html')
    with open(html_file, 'w', encoding='utf-8') as f:
        f.write(full_html)
    
    return html_file


def generate_website(docs_dir: str = 'docs', output_dir: str = 'website'):
    """Generate HTML website from markdown documentation."""
    docs_path = Path(docs_dir)
    output_path = Path(output_dir)
    
    # Create output directory
    output_path.mkdir(exist_ok=True)
    
    # Generate navigation
    nav_links = generate_nav_links(docs_path)
    
    # Convert all markdown files to HTML
    print(f"Generating website in '{output_dir}/' directory...")
    
    md_files = list(docs_path.glob('*.md'))
    for md_file in md_files:
        html_file = convert_markdown_to_html(md_file, output_path, nav_links)
        print(f"  Generated: {html_file.name}")
    
    print(f"\nWebsite generated successfully!")
    print(f"  - {len(md_files)} pages created")
    print(f"  - Open {output_dir}/index.html in a browser to view")


def main():
    """Main entry point."""
    import sys
    
    if len(sys.argv) > 2:
        docs_dir = sys.argv[1]
        output_dir = sys.argv[2]
    elif len(sys.argv) > 1:
        docs_dir = sys.argv[1]
        output_dir = 'website'
    else:
        docs_dir = 'docs'
        output_dir = 'website'
    
    generate_website(docs_dir, output_dir)


if __name__ == '__main__':
    main()
