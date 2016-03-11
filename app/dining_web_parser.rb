require 'rubygems'
require 'open-uri'
require 'nokogiri'

base_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/"
menu_path = "todaysentrees.asp"
DOC = Nokogiri::HTML(open(base_url + menu_path))

#USE AND MODIFY only these variables for relative postioning of locations on the website.
POSITIONS = {"Crossroads" => 0, "Cafe 3" => 1, "Foothill" => 2, "Clark Kerr" => 3}

BREAKFAST_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Breakfast"}
LUNCH_DATA = [DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Brunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch/Brunch"}[0],
            DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[1]]
DINNER_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Dinner"}

#If a location is closed for the particular meal time, you will get back an EMPTY RUBY ARRAY.
#Getters return ARRAY of HASHES, each containing item NAME and NUTRITION ATTRIBUTEs (e.g. Total Fat, etc)
def get_breakfast_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_breakfast_items = []

    return get_item_hashes(BREAKFAST_DATA[index], location_breakfast_items)
end

def get_lunch_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_lunch_items = []

    return get_item_hashes(LUNCH_DATA[index], location_lunch_items)
end

def get_dinner_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end
    location_dinner_items = []

    return get_item_hashes(DINNER_DATA[index], location_dinner_items)
end

def get_item_hashes(sub_menu, items)
    sub_menu.css("a").each do |item|
        item_url = base_url + item.attributes["href"].value
        item_doc = Nokogiri::HTML(open(item_url))
        item_hash = {}

        item_hash["Name"] = item.text
        item_hash["Calories"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Calories/}.first.text.match(/^Calories.(\d*)/)[1]
        item_hash["Calories from Fat"] = item_doc.css("font").select{|candidate| candidate.text =~ /Calories from/}.first.text.match(/Calories from Fat.(\d*)/)[1]

        item_hash["Total Fat"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Total/}.first.next.text
        item_hash["Total Fat Pct"] = (item_hash["Total Fat"][0..-2].to_f / 65 * 100).round.to_s

        item_hash["Tot. Carb"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Tot\./}.first.next.text
        item_hash["Tot. Carb Pct"] = (item_hash["Tot. Carb"][0..-2].to_f / 300 * 100).round.to_s

        item_hash["Sat. Fat"] = item_doc.css("font").select{|candidate| candidate.text =~ /Sat\./}.first.next.text
        item_hash["Sat. Fat Pct"] = (item_hash["Sat. Fat"][0..-2].to_f / 20 * 100).round.to_s

        item_hash["Dietary Fiber"] = item_doc.css("font").select{|candidate| candidate.text =~ /Dietary/}.first.next.text
        item_hash["Dietary Fiber Pct"] = (item_hash["Dietary Fiber"][0..-2].to_f / 25 * 100).round.to_s

        item_hash["Trans Fat"] = item_doc.css("font").select{|candidate| candidate.text =~ /Trans/}.first.next.text

        item_hash["Sugars"] = item_doc.css("font").select{|candidate| candidate.text =~ /Sugars/}.first.next.text

        item_hash["Cholesterol"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Cholesterol/}.first.next.text
        item_hash["Cholesterol Pct"] = (item_hash["Cholesterol"][0..-3].to_f / 300 * 100).round.to_s

        item_hash["Protein"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Protein/}.first.next.text

        item_hash["Sodium"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Sodium/}.first.next.text
        item_hash["Sodium Pct"] = (item_hash["Sodium"][0..-3].to_f / 2400 * 100).round.to_s

        #All are percentages
        item_hash["Vitamin C"] = item_doc.css("font").select{|candidate| candidate.text =~ /Vitamin C/}.first.next.next.text.match(/(\d*)%\z/)[1]
        item_hash["Calcium"] = item_doc.css("font").select{|candidate| candidate.text =~ /Calcium/}.first.next.next.text.match(/(\d*)%\z/)[1]
        item_hash["Iron"] = item_doc.css("font").select{|candidate| candidate.text =~ /Iron/}.first.next.next.text.match(/(\d*)%\z/)[1]

        item_hash["Allergens"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^ALLERGENS/}.first.text.gsub("\u00A0", " ").match(/ALLERGENS:\s+(.*)/)[1]
        item_hash["Ingredients"] = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^INGREDIENTS/}.first.text.gsub("\u00A0", " ").match(/INGREDIENTS:\s+(.*)/)[1]

        items << item_hash
    end

    return items
end