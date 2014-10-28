When(/^I enter "(.*?)"$/) do |value|
	value.chars.each do |chr|
		touch("button marked:'#{chr}'")
	end
end

Then /^I save a screenshot named "(.*?)"$/ do |filename|
 frankly_screenshot(filename+'.png')
end