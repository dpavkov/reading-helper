class Users::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected


  protected


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    "/word/stream"
  end

  # Overwiting the method used to redirect back to a desired path after sign in
  # Has to be overwritten in order for after_sign_out_path_for and after_sign_in_path_for to work
  def stored_location_for(resource_or_scope)
    nil
  end
end
