#!/bin/sh

# Get today's date
DATE=`date +%Y-%m-%d`
echo "compile >> date: $DATE"

# Remove previous build artifacts
rm *.pdf 2> /dev/null
if [ -e resume.log ]; then
  rm ./resume.aux 2> /dev/null
  rm ./resume.log 2> /dev/null
  rm ./resume.out 2> /dev/null
  echo "compile >> removed previous build artifacts"
fi

# Compile new resume
echo "compile >> compiling resume.tex"
xelatex resume.tex

# If we successfully made a new resume, rename it
if [ -e resume.pdf ]; then
  mv resume.pdf "Josh_Hawkins_Resume_$DATE.pdf"
  if [ $? -eq 0 ]; then
    echo "compile >> produced Josh_Hawkins_Resume_$DATE.pdf"
    echo "compile >> ok"
  else
    echo "compile >> failed to rename pdf"
    echo "compile >> not ok"
  fi
else
  echo "compile >> not ok"
fi

