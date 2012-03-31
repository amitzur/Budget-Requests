class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  require 'net/http'
  respond_to :json

  def index
    @scans = Scan.all
    #@scansArr = Array.new
    #scans.each do |scan|
    #  @scansArr << { :url => '/bakashas/new', :scan => scan }
    #end
    @heading = 'welcome'
    @subheading = 'welcome_desc'
  end

  def raw

  end

  def get_budget
    url = 'http://budget.msh.gov.il/' + params[:id] + '?full=0&num=1&year=2011'
    resp = Net::HTTP.get_response(URI.parse(url))
    if resp.code.to_i >= 200 and resp.code.to_i < 300
      data = resp.body
      j = JSON.parse(data)
      if j[0].nil?
        name = '-'
      else
        name = j[0]['title']
      end
    else
      name = '-'
    end
    respond_with({ :haavara_name => name })
  end
end
