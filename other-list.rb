price = element.xpath("td[@class='price']").text
price = price.gsub(/円/, '').gsub(/,/,'')

if price.is_a?(Integer)
  detail['price'] = price
else
  #EER
end

begin
	if price.is_a?(Integer)
	  detail['price'] = price
	else
		raise
	end
rescue
  exit 1
end


def set_bukken_spec(spec)
  id = get_bukken_id(spec['url'])
  if id.nil?
	  query = "INSERT INTO houseing(name,url,address,
	    access,distance,age,floor_number)
	    VALUES('#{spec['name']}','#{spec['url']}',
	    '#{spec['name']}','#{spec['access']}',
	    '#{spec['distance']}','#{spec['age']}'
	    '#{spec['floor']}')"
	  puts query
	  @client.query(query)
	  id = get_bukken_id(spec['url'])
  end
  return id
end

def get_bukken_id(url)
  id = nil
  @client.query(
    "select id fromhousing where url = '#{url}'").each do |row|
      id = row["id"]
    end
    return id
end

