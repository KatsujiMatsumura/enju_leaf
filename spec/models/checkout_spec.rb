# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Checkout do
  #pending "add some examples to (or delete) #{__FILE__}"
  fixtures :all

  it "should respond to checkout_renewable?" do
    checkouts(:checkout_00001).checkout_renewable?.should be_true
    checkouts(:checkout_00002).checkout_renewable?.should be_false
  end

  it "should respond to reserved?" do
    checkouts(:checkout_00001).reserved?.should be_false
    checkouts(:checkout_00002).reserved?.should be_true
  end

  it "should respond to overdue?" do
    checkouts(:checkout_00001).overdue?.should be_false
    checkouts(:checkout_00006).overdue?.should be_true
  end

  it "should respond to is_today_due_date?" do
    checkouts(:checkout_00001).is_today_due_date?.should be_false
  end
end