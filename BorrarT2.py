#!/usr/bin/python

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.

import os
import sys

nombreimagen2000 = sys.argv[1]+"2000.jp2" 

os.system("parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 rm -R "+nombreimagen2000+"")
