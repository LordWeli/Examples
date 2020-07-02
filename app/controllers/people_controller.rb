class PeopleController < ApplicationController
  before_action :set_person, only: %i[edit update]
  def index
    @people = Person.all
    
    if params[:last]
      respond_to do |format|
        #format.html
        format.json { render json: { people: @people.last }}
      end
    end
  end

  def new
    @person = Person.new
    @last_person = Person.last
  end

  def create
    @person = Person.new(person_params)
    if @person.save

    else
      render :new
    end
  end

  def edit
  end

  def update
    
    binding.pry
    
    if @person.update(person_params)
      if params[:param_save] == 'false'
        redirect_to root_path
      end
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
