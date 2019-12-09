class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :permission_check!

  layout 'backend'

  private
  def permission_check!
    if current_user.role != 'admin'
      redirect_to root_path, notice: '無法存取' 
    end
  end
end

