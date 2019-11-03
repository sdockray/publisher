@echo off
title Publisher

REM EDIT THESE VALUES TO SUIT YOUR ENVIRONMENT!
SET ref_doc=%~dp0\reference.docx
SET yaml=%~dp0\default-metadata.yaml

REM Script options: <input file/dir> <output file> <optional citation style>
SET directory=%~dpnx1
SET outfile=%2

REM a default value for the output file and citation style
IF "%~2"=="" SET outfile=output.docx

SET tempfile=_tempfile_

for /f "tokens=1,2 delims=d" %%A in ("-%~a1") do if "%%B" neq "" (
  REM Join all the markdown files first.
  echo Compiling all the markdown files in %directory%
  type %directory%\*.md > %tempfile%
) else if "%%A" neq "-" (
  REM Just one file
  echo Publishing a single file: %directory%
  copy "%directory%" %tempfile% /a
) else (
  echo %1 does not exist
  GOTO :End
)

REM This allows the script to run even if the values aren't set
if "%ref_doc%" neq "" SET cmd_ref=--reference-doc=%ref_doc%

REM Export with pandoc
pandoc -s -f markdown --verbose --filter=pandoc-citeproc %tempfile% %yaml% -o %outfile% %cmd_ref%

REM Clean up the temporary file
del %tempfile% /s /f /q

:End
