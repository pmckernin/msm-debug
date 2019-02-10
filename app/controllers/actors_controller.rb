class ActorsController < ApplicationController
  def index
    @actors = Actor.all

    render("actor_templates/index.html.erb")
  end

  def show
    id_to_display = params.fetch(:id_to_display)
    @actor = Actor.find(id_to_display)

    render("actor_templates/show.html.erb")
  end

  def new_form
    render("actor_templates/new_form.html.erb")
  end

  def create_row
    @actor = Actor.new

    @actor.dob = params.fetch(:dob)
    @actor.name = params.fetch(:name)
    @actor.image_url = params.fetch(:image_url)
    @actor.bio = params.fetch(:bio)
    @actor.save

    redirect_to("/actors", :notice => "Actor created successfully.")
  end

  def edit_form
    actor_to_update = params.fetch(:prefill_with_id)
    @actor = Actor.find(actor_to_update)

    render("actor_templates/edit_form.html.erb")
  end

  def update_row
    id_to_modify = params.fetch("id_to_modify")
    @actor = Actor.find(id_to_modify)

    @actor.dob = params.fetch("dob")
    @actor.name = params.fetch("name")
    @actor.bio = params.fetch("bio")
    @actor.image_url = params.fetch("image_url")
    @actor.save

    redirect_to("/actors/#{@actor.id}", :notice => "Actor updated successfully.")
  end

  def destroy_row

    id_to_remove = params.fetch(:id_to_remove)
    actor_to_delete = Actor.find(id_to_remove)
    actor_to_delete.destroy
    

    redirect_to("/actors", :notice => "Actor deleted successfully.")
  end
end
