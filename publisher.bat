@echo off
title Publisher

REM EDIT THESE VALUES TO SUIT YOUR ENVIRONMENT!
SET bib=D:\library\Zotero.bib
SET csl_path=D:\library\citation-styles\styles-master\
SET default_csl=chicago-fullnote-bibliography.csl
SET ref_doc=%~dp0/reference.docx

REM Script options: <input file/dir> <output file> <optional citation style>
SET directory=%~dpnx1
SET outfile=%2
SET csl_file=%3

REM a default value for the output file and citation style
IF "%~2"=="" SET outfile=output.docx
REM a default value for the CSL file
IF "%~3"=="" SET csl_file=%default_csl%

SET csl=%csl_path%%csl_file%
SET tempfile=_tempfile_

for /f "tokens=1,2 delims=d" %%A in ("-%~a1") do if "%%B" neq "" (
  REM Join all the markdown files first.
  echo Compiling all the markdown files in %directory%
  type %directory%\*.md > %tempfile%
) else if "%%A" neq "-" (
  REM Just one file
  echo Publishing a single file: %directory%
  copy %directory% %tempfile% /a
) else (
  echo %1 does not exist
  GOTO :End
)

REM This allows the script to run even if the values aren't set
if "%ref_doc%" neq "" SET cmd_ref=--reference-doc=%ref_doc%
if "%bib%" neq "" SET cmd_bib=--filter=pandoc-citeproc --bibliography=%bib%
if "%csl%" neq "" SET cmd_csl=--csl=%csl%

REM Export with pandoc
echo Publishing using bibliography file at %bib% and citation style at %csl%.
pandoc -s -f markdown -o %outfile% %cmd_ref% %cmd_bib% %cmd_csl% %tempfile%

REM Clean up the temporary file
del %tempfile% /s /f /q

:End
