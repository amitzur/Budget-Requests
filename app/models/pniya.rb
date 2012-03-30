class Pniya < ActiveRecord::Base
    attr_accessible :mispar, :haavaras_attributes
    belongs_to :bakasha
    has_many :haavaras

    accepts_nested_attributes_for :haavaras
end
