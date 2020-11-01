class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  def index
    @people = Person.all
    
    if params[:last]
      respond_to do |format|
        #format.html
        format.json { render json: { people: @people.last }}
      end
    end
  end

  def show
  end

  def new
    @person = Person.new
    @last_person = Person.last
  end

  def create
    @person = Person.new(person_params)
    @person.files.attach(params[:person][:files])
    if @person.save
      redirect_to person_path(@person.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      if params[:param_save] == 'false'
        redirect_to root_path
      end
    end
  end

def destroy
  if @person.files.find(params[:format]).purge
    redirect_to person_path(@person.id)
  else
    redirect_to person_path(@person.id)
  end
end

  def set_person
    @person = Person.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
