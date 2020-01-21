def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0 
  while i < collection.length do 
    if collection[i][:item] == name
      return collection[i]
    end
  i += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing
  new_cart = []
  i = 0 
  while i < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item != nil 
      new_cart_item[:count] += 1 
    else
      new_cart_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1 
      }
      new_cart << new_cart_item
    end
    i += 1 
  end
  new_cart
  
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  result = []
  if coupons.length == 0 
    return cart
  end
  count = 0 
  while count < cart.length do 
    
    citem = cart[count]
    
    couponitem = find_item_by_name_in_collection(citem[:item], coupons)
    
    if couponitem
      no_coupon_count = couponitem[:num] % citem[:count]
      coupons_appiled_count = citem[:count] - no_coupon_count
      per_unit_price = couponitem[:cost] / couponitem[:num]
      
      temp_hash = {
        :item => "#{citem[:item]} W/COUPON",
        :price => per_unit_price,
        :clearance => citem[:clearance],
        :count => coupons_appiled_count
      }
      
      result << temp_hash
      citem[:count] = no_coupon_count
    end
    
    result << citem
    
    
    # counter = 0 
    # while counter < coupons.length do 
    #   if cart[count][:item] == coupons[counter][:item]
    #     no_coupon_count = coupons[counter][:num] % cart[count][:count]
    #     coupons_appiled_count = cart[count][:count] - no_coupon_count
    #     per_unit_price = coupons[counter][:cost] / coupons[counter][:num]
        
    #     temp_hash = {
    #       :item => "#{cart[count][:item]} W/COUPON",
    #       :price => per_unit_price,
    #       :clearance => cart[count][:clearance],
    #       :count => coupons_appiled_count
    #     }
    #     cart[count][:count]  = no_coupon_count
    #     result << temp_hash
    #   end
    #   counter += 1 
    # end
      # result << cart[count] 
    count += 1 
  end
  return result
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
