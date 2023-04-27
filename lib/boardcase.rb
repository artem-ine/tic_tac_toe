class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
	attr_accessor :id, :value

  
  def initialize(id, value = " ")
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
    @id = id 
    @value = value
  end
 
end
