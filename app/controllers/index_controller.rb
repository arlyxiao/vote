# -*- encoding : utf-8 -*-
class IndexController < ApplicationController
  def index
    
    if logged_in?
      @user = current_user
      return render :template=>'index/index'
    end
    
    # 如果还没有登录，渲染登录页
    return render :template=>'index/login'
  end
end
