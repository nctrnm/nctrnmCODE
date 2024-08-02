#Matthew McGilvery
#8.2.2024
#Man Page to PDF converter

#!/bin/bash
# man2pdf.sh - Convert a man page to a 
# PDF file
if [ $# -ne 2 ]; then echo "Usage: $0 
  <command> <output.pdf>" exit 1
fi COMMAND=$1 OUTPUT=$2
# Temporary files
TXT_FILE="/tmp/${COMMAND}.txt" 
PS_FILE="/tmp/${COMMAND}.ps"
# Ensure temporary files are cleaned 
# up on exit
trap "rm -f $TXT_FILE $PS_FILE" EXIT
# Generate plain text from man page
if ! man $COMMAND > $TXT_FILE; then 
  echo "Failed to generate man page 
  for $COMMAND" exit 1
fi
# Convert plain text to PostScript
if ! enscript -B -p $PS_FILE 
$TXT_FILE; then
  echo "Failed to convert text to 
  PostScript" exit 1
fi
# Convert PostScript to PDF
if ! ps2pdf $PS_FILE $OUTPUT; then 
  echo "Failed to convert PostScript 
  to PDF" exit 1
fi
echo "PDF generated as $OUTPUT"
