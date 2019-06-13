class DailyReflectionsController < ApplicationController
  def list
    @daily_reflections = DailyReflection.where( :user_id => current_user.id )

    render("daily_reflection_templates/list.html.erb")
  end

  def details
    @daily_reflection = DailyReflection.where({ :id => params.fetch("id_to_display") }).first

    render("daily_reflection_templates/details.html.erb")
  end

  def blank_form
    @daily_reflection = DailyReflection.new

    render("daily_reflection_templates/blank_form.html.erb")
  end

  def save_new_info
    @daily_reflection = DailyReflection.new

    @daily_reflection.reflection_text = params.fetch("reflection_text")
    @daily_reflection.user_id = params.fetch("user_id")

    if @daily_reflection.valid?
      @daily_reflection.save

      redirect_to("/daily_reflections", { :notice => "Daily reflection created successfully." })
    else
      render("daily_reflection_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @daily_reflection = DailyReflection.where({ :id => params.fetch("id_to_prefill") }).first

    render("daily_reflection_templates/prefilled_form.html.erb")
  end

  def save_edits
    @daily_reflection = DailyReflection.where({ :id => params.fetch("id_to_modify") }).first

    @daily_reflection.reflection_text = params.fetch("reflection_text")
    @daily_reflection.user_id = params.fetch("user_id")

    if @daily_reflection.valid?
      @daily_reflection.save

      redirect_to("/daily_reflections/" + @daily_reflection.id.to_s, { :notice => "Daily reflection updated successfully." })
    else
      render("daily_reflection_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @daily_reflection = DailyReflection.where({ :id => params.fetch("id_to_remove") }).first

    @daily_reflection.destroy

    redirect_to("/daily_reflections", { :notice => "Daily reflection deleted successfully." })
  end
  
end
