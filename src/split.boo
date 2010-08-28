import System
import System.Text.RegularExpressions

if argv.Length != 1:
 print "Usage: split <pattern>"
 return

pattern = argv[0]

for line in Console.In:
 for part in Regex.Split(line, pattern):
   print part