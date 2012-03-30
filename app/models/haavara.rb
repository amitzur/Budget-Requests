class Haavara < ActiveRecord::Base
    attr_accessible :prat, :hotsaa_from, :hotsaa_to, :hotsaa_mut_from, :hotsaa_mut_to, :harshaa_from, :harshaa_to, :ska_from, :ska_to, :diff_hotsaa, :diff_hostaa_mut, :diff_harshaa, :diff_ska

    belongs_to :pniya
end
