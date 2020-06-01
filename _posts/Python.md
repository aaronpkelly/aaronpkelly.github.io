
# Path
I wrote this script that uses `Path` to get the current directory, and I don't want to lose it.
The script I use in [[Preparing text files for indexing]] uses `os.cwd()`:

```
from pathlib import Path
import time
import json

p = Path('.')

def printJsonKeyValue(key, value):
    rst = (value.split(' ', 1))
    print('\t' + key + ': ' + json.dumps(rst[1]) + ',')

for file in p.iterdir():
    with file.open() as f:

        msg_header = f.readline().rstrip()

        if 'Subject' in msg_header:

            print('{')
            printJsonKeyValue('subject', msg_header)
            printJsonKeyValue('from', f.readline().rstrip())
            printJsonKeyValue('to', f.readline().rstrip())
            printJsonKeyValue('body', f.read())
            print('}')
            time.sleep(5)
```