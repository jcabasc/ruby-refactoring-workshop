class Account < Struct.new(:id, :email, :username)
  def self.find(id)
    self.all.map{|account| return account if account.id == id }
    nil
  end

  def self.all
    [ Account.new(1, "jon.snow@got.com", "jonsnow") ]
  end
end

class Item < Struct.new(:id, :name, :source)
  def self.find(id)
    self.all.map{|item| return item if item.id == id }
    nil
  end

  def self.all
    [ Item.new(1,"Playbook", "Amazon") ]
  end
end

class Purchase < Struct.new(:id, :name, :quantity)
  def self.find(id)
    self.all.map{|purchase| return purchase if purchase.id == id }
    nil
  end

  def self.all
    [ Purchase.new(1,"Ygritte", 2) ]
  end
end

class TemplateGenerator
  def self.confirmation(data)
    "Hi #{data[:account_username]}, #{data[:purchase_name]} just purchased #{data[:purchase_quantity]} #{data[:item_name]} of your store."
  end

  def self.after_confirmation(data)
    "Hi #{data[:account_username]}, the item #{data[:item_name]} was purchased of your store."
  end

  def self.send_email(type, data)
    self.send(type, data)
  end
end

class PurchaseMailer
end
