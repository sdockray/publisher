# publisher

This script helps me export my plain text academic writing into multiple formats. I write in Markdown, and the writing projects are anything from one single file (for something small) to a whole directory of files (for long texts). What I do something like:

```
publisher.bat path\to\file\or\directory path\to\output\file.docx <optional citation style>
```

The reason I did it is because in between writing, I forget where I have saved my bibliography files, or my citation styles, or I want to my Word documents to be consistently formatted in my preferred style. I could have just kept a record of the things I've run on the command-line, but I've done this as well. (@TODO: write a bash version of the same script.)

## Requirements

1. Install [Pandoc](https://pandoc.org/installing.html)
2. Install [Zotero](https://www.zotero.org/download/) (set up [Better BibTex](https://github.com/retorquere/zotero-better-bibtex) export of your library)
3. Download [Citation Styles](https://github.com/citation-style-language/styles)

## Installation

2 and 3 are optional, but it's pointless not to do them. After you have downloaded the script, edit the values at the top:

```
REM EDIT THESE VALUES TO SUIT YOUR ENVIRONMENT!
SET bib=D:\library\Zotero.bib
SET csl_path=%~dp0\citation-styles\
SET default_csl=chicago-fullnote-bibliography.csl
SET ref_doc=%~dp0\reference.docx
```

The main one to do is `bib` and put the path to your exported Zotero library file. If you have downloaded the citation styles into the `citation-styles` directory, then all the rest should be fine.
