import System

for arg in argv:
  if arg == "--help":
    print "Usage: guid [options]"
    print
    print "Options:"
    print "  -l     print in lowercase"
    print "  -d     skip dashes"
    return

uppercase = true
dashes = true

for arg in argv:
  if arg == "-l":
    uppercase = false
  elif arg == "-d":
    dashes = false
  else:
  	print "Unknown option: ${arg}"
  	return

guid = Guid.NewGuid().ToString()
guid = guid.Replace("-", "") if not dashes
guid = guid.ToUpper() if uppercase

Console.Write(guid)