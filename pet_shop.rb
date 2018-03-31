# Find pet shop name using pet_shop_name

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# Find total cash value using total_cash

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# Increment or decrement total_cash using supplied value

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end

# Return the value of pets_sold from admin section of pet_shop

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# Increment the value of pets_sold in the admin section of pet_shop

def increase_pets_sold(pet_shop, increase)
  pet_shop[:admin][:pets_sold] += increase
end

# Return the number of pets in the pet_shop

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

# Return array of occurences of supplied breed

def pets_by_breed(pet_shop, breed)
  saved_breeds = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      saved_breeds.push(pet)
    end
  end
  return saved_breeds
end

# Return pet details from pet_shop based on supplied name, or nil if not found

def find_pet_by_name(pet_shop, supplied_name)
  for pet in pet_shop[:pets]
    if supplied_name == pet[:name]
      return pet
    end
  end
  return nil
end

# Delete a pet from pet_shop using supplied name

def remove_pet_by_name(pet_shop, supplied_name)
  for pet in pet_shop[:pets]
    if supplied_name == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

# Add a new pet to pet_shop using supplied details

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

# Return the number of pets per supplied customer

def customer_pet_count(supplied_customer)
  return supplied_customer[:pets].length
end

# Add supplied details of a new pet to a supplied customer

def add_pet_to_customer(supplied_customer, new_pet)
  supplied_customer[:pets].push(new_pet)
end

# If supplied customer can afford a supplied pet return true, false if not

def customer_can_afford_pet(supplied_customer, new_pet)
  if supplied_customer[:cash] < new_pet[:price]
    return false
  else
    return true
  end
end

# Sell supplied pet from pet_shop to a supplied customer

def sell_pet_to_customer(pet_shop, supplied_pet, supplied_customer)
#   # update customer pets and customer money
  if supplied_pet != nil && customer_can_afford_pet(supplied_customer, supplied_pet) == true
    increase_pets_sold(pet_shop, 1)
    add_pet_to_customer(supplied_customer,supplied_pet)
    add_or_remove_cash(pet_shop, supplied_pet[:price])
    customer_pet_count(supplied_customer)
    # remove_pet_by_name
  end

end
