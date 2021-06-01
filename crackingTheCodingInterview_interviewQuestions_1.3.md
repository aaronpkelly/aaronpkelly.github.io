# urlify

tags:
- java

For solving this question, first I went here: https://en.wikipedia.org/wiki/Percent-encoding

I really liked this format to initialise a number of paired values (thank you [SO](https://stackoverflow.com/questions/6802483/how-to-directly-initialize-a-hashmap-in-a-literal-way)!):

	private static Map<String, String> percentEncoding = Map.ofEntries (
				entry("!", "%21"),
				entry("#", "%23"),
				entry("$", "%24"),
				entry("%", "%25"),
				entry("&", "%26")
	);