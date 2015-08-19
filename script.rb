require 'feedjira'

url = "http://www.hackthehood.org/4/feed"
feed = Feedjira::Feed.fetch_and_parse url

feed.entries.each {|entry| puts entry.title}


# feed.entries.each do |entry|
# 	# when we move to rails:
# 	# feed_entry = FeedEntry.new
# 	puts "title: " + entry.title

# 	puts "url: " + entry.url

# 	puts "last modified: " + entry.last_modified.inspect
# end

#[:@title, :@url, :@published, :@categories, :@entry_id, :@summary, :@content]

# $i = 0
# $num = 5
# begin
#    puts("Inside the loop i = #$i" )
#    $i +=1
# end while $i < $num

$i = 0
$num = feed.entries.length
begin
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
	puts("summary: " + feed.entries[$i].summary)
	puts("")
	puts("content: " + feed.entries[$i].content)
	$i += 1
	puts("")
	puts("")
	puts("")
	puts("")
	puts("")
end while $i<$num
