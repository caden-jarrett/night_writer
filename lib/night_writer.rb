# This is the project runner file
#================================#

require "./lib/file_translate"
require "./lib/text_to_braille"

english_translate = TexttoBraille.new(ARGV[0], ARGV[1])
english_translate.braille_start
