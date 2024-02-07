#!/bin/bash

# Check if the text argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 text"
  exit 1
fi

# Set the text, font, size, color, and background variables
text="$1"
font="Hack-Regular"
size="32"
color="black"
background="transparent"

# Create a temporary PNG file with the text
touch test.png
convert -font $font -pointsize $size -fill $color -background $background label:"$text" test.png

# Resize the PNG file to 16x16 and 32x32 pixels
convert test.png -resize 16x16 favicon-16.png
convert test.png -resize 32x32 favicon-32.png

# Delete the temporary file
rm test.png

# Combine the resized PNG files into a single ICO file
convert favicon-16.png favicon-32.png -colors 256 favicon.ico

# Delete the PNG files
rm favicon-16.png favicon-32.png

# Display a message
echo "Favicon created from text: $text"
