require 'rubygems'
require 'open-uri'
require 'nokogiri'

dining_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/todaysentrees.asp"
DOC = Nokogiri::HTML(open(dining_url))

#USE AND MODIFY only these variables for relative postioning of locations on the website.
POSITIONS = {"Crossroads" => 0, "Cafe 3" => 1, "Foothill" => 2, "Clark Kerr" => 3}

BREAKFAST_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Breakfast"}
LUNCH_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"} +
            DOC.css("td").select{|candidate| candidate.css("b").text == "Brunch"} +
            DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch/Brunch"}
DINNER_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Dinner"}

#If a location is closed for the particular meal time, you will get back an empty ruby array.
def get_crossroads_breakfast
    crossroads_breakfast_items = []
    BREAKFAST_DATA[CROSSROADS_POSITION].css("a").each{|item| crossroads_breakfast_items << item.text}
    return crossroads_breakfast_items
end

def get_cafe_3_breakfast
    cafe_3_breakfast_items = []
    BREAKFAST_DATA[CAFE_3_POSITION].css("a").each{|item| cafe_3_breakfast_items << item.text}
    return cafe_3_breakfast_items
end

def get_foothill_breakfast
    foothill_breakfast_items = []
    BREAKFAST_DATA[CAFE_3_POSITION].css("a").each{|item| foothill_breakfast_items << item.text}
    return foothill_breakfast_items
end

def get_breakfast_items(location)
    location_breakfast_items = []
    index = POSITIONS[location]
    BREAKFAST_DATA[index].css("a").each{|item| location_breakfast_items << item.text}
    return location_breakfast_items
end