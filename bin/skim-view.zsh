#!/usr/bin/env zsh

# The first argument should be the PDF file
file=$1
[[ ${file:0:1} == / ]] || file=${PWD}/${file}

# Open or reload the PDF in Skim
/usr/bin/osascript << EOF
    set theFile to POSIX file "${file}" as alias
    set thePath to POSIX path of theFile
    tell application "Skim"
        -- activate
        set theDocs to get documents whose path is thePath
        try
            if (count of theDocs) > 0 then revert theDocs
        end try
        open theFile
    end tell
EOF

