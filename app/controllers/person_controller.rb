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
  end

  def edit
  end

  def destroy
  end

  def index
  	@persons = Person.all

    puts("Printing something\n===============================================")
    @persons.each do |p|
      puts("Name: #{p.name}, Hobby: #{p.hobby}")
    end

    return @persons
  end

  def show
  end

  private
  def person_params
  	params.require(:person).permit(:name, :hobby)
  end
end
