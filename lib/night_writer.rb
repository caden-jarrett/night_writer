# This is the project runner file
# command to run : ruby ./lib/night_writer.rb message.txt braille.txt
#================================#

require "./lib/file_translate"
require "./lib/text_to_braille"

english_translate = TexttoBraille.new(ARGV[0], ARGV[1])
english_translate.braille_start
