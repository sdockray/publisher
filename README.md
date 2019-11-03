# publisher

This script helps me export my plain text academic writing into multiple formats. I write in Markdown, and the writing projects are anything from one single file (for something small) to a whole directory of files (for long texts). What I do something like:

```
publisher.bat path\to\file\or\directory path\to\output\file.docx
```

The reason I did it is because in between writing, I forget where I have saved my bibliography files, or my citation styles, or I want to my Word documents to be consistently formatted in my preferred style. I could have just kept a record of the things I've run on the command-line, but I've done this as well. (@TODO: write a bash version of the same script.)

## Requirements

1. Install [Pandoc](https://pandoc.org/installing.html)
2. Install [Zotero](https://www.zotero.org/download/) (set up [Better BibTex](https://github.com/retorquere/zotero-better-bibtex) export of your library)
3. Install [Atom](https://atom.io/)

## Installation

1. [Download](https://github.com/sdockray/publisher/archive/master.zip) and unzip somewhere. For example, I might put it in `C:\Users\Sean\scripts`.
2. Since you have already installed Atom, there are a few extra packages that make academic writing in Atom more pleasant. To install them all quickly, I open the Windows PowerShell (**Windows-x**) and then do `apm install --packages-file C:\Users\Sean\scripts\publisher\atom-package-list.txt`.
3. Edit the `default-metadata.yaml` file to choose the style you want ([here are the thousands of choices](https://github.com/citation-style-language/styles)) and put the correct path to your Better BibTex export, that you made above).

## Some notes on citation styles

* You will probably be fine using the citation styles the way I have it (referencing a URL). However, if you are going to be offline or you want to customize a style, then you can download the citation styles [from here](https://github.com/citation-style-language/styles) and then edit the `default-metadata.yaml` file to point to the downloaded version of your citation style.
* You can override the default style on a document-by-document basis by just putting this in your Markdown file (eg at the very top):

```
---
csl: https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
---
```

Above, I've decided to output using APA rather than Chicago for this particular document.
