class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    
    p "XXXXXXXXXXXXXX"
  end

  def update
    super
  end
end 