
# = Clase Nutricion
# Autor:: Basilio Gómez Navarro
# == Descripcion de la clase:
# Clase que representa un alimento.
class Nutricion
  include Comparable

# La clase tiene los siguientes atributos:

# +nombre+ Es el nombre del alimento.
  attr_reader :nombre
# +gei+ Media de kilogramos de emisiones de gases de efecto invernadero por porción de dicho alimento.
  attr_reader :gei
# +terreno+ Metros cuadrados por año del uso de terreno.
  attr_reader :terreno
# +proteinas+ Porcentaje de proteínas del alimento.
  attr_reader :proteinas
# +lipidos+ Porcentaje de lípidos del alimento.
  attr_reader :lipidos
# +carbohidratos+ Porcentaje de carbohidratos del alimento.
  attr_reader :carbohidratos

  # - +nombre+ Contiene el nombre del alimento.
  # - +proteinas+ Contiene el porncentaje de proteínas del alimento.
  # - +carbohidratos+ Contiene el porcentaje de carbohidratos del alimento.
  # - +lipidos+ Contiene el porcentaje de lípidos del alimento.
  # - +gei+ Contiene la media de kilogramos de emisiones de gases de efecto
  # invernadero por porción de dicho alimento.
  # - +terreno+ Contiene los metros cuadrados por año del uso del terreno.
  def initialize (nombre, proteinas, carbohidratos, lipidos, gei, terreno)
     @nombre, @proteinas, @carbohidratos, @lipidos, @gei, @terreno = nombre, proteinas,
     carbohidratos, lipidos, gei, terreno
  end

# Método que devuelve el valor del atributo +nombre+ .
  def getNombre()
    @nombre
  end

# Método que devuelve el valor del atributo +gei+ .
  def getGei()
    @gei
  end

# Método qeu devuelve el valor del atributo +terreno+ .
  def getTerreno()
    @terreno
  end

# Método que devuelve el alimento formateado.
  def to_s()
    [@nombre, @proteinas, @carbohidratos, @lipidos, @gei, @terreno]
  end

# Método que devuelve el valor energético del alimento.
  def valorEnergetico()
   val = @carbohidratos * 4 + @lipidos * 9 + @proteinas * 4
   val.round(1)
  end

# Método para calcular el impacto ambiental de la producción de dicho alimento.
  def impactoAmbiental(persona, cantidad)
    #persona[1].getGei * cantidad[1] + persona[1].getGei * cantidad[1] + persona[2].getGei * cantidad[2] + persona[3].getGei * cantidad[3]
  end

# Definición del '<=>' para poder comparar correctamente cada alimento.
  def <=>(an0ther)
    self.valorEnergetico() <=> an0ther.valorEnergetico()
  end

end
