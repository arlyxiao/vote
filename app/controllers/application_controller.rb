# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all
end
