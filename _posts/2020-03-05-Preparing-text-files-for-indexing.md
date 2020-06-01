---
title: Preparing text files for indexing
description:
date: 2020-03-05
tags:
    - mbox
---

# Preparing text files for indexing

Indexing tools don't solve the problem of automatically sifting throught your source content and somehow creating a sensible structure for it... itexpects you to solve this, and then provide it with metadata. It's strength is providing near-instant data search, but you do the prep.

So, if you do find yourself with lots of data in different formats, you have a bit of work to do.

## Media attachments, a problem for another day

Generally I'm not too concerned with sorting all of this. I created a folder for each filetype and then uploaded it to it's own bucket on S3. Organising media is a future problem!

## JSONifying Plain-text

I wrote a quick [[Python]] script to JSONify all email-format text files in the current directory:

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