#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestPurchaseMailer < Minitest::Test
  def setup
    @purchase_mailer = PurchaseMailer.new
  end

  def test_confirmation
    matched_string = "Hi jonsnow, Ygritte just purchased 2 Playbook of your store."
    assert_equal @purchase_mailer.confirmation(1,1,1), matched_string
  end

  def test_after_confirmation
    matched_string = "Hi jonsnow, the item Playbook was purchased of your store."
    assert_equal @purchase_mailer.after_confirmation(1,1), matched_string
  end

end
