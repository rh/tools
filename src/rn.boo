import System
import System.IO
import System.Text.RegularExpressions

def Recurse(directory as DirectoryInfo, re as Regex, replacement as string):
  for subdir in directory.GetDirectories():
    Recurse(subdir, re, replacement)
  for file in directory.GetFiles():
    Rename(file, re, replacement)

def Rename(file as FileInfo, re as Regex, replacement as string):
  return if not re.IsMatch(file.Name)
  name = re.Replace(file.Name, replacement)
  destination = Path.Combine(file.DirectoryName, name)
  if Directory.Exists(".svn"):
    print shell("svn", "move ${file.Name} ${name}")
  else:
    File.Move(file.FullName, destination)

pattern = string.Empty
replacement = string.Empty
recursive = false

for arg in argv:
  if arg == "-r" or arg == "--recursive":
    recursive = true
  else:
    replacement = arg if pattern != string.Empty
    pattern = arg if pattern == string.Empty

if pattern == string.Empty or replacement == string.Empty:
  print "rn: rename files using regular expressions."
  print "Usage: rn [options] <pattern> <replacement>"
  print
  print "Options:"
  print "  -r, --recursive   Recurse into subdirectories"
  print
  print "Example: rn \"^(.*)$\" \"old_$1\""
  return

if recursive:
  Recurse(DirectoryInfo("."), Regex(pattern), replacement)
else:
  for file in DirectoryInfo(".").GetFiles():
    Rename(file, Regex(pattern), replacement)
