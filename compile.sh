#!/bin/sh

# Get today's date
DATE=`date +%Y-%m-%d`
echo "compile >> date: $DATE"

# Remove previous resume
rm ./*Resume*.pdf
echo "compile >> removed previous resumes"

# Compile new resume
xelatex resume.tex

# If we successfully made a new resume, rename it
if [ -e resume.pdf ]
then
  echo "compile >> ok"
  mv resume.pdf "Josh_Hawkins_Resume_$DATE.pdf"
else
  echo "compile >> not ok"
fi

