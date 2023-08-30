def select_fruit(hash_items_list)
	fruit_hash = []
  keys = hash_items_list.keys
	for key in keys
		if hash_items_list[key] == "Fruit"
		fruit_hash << hash_items_list.assoc(key)
    end
	end
  fruit_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

##my code

