# Preparing text files for indexing

Indexing tools don't solve the problem of automatically sifting throught your
source content and somehow creating a sensible structure for it... it
expects you to solve this, and then provide it with metadata. It's strength is
providing near-instant data search, but you do the prep.

So, if you do find yourself with lots of data in different formats, you have a
bit of work to do.

## Media attachments, a problem for another day

Generally I'm not too concerned with sorting all of this. I created a folder
for each filetype and then uploaded it to it's own bucket on S3. Organising
media is a future problem!

## JSONifying Plain-text

I wrote a quick python script to jsonify all my emails:

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

And here's another one I wrote, after I completely forgot about the above script (because I'm a doofus):

```
import json
import os
import sys
import re

directory_in_str = os.getcwd()
directory = os.fsencode(directory_in_str)

bigList = list()
id = 0

def convertFileToDict(filename, theFile):

	global id
	firstLine = theFile.readline()

	# detect if the txt file is an exported email
	if firstLine.startswith('Subject: '):

		subjectLine = firstLine
		fromLine = theFile.readline()
		dateLine = theFile.readline()
		toLine = theFile.readline()
		payloadLines = theFile.read()

		emailDict = {}

		# mellisearch will infer a primary key for each
		# item ONLY IF the attribute name has a case-insensitive
		# name containing 'id' somewhere
		emailDict['id']=id
		emailDict['Subject']=subjectLine[9:]
		emailDict['From']=fromLine[6:].replace('"', "").replace('<', '').replace('>', '')
		emailDict['Date']=dateLine[6:]
		emailDict['To']=toLine[4:].replace('"', "").replace('<', '').replace('>', '')
		emailDict['Payload']=payloadLines
		
		# bigDict['0']=emailDict
		bigList.append(emailDict)

		id += 1

		#if id == 2:
		#	print(json.dumps(bigList))
		#	sys.exit()

for file in os.listdir(directory):

	filename = os.fsdecode(file)
	
	if filename.endswith('.txt'):
		# print('processing: ' + filename)
		
		with open(filename) as theFile:
			convertFileToDict(filename, theFile)

print(json.dumps(bigList))
```

The script will print the JSON to the output, but that can be redirected to a file:

```
python3 textToJSON.py > myEmails.json
```