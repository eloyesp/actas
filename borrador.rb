class Borrador

  def initialize attributes
    @fecha = attributes['fecha']
    @institucion = attributes['institución']
    @autor = attributes['firma']
    @miembros = attributes['miembros'].gsub(/\s/, '').split(/,;/) << @autor
    @cuerpo = attributes['cuerpo']
  end

end
