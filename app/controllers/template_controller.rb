class TemplateController < ApplicationController

  def page
    @templateName = params[:name]
    render "templates/#{@templateName}", layout: nil
  end
end

