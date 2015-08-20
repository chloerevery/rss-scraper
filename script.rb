require 'feedjira'


url = "http://www.hackthehood.org/4/feed"
feed = Feedjira::Feed.fetch_and_parse url

### get_text_between ###
#str: string to extract text from
#start: (string) begin grabbing text at the index where start first appears
#finish: stop grabbing when this char is encountered
#default: what string to put in db if no result

def get_text_between(str, start, finish, default)
	puts("string to grab text from: " + str)
	new_str = ""
	current_char_index = str.index(start)
	if current_char_index != nil
		while str[current_char_index] != finish
			new_str = new_str + str[current_char_index]
			current_char_index += 1
		end
	else
		new_str = default
	end
	return new_str
end

$i = 0
$num = feed.entries.length
while $i < $num
	puts("i is: " + $i.inspect)
	puts("")
	puts("title: " + feed.entries[$i].title)
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
	$contentString = (feed.entries[$i].content).downcase
	### parse deadline ###
	$temp = get_text_between($contentString, "deadline", '<', "rolling deadline")
	puts("Deadline: " + $temp)

	### parse recruiter name###
	$temp = get_text_between($contentString, "contact name", '<', "no contact info")
	puts("Recruiter Name: " + $temp)

	### parse recruiter email###
	$temp = get_text_between($contentString, "email", '<', "no contact email")
	puts("Recruiter Email: " + $temp)

	### parse recruiter phone###
	$temp = get_text_between($contentString, "phone", '<', "no contact phone number")
	puts("Recruiter Phone: " + $temp)

	$i += 1
	puts("")
	puts("")
	puts("")
	puts("")
	puts("")
end
