class Account < Struct.new(:email, :username)
  def self.find(id)
    new("jon.snow@got.com", "Jon snow")
  end
end

class Item < Struct.new(:name, :source)
  def self.find(id)
    new("playbook", "Amazon")
  end
end

class Purchase < Struct.new(:name, :quantity)
  def self.find(id)
    new("Ygritte", 1)
  end
end

class TemplateGenerator
  def self.render_confirmation_email(data)
    "Hi #{data[:account_username]}, #{data[:purchase_name]} just purchased #{data[:purchase_quantity]} #{data[:item_name]} of your store."
  end

  def self.render_after_confirmation_email(data)
    "Hi #{data[:account_username]}, the item #{data[:item_name]} was purchased of your store."
  end
end

class PurchaseMailer
end