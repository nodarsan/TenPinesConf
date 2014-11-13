class TemplateController < ApplicationController
  # caches_page :page

  def page
    @path = params[:path]
    render :template => 'templates/' + @path, :layout => nil
  end
end

