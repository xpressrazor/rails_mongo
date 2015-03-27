class PersonController < ApplicationController
  def new
  	person = Person.new
  end

  def create
  	@person = Person.new(person_params)

  	if @person.save
            render action:"index"
    else
        render 'new'
    end

  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      render action:"index"
    else
      render 'edit'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    render action:"index"
  end

  def index
  	@persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  private
  def person_params
  	params.require(:person).permit(:name, :hobby)
  end
end
