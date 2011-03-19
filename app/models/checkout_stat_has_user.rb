class CheckoutStatHasUser < ActiveRecord::Base
  belongs_to :user_checkout_stat
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :user_checkout_stat_id
  validates_presence_of :user_checkout_stat_id, :user_id

  def self.per_page
    10
  end
end
