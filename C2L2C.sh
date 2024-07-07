#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title C2L2C
# @raycast.mode fullOutput
# @raycast.presentationOptions keep

# Optional parameters:
# @raycast.icon 😜
# @raycast.argument1 { "type": "text", "placeholder": "Line" }

# Documentation:
# @raycast.author Alex Mauzon
# @raycast.authorURL https://github.com/mauzon

export LANG="en_US.UTF-8"

input=$1

eng_chars=("q" "w" "e" "r" "t" "y" "u" "i" "o" "p" "[" "]" "a" "s" "d" "f" "g" "h" "j" "k" "l" ";" "'" "z" "x" "c" "v" "b" "n" "m" "," "." "/" "Q" "W" "E" "R" "T" "Y" "U" "I" "O" "P" "{" "}" "A" "S" "D" "F" "G" "H" "J" "K" "L" ":" "\"" "Z" "X" "C" "V" "B" "N" "M" "<" ">" "?")
rus_chars=("й" "ц" "у" "к" "е" "н" "г" "ш" "щ" "з" "х" "ъ" "ф" "ы" "в" "а" "п" "р" "о" "л" "д" "ж" "э" "я" "ч" "с" "м" "и" "т" "ь" "б" "ю" "." "Й" "Ц" "У" "К" "Е" "Н" "Г" "Ш" "Щ" "З" "Х" "Ъ" "Ф" "Ы" "В" "А" "П" "Р" "О" "Л" "Д" "Ж" "Э" "Я" "Ч" "С" "М" "И" "Т" "Ь" "Б" "Ю" ",")

output=""

if [[ "$input" =~ [а-яА-Я] ]]; then
  for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    found=0
    for (( j=0; j<${#rus_chars[@]}; j++ )); do
      if [[ "$char" == "${rus_chars[j]}" ]]; then
        output+="${eng_chars[j]}"
        found=1
        break
      fi
    done
    if [[ $found -eq 0 ]]; then
      output+="$char"
    fi
  done
else
  for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    found=0
    for (( j=0; j<${#eng_chars[@]}; j++ )); do
      if [[ "$char" == "${eng_chars[j]}" ]]; then
        output+="${rus_chars[j]}"
        found=1
        break
      fi
    done
    if [[ $found -eq 0 ]]; then
      output+="$char"
    fi
  done
fi

echo "In: $input"
echo "Out: $output"
echo -n "$output" | pbcopy
