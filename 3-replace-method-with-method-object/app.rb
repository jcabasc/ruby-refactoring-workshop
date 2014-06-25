require File.expand_path('../setup.rb', __FILE__)

class PurchaseMailer
  def confirmation(account_id, item_id, purchase_id)
    @account = Account.find(account_id)
    @item = Item.find(item_id)
    @purchase = Purchase.find(purchase_id)
    data = {
      purchase_name: @purchase.name,
      purchase_quantity: @purchase.quantity,
      item_source: @item.source,
      account_email: @account.email,
      account_username: @account.username,
      item_name: @item.name
    }
    TemplateGenerator.send_email('confirmation', data)
  end

  def after_confirmation(account_id, item_id)
    @account = Account.find(account_id)
    @item = Item.find(item_id)
    data = {
      account_email: @account.email,
      account_username: @account.username,
      item_name: @item.name
    }
    TemplateGenerator.send_email('after_confirmation', data)
  end
end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0
