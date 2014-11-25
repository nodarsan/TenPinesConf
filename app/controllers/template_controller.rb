class TemplateController < ApplicationController
  def index
    render :template => 'template/index', :layout => nil
  end
  def get
    @templateName = params[:name]
    render :template => 'template/' + @templateName, :layout => nil
  end
end