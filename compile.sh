#!/bin/sh

# Get today's date
DATE=`date +%Y-%m-%d`
echo "compile >> date: $DATE"

# Remove previous builds
if [ ls ./*esume*.pdf 1> /dev/null 2>&1 ]; then
  rm ./*esume*.pdf 2> /dev/null
  "compile >> removed previous resume"
fi
if [ -e resume.log ]; then
  rm ./resume.aux 2> /dev/null
  rm ./resume.log 2> /dev/null
  rm ./resume.out 2> /dev/null
  echo "compile >> removed previous build artifacts"
fi

# Compile new resume
echo "compile >> compiling resume.tex"
xelatex resume.tex 1> /dev/null

# If we successfully made a new resume, rename it
if [ -e resume.pdf ]; then
  mv resume.pdf "Josh_Hawkins_Resume_$DATE.pdf"
  echo "compile >> produced Josh_Hawkins_Resume_$DATE.pdf"
  echo "compile >> ok"
else
  echo "compile >> not ok"
fi

