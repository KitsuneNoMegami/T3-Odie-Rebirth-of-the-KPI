#!/usr/bin/env node

/**
 * Markdown to HTML Converter
 * Converts all .md files in the repository to .html files
 */

const fs = require('fs');
const path = require('path');
const { marked } = require('marked');

// Configure marked options
marked.setOptions({
  gfm: true, // GitHub Flavored Markdown
  breaks: true,
  headerIds: true,
  mangle: false
});

// HTML template
const htmlTemplate = (title, content) => `<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif;
            line-height: 1.6;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
        }
        h1, h2, h3, h4, h5, h6 {
            margin-top: 24px;
            margin-bottom: 16px;
            font-weight: 600;
            line-height: 1.25;
        }
        h1 { font-size: 2em; border-bottom: 1px solid #eaecef; padding-bottom: 0.3em; }
        h2 { font-size: 1.5em; border-bottom: 1px solid #eaecef; padding-bottom: 0.3em; }
        code {
            background-color: #f6f8fa;
            padding: 0.2em 0.4em;
            border-radius: 3px;
            font-family: 'Courier New', Courier, monospace;
        }
        pre {
            background-color: #f6f8fa;
            padding: 16px;
            overflow: auto;
            border-radius: 6px;
        }
        pre code {
            background-color: transparent;
            padding: 0;
        }
        a {
            color: #0366d6;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        blockquote {
            padding: 0 1em;
            color: #6a737d;
            border-left: 0.25em solid #dfe2e5;
            margin: 0;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 16px 0;
        }
        table th, table td {
            padding: 6px 13px;
            border: 1px solid #dfe2e5;
        }
        table tr:nth-child(2n) {
            background-color: #f6f8fa;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        ul, ol {
            padding-left: 2em;
        }
    </style>
</head>
<body>
${content}
</body>
</html>`;

// Find all .md files in the current directory (excluding node_modules)
function findMarkdownFiles(dir) {
  const files = [];
  const items = fs.readdirSync(dir);
  
  for (const item of items) {
    const fullPath = path.join(dir, item);
    const stat = fs.statSync(fullPath);
    
    if (stat.isDirectory() && !item.startsWith('.') && item !== 'node_modules' && item !== 'audit--rebirth-of-the-kpi') {
      files.push(...findMarkdownFiles(fullPath));
    } else if (stat.isFile() && item.endsWith('.md')) {
      files.push(fullPath);
    }
  }
  
  return files;
}

// Convert a single markdown file to HTML
function convertMarkdownToHtml(mdFilePath) {
  const mdContent = fs.readFileSync(mdFilePath, 'utf-8');
  const htmlContent = marked.parse(mdContent);
  
  // Extract title from filename or first h1
  const fileName = path.basename(mdFilePath, '.md');
  const title = fileName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
  
  // Generate HTML with template
  const fullHtml = htmlTemplate(title, htmlContent);
  
  // Output file path
  const htmlFilePath = mdFilePath.replace(/\.md$/, '.html');
  
  // Write HTML file
  fs.writeFileSync(htmlFilePath, fullHtml, 'utf-8');
  
  console.log(`✓ Converted: ${path.basename(mdFilePath)} → ${path.basename(htmlFilePath)}`);
}

// Main function
function main() {
  console.log('🔄 Converting Markdown files to HTML...\n');
  
  const rootDir = process.cwd();
  const mdFiles = findMarkdownFiles(rootDir);
  
  if (mdFiles.length === 0) {
    console.log('⚠️  No markdown files found.');
    return;
  }
  
  console.log(`Found ${mdFiles.length} markdown file(s):\n`);
  
  for (const mdFile of mdFiles) {
    convertMarkdownToHtml(mdFile);
  }
  
  console.log(`\n✅ Conversion complete! ${mdFiles.length} file(s) converted.`);
}

// Run the script
main();
