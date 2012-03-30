class Bakasha < ActiveRecord::Base
    attr_accessible :recv_date, :meeting_reason, :pniyas_attributes
    has_many :pniyas

    accepts_nested_attributes_for :pniyas
end
