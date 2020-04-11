class ApplicationController < ActionController::Base

  def hello
    render html: "SIMPLE TODO LISTS"
  end
end
