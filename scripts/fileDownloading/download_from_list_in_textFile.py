import urllib.request
import shutil
import re

EXTENSION = ".mp3"

for url in open('dAndDIsForNerds_remaining.txt'):

	print("attempting to open url: " + url)
	response = urllib.request.urlopen(url)
	matchObj = re.match( r'.*\/(.*)\/', url).group(1)
	outfile = open(str(matchObj + EXTENSION), 'wb')
		
	print("downloading " + str(matchObj) + EXTENSION)
		
	shutil.copyfileobj(response, outfile)
