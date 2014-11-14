When(/^I enter "(.*?)"$/) do |value|
	value.chars.each do |chr|
		touch("button marked:'#{chr}'")
	end
end

Then(/^I the display should show "(.*?)"$/) do |value|
	text = frankly_map( "label marked:'DisplayLabel'", 'text').first
	text.should == value
end

When(/^I touch C Button$/) do
	touch("button marked:'Delete'")
end

When(/^I touch AC Button$/) do
	touch("button marked:'Reset'")
end