#!/bin/bash

for file in *; do
    # Check if the file has one of the specified extensions
    if [[ $file =~ \.(jpg|jpeg|png|gif)$ ]]; then
        # Resize the image to have a max width of 400px
        convert "$file" -resize '400x>' "temp_$file"
        
        # Convert the resized image to WebP format
        cwebp -q 80 "temp_$file" -o "${file%.*}.webp"
        
        # Remove the temporary resized image
        rm "temp_$file"
    fi
done

