class ApplicationController < ActionController::Base
  def time_duration(a,b)
    c=b-a
    @duration=Time.at(c)
  end
end
