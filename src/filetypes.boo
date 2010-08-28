import System
import System.Collections.Generic
import System.IO

def Recurse(directory as DirectoryInfo, filetypes as List[of string]):
  for subdir in directory.GetDirectories():
    Recurse(subdir, filetypes)
  for file in directory.GetFiles():
    filetypes.Add(file.Extension) if not filetypes.Contains(file.Extension)

filetypes = List[of string]()
Recurse(DirectoryInfo('.'), filetypes)

for filetype in filetypes:
  print filetype if filetype.Length > 0