require 'rubygems'
require 'open-uri'
require 'nokogiri'
def perform
  @base_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/"
  @menu_path = "todaysentrees.asp"
  DOC = Nokogiri::HTML(open(@base_url + @menu_path))
  
  BREAKFAST_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Breakfast"}
  LUNCH_DATA = [DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[0],
              DOC.css("td").select{|candidate| candidate.css("b").text == "Brunch"}[0],
              DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch/Brunch"}[0],
              DOC.css("td").select{|candidate| candidate.css("b").text == "Lunch"}[1]]
  DINNER_DATA = DOC.css("td").select{|candidate| candidate.css("b").text == "Dinner"}
  
  MEALS = {"Breakfast" => BREAKFAST_DATA, "Lunch" => LUNCH_DATA, "Dinner" => DINNER_DATA}
  
  # USE AND MODIFY only these variables for relative postioning of locations on the website.
  POSITIONS = {"Crossroads" => 0, "Cafe 3" => 1, "Foothill" => 2, "Clark Kerr" => 3}
  
  # TODO: implement assigning items to corresponding menu here
  for key1 in meals
    for key2 in positions
      meal = MEAL[key1]
      index = POSITIONS[location]
      submenu = meal[index]
      get_submenu_items(submenu)
end

# Input: submenu nokogiri object (e.g. Breakfast at Crossroads object)
# Output: ARRAY of HASHES; each hash contains item NAME, NUTRITION ATTRIBUTES (e.g. Total Fat, etc)
# If a location is closed for the particular meal time, you will get back an EMPTY RUBY ARRAY.

# TODO: create or get items objects (look up existing ones by name)
def get_submenu_items(submenu)
  items = []

  submenu.css("a").each do |item|
    item_url = @base_url + item.attributes["href"].value
    item_doc = Nokogiri::HTML(open(item_url))
    item_hash = {}

    item_hash["name"] = item.text

    if item_doc.css("font").select{|candidate| candidate.css("i").text =~ /^Nutritional Information is not available/}.empty?
      item_hash["nutrition_available"] = true
    else
      item_hash["nutrition_available"] = false
      break
    end

    c_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Calories/}.first.text.match(/^Calories.(\d*)/)
    item_hash["calories"] = c_match[1] if c_match

    cff_match = item_doc.css("font").select{|candidate| candidate.text =~ /Calories from/}.first.text.match(/Calories from Fat.(\d*)/)
    item_hash["calories_from_fat"] = cff_match[1] if cff_match

    tf_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Total/}.first.next.text
    item_hash["total_fat"] = tf_text if tf_text
    item_hash["total_fat_percent"] = (item_hash["total_fat"][0..-2].to_f / 65 * 100).round.to_s if tf_text

    tc_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Tot\./}.first.next.text
    item_hash["total_carbohydrates"] = tc_text if tc_text
    item_hash["total_carbohydrates_percent"] = (item_hash["total_carbohydrates"][0..-2].to_f / 300 * 100).round.to_s if tc_text

    sf_text = item_doc.css("font").select{|candidate| candidate.text =~ /Sat\./}.first.next.text
    item_hash["saturated_fat"] = sf_text if sf_text
    item_hash["saturated_fat_percent"] = (item_hash["saturated_fat"][0..-2].to_f / 20 * 100).round.to_s if sf_text

    df_text = item_doc.css("font").select{|candidate| candidate.text =~ /Dietary/}.first.next.text
    item_hash["dietary_fiber"] = df_text if df_text
    item_hash["dietary_fiber_percent"] = (item_hash["dietary_fiber"][0..-2].to_f / 25 * 100).round.to_s if df_text

    trf_text = item_doc.css("font").select{|candidate| candidate.text =~ /Trans/}.first.next.text
    item_hash["trans_fat"] = trf_text if trf_text

    su_text = item_doc.css("font").select{|candidate| candidate.text =~ /Sugars/}.first.next.text
    item_hash["sugars"] = su_text if su_text

    ch_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Cholesterol/}.first.next.text
    item_hash["cholesterol"] = ch_text if ch_text
    item_hash["cholesterol_percent"] = (item_hash["cholesterol"][0..-3].to_f / 300 * 100).round.to_s if ch_text

    p_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Protein/}.first.next.text
    item_hash["protein"] = p_text if p_text

    sd_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Sodium/}.first.next.text
    item_hash["sodium"] = sd_text if sd_text
    item_hash["sodium_percent"] = (item_hash["sodium"][0..-3].to_f / 2400 * 100).round.to_s if sd_text

    # Percentage
    vc_match = item_doc.css("font").select{|candidate| candidate.text =~ /Vitamin C/}.first.next.next.text.match(/(\d*)%\z/)
    item_hash["vitamin_c_percent"] = vc_match[1] if vc_match

    # Percentage
    ca_match = item_doc.css("font").select{|candidate| candidate.text =~ /Calcium/}.first.next.next.text.match(/(\d*)%\z/)
    item_hash["calcium_percent"] = ca_match[1] if ca_match

    # Percentage
    fe_match = item_doc.css("font").select{|candidate| candidate.text =~ /Iron/}.first.next.next.text.match(/(\d*)%\z/)
    item_hash["iron_percent"] = fe_match[1] if fe_match

    # Form: single string (looks like list)
    al_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^ALLERGENS/}.first.text.gsub("\u00A0", " ").match(/ALLERGENS:\s+(.*)/)
    item_hash["allergens"] = al_match[1] if al_match

    # Form: single string (looks like list)
    ing_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^INGREDIENTS/}.first.text.gsub("\u00A0", " ").match(/INGREDIENTS:\s+(.*)/)
    item_hash["ingredients"] = ing_match[1] if ing_match

    items << item_hash
  end

  return items
end