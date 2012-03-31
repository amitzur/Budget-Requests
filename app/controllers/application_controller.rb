class ApplicationController < ActionController::Base
  protect_from_forgery

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
    url = 'http://budget.msh.gov.il/0020?full=1&num=10&year=2011'
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
  end
end
