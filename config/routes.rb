Rails.application.routes.draw do
  # Routes for the Daily reflection resource:

  # CREATE
  match("/new_daily_reflection_form", { :controller => "daily_reflections", :action => "blank_form", :via => "get" })
  match("/insert_daily_reflection_record", { :controller => "daily_reflections", :action => "save_new_info", :via => "post" })

  # READ
  match("/daily_reflections", { :controller => "daily_reflections", :action => "list", :via => "get" })
  match("/daily_reflections/:id_to_display", { :controller => "daily_reflections", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_daily_reflection_form/:id_to_prefill", { :controller => "daily_reflections", :action => "prefilled_form", :via => "get" })
  match("/update_daily_reflection_record/:id_to_modify", { :controller => "daily_reflections", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_daily_reflection/:id_to_remove", { :controller => "daily_reflections", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
