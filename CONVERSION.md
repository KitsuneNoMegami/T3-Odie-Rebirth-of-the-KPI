# Markdown to HTML Conversion

This repository includes a tool to convert Markdown (.md) documentation files to HTML (.html) format.

## Prerequisites

- Node.js (v14 or higher)
- npm (comes with Node.js)

## Installation

Install the required dependencies:

```bash
npm install
```

## Usage

To convert all Markdown files in the repository to HTML:

```bash
npm run convert
```

This will:
1. Find all `.md` files in the root directory
2. Convert each file to `.html` with the same name
3. Apply a clean, GitHub-style CSS to the generated HTML

## Example

Running the conversion:

```bash
$ npm run convert

🔄 Converting Markdown files to HTML...

Found 3 markdown file(s):

✓ Converted: Cahier des charges.md → Cahier des charges.html
✓ Converted: README.md → README.html
✓ Converted: WIKI.md → WIKI.html

✅ Conversion complete! 3 file(s) converted.
```

## Output

The generated HTML files include:
- Clean, responsive design
- GitHub-flavored Markdown styling
- Syntax highlighting support
- Mobile-friendly viewport
- Proper heading hierarchies and navigation

## Files Generated

- `README.html` - Converted README documentation
- `WIKI.html` - Converted WIKI documentation
- `Cahier des charges.html` - Converted specifications document

## Customization

To customize the HTML styling, edit the CSS in the `htmlTemplate` function in `convert-md-to-html.js`.

## Technical Details

- Uses the `marked` library for Markdown parsing
- Supports GitHub Flavored Markdown (GFM)
- Generates standalone HTML files with embedded CSS
- Each HTML file is self-contained and can be viewed in any browser
