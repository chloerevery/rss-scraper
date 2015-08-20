require 'feedjira'


url = "http://www.hackthehood.org/4/feed"
feed = Feedjira::Feed.fetch_and_parse url


$i = 0
$num = feed.entries.length
while $i < $num
	puts("i is: " + $i.inspect)
	puts("")
	puts("title" + feed.entries[$i].title)
	puts("")
	puts("url: " + feed.entries[$i].url)
	puts("")
	puts("published: " + feed.entries[$i].published.inspect)
	puts("")
	
	feed.entries[$i].categories.each do |category|
		puts category
	end

	#puts("categories: " + feed.entries[$i].categories)
	puts("")
	puts("entry id: " + feed.entries[$i].entry_id)
	puts("")
	puts("descirption: " + feed.entries[$i].summary)
	puts("")
	puts("content: " + feed.entries[$i].content)
	puts("")
	### parse deadline ###
	$contentString = (feed.entries[$i].content).downcase
	puts("contentString " + $contentString)
	$contentStringIndex = $contentString.index("deadline")
	puts("contentStringIndex " + $contentStringIndex.inspect)
	$str = ""
	$currentCharIndex = $contentStringIndex

	if $currentCharIndex != nil
		while $contentString[$currentCharIndex] != '<'
			$str = $str+$contentString[$currentCharIndex]
			$currentCharIndex+=1
		end 
	else
		$str = "Rolling deadline."
	end
	puts("String is: " + $str)
	### done parsing deadline ### 
	$i += 1
	puts("")
	puts("")
	puts("")
	puts("")
	puts("")
end
