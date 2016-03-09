require 'rubygems'
require 'open-uri'
require 'nokogiri'

dining_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/todaysentrees.asp"
DOC = Nokogiri::HTML(open(dining_url))

#USE AND MODIFY only these variables for relative postioning of locations on the website.
POSITIONS = {"Crossroads" => 0, "Cafe 3" => 1, "Foothill" => 2, "Clark Kerr" => 3}

BREAKFAST_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Breakfast"}
LUNCH_DATA = [DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Brunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch/Brunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[1]]
DINNER_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Dinner"}

#If a location is closed for the particular meal time, you will get back an EMPTY RUBY ARRAY.

def get_breakfast_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_breakfast_items = []
    BREAKFAST_DATA[index].css("a").each{|item| location_breakfast_items << item.text}
    return location_breakfast_items
end

def get_lunch_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_lunch_items = []
    LUNCH_DATA[index].css("a").each{|item| location_lunch_items << item.text}
    return location_lunch_items
end

def get_dinner_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_dinner_items = []
    DINNER_DATA[index].css("a").each{|item| location_dinner_items << item.text}
    return location_dinner_items
end
