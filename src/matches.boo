import System
import System.Globalization
import System.Text.RegularExpressions
import System.Threading

if argv.Length != 2:
  print "Usage: matches <input> <pattern>"
  return

Thread.CurrentThread.CurrentUICulture = CultureInfo("en")

input   = argv[0]
pattern = argv[1]

characters = {}
for i in range(0, input.Length):
  characters[i] = false

try:
  Regex(pattern)
except e as ArgumentException:
  print "Invalid regular expression '${pattern}': ${e.Message}"
  return

for match as Match in Regex.Matches(input, pattern):
  for i in range(match.Index, match.Index + match.Length):
    characters[i] = true

fg = Console.ForegroundColor
bg = Console.BackgroundColor

for i in range(0, input.Length):
  if characters[i] == true:
    Console.ForegroundColor = bg
    Console.BackgroundColor = fg
  else:
    Console.ForegroundColor = fg
    Console.BackgroundColor = bg
  Console.Write(input[i])

Console.ForegroundColor = fg
Console.BackgroundColor = bg