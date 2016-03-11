require 'rubygems'
require 'open-uri'
require 'nokogiri'

@base_url = "http://services.housing.berkeley.edu/FoodPro/dining/static/"
@menu_path = "todaysentrees.asp"
DOC = Nokogiri::HTML(open(@base_url + @menu_path))

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

    return get_item_hashes(BREAKFAST_DATA[index])
end

def get_lunch_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end

    return get_item_hashes(LUNCH_DATA[index])
end

def get_dinner_items(location)
    index = POSITIONS[location]
    if index.nil?
        raise ArgumentError, "Invalid location name: #{location} entered."
    end

    return get_item_hashes(DINNER_DATA[index])
end

def get_item_hashes(sub_menu)
    items = []

    sub_menu.css("a").each do |item|
        item_url = @base_url + item.attributes["href"].value
        item_doc = Nokogiri::HTML(open(item_url))
        item_hash = {}

        item_hash["Name"] = item.text

        if item_doc.css("font").select{|candidate| candidate.css("i").text =~ /^Nutritional Information is not available/}.empty?
            item_hash["Nutrition Available"] = true
        else
            item_hash["Nutrition Available"] = false
            break
        end

        c_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Calories/}.first.text.match(/^Calories.(\d*)/)
        item_hash["Calories"] = c_match[1] if c_match

        cff_match = item_doc.css("font").select{|candidate| candidate.text =~ /Calories from/}.first.text.match(/Calories from Fat.(\d*)/)
        item_hash["Calories from Fat"] = cff_match[1] if cff_match

        tf_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Total/}.first.next.text
        item_hash["Total Fat"] = tf_text if tf_text
        item_hash["Total Fat Pct"] = (item_hash["Total Fat"][0..-2].to_f / 65 * 100).round.to_s if tf_text

        tc_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Tot\./}.first.next.text
        item_hash["Tot. Carb"] = tc_text if tc_text
        item_hash["Tot. Carb Pct"] = (item_hash["Tot. Carb"][0..-2].to_f / 300 * 100).round.to_s if tc_text

        sf_text = item_doc.css("font").select{|candidate| candidate.text =~ /Sat\./}.first.next.text
        item_hash["Sat. Fat"] = sf_text if sf_text
        item_hash["Sat. Fat Pct"] = (item_hash["Sat. Fat"][0..-2].to_f / 20 * 100).round.to_s if sf_text

        df_text = item_doc.css("font").select{|candidate| candidate.text =~ /Dietary/}.first.next.text
        item_hash["Dietary Fiber"] = df_text if df_text
        item_hash["Dietary Fiber Pct"] = (item_hash["Dietary Fiber"][0..-2].to_f / 25 * 100).round.to_s if df_text

        trf_text = item_doc.css("font").select{|candidate| candidate.text =~ /Trans/}.first.next.text
        item_hash["Trans Fat"] = trf_text if trf_text

        su_text = item_doc.css("font").select{|candidate| candidate.text =~ /Sugars/}.first.next.text
        item_hash["Sugars"] = su_text if su_text

        ch_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Cholesterol/}.first.next.text
        item_hash["Cholesterol"] = ch_text if ch_text
        item_hash["Cholesterol Pct"] = (item_hash["Cholesterol"][0..-3].to_f / 300 * 100).round.to_s if ch_text

        p_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Protein/}.first.next.text
        item_hash["Protein"] = p_text if p_text

        sd_text = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^Sodium/}.first.next.text
        item_hash["Sodium"] = sd_text if sd_text
        item_hash["Sodium Pct"] = (item_hash["Sodium"][0..-3].to_f / 2400 * 100).round.to_s if sd_text

        # Percentage
        vc_match = item_doc.css("font").select{|candidate| candidate.text =~ /Vitamin C/}.first.next.next.text.match(/(\d*)%\z/)
        item_hash["Vitamin C"] = vc_match[1] if vc_match

        # Percentage
        ca_match = item_doc.css("font").select{|candidate| candidate.text =~ /Calcium/}.first.next.next.text.match(/(\d*)%\z/)
        item_hash["Calcium"] = ca_match[1] if ca_match

        # Percentage
        fe_match = item_doc.css("font").select{|candidate| candidate.text =~ /Iron/}.first.next.next.text.match(/(\d*)%\z/)
        item_hash["Iron"] = fe_match[1] if fe_match

        # Form: single string (looks like list)
        al_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^ALLERGENS/}.first.text.gsub("\u00A0", " ").match(/ALLERGENS:\s+(.*)/)
        item_hash["Allergens"] = al_match[1] if al_match

        # Form: single string (looks like list)
        i_match = item_doc.css("font").select{|candidate| candidate.css("b").text =~ /^INGREDIENTS/}.first.text.gsub("\u00A0", " ").match(/INGREDIENTS:\s+(.*)/)
        item_hash["Ingredients"] = i_match[1] if i_match

        items << item_hash
    end

    return items
end