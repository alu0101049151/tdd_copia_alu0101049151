# = Clase PlatoN
# Autor:: Basilio Gómez Navarro
# == Descripcion de la clase:
# Clase para representar la iformación nutricional de los platos de un menú de una dieta.
class PlatoN
  include Comparable

# Contiene como atributos principales:

# - +nombrePlato+ Es el nombre del plato.
  attr_reader :nombrePlato
# - +listaComida+  Es la lista de comida del plato.
  attr_reader :listaComida
# - +listaCantidades+ Es la cantidad de cada alimento que está en al plato.
  attr_reader :listaCantidades

  # +nombrePlato+ Contiene el nombre del plato.
  #
  # +listaComida+ Contiene la lista de alimentos que componen el plato.
  #
  # +listaCantidades+ Contiene las cantidades de cada alimento del plato.
  def initialize (nombrePlato, listaComida, listaCantidades)
    @nombrePlato, @listaComida, @listaCantidades = nombrePlato, listaComida, listaCantidades
  end


# Método que permite obtener el porcentaje total de proteínas del plato.
  def porcentajeProt
    cantidadActual = 0
    proteinaActual = 0
    porcentajeFinal = 0
    resultado = 0
    nodoComida = @listaComida.head
    nodoCantidad = @listaCantidades.head

    while (nodoComida != nil && nodoCantidad != nil)
          proteinaActual = nodoComida.value.proteinas
          cantidadActual = nodoCantidad.value
          resultado = proteinaActual * cantidadActual / 100

          porcentajeFinal += resultado

          nodoComida = nodoComida.next
          nodoCantidad = nodoCantidad.next

    end
    porcentajeFinal = porcentajeFinal * 0.1
    return porcentajeFinal.round(2)
  end

# Método que permite calcular el porcentaje total de carbohidratos de un plato.
  def porcentajeCarbo
    cantidadActual = 0
    carbohidratoActual = 0
    porcentajeFinal = 0
    resultado = 0
    nodoComida = @listaComida.head
    nodoCantidad = @listaCantidades.head

    while (nodoComida != nil && nodoCantidad != nil)
          carbohidratoActual = nodoComida.value.carbohidratos
          cantidadActual = nodoCantidad.value
          resultado = carbohidratoActual * cantidadActual / 100

          porcentajeFinal += resultado

          nodoComida = nodoComida.next
          nodoCantidad = nodoCantidad.next

    end
    porcentajeFinal = porcentajeFinal * 0.1
    return porcentajeFinal.round(2)
  end

# Método que permite calcular el porcentaje total de lípidos de un plato.
  def porcentajeLipido
    cantidadActual = 0
    lipidoActual = 0
    porcentajeFinal = 0
    resultado = 0
    nodoComida = @listaComida.head
    nodoCantidad = @listaCantidades.head

    while (nodoComida != nil && nodoCantidad != nil)
          lipidoActual = nodoComida.value.lipidos
          cantidadActual = nodoCantidad.value
          resultado = lipidoActual * cantidadActual / 100

          porcentajeFinal += resultado

          nodoComida = nodoComida.next
          nodoCantidad = nodoCantidad.next

    end
    porcentajeFinal = porcentajeFinal * 0.1
    return porcentajeFinal.round(2)
  end

# Método que devuelve el valor calórico total del plato.
  def valCalTotal
    total = 0
    nodoAux = @listaComida.head

    while (nodoAux != nil)
      total += nodoAux.value.valorEnergetico()
      nodoAux = nodoAux.next
    end
    return total.round(1)
  end

# Método que permite obtener el plato formateado.
  def to_s
    nodoAux =  @listaComida.head
    resultado = []

    while (nodoAux != nil)
      resultado.push(nodoAux.value.nombre)
      nodoAux = nodoAux.next
    end
    "#{resultado}"
  end

# Implementación del método <=> para podere utilizar apropiadamente el modulo "comparable".
# para la clase PlatoN.
  def <=>(an0ther)
    self.valCalTotal <=> an0ther.valCalTotal
  end
end

# = Clase PlatoA
# Autor:: Basilio Gómez Navarro
# == Descripcion de la clase:
# Clase heredada de la clase PlatoN. Pretende contemplar también la eficiencia energética en la
# producción de los alimentos de los platos de un menú de una dieta.
# Al ser una clase hija de la clase PlatoN, hereda los atributos de esta última.
class PlatoA < PlatoN
  include Comparable

  def initialize (nombrePlato, listaComida, listaCantidades)
    super(nombrePlato, listaComida, listaCantidades)
  end

# Método para calcular el valor total del Gases de Efecto Invernadero emitidos para la producción
# de los alimentos que componen el plato.
  def totalGei
    total = 0
    nodoAux = @listaComida.head

    while (nodoAux != nil)
      total += nodoAux.value.gei
      nodoAux = nodoAux.next
    end
    return total.round(1)
  end

# Método para calcular el valor total del Terreno utilizado para la producción de los alimentos
# que componen el plato.
  def totalTerreno
    total = 0
    nodoAux = @listaComida.head

    while (nodoAux != nil)
      total += nodoAux.value.terreno
      nodoAux = nodoAux.next
    end
    return total.round(1)
  end

# Método para calcular la eficiencia energética total del plato.
  def eficiencia
    terrenoActual = 0
    geiActual = 0
    total = 0
    nodoAux = @listaComida.head

    while (nodoAux != nil)
      terrenoActual = nodoAux.value.terreno
      geiActual = nodoAux.value.gei
      total += terrenoActual * geiActual / 100
      nodoAux = nodoAux.next
    end
    return total.round(1)
  end

# Método que devuelve el valor de la eficiencia energética del plato formateado.
  def to_s
    aux = 0
    aux = self.eficiencia()
    "Eficiencia energética: #{aux}"
  end

# Reescritura del método '<=>' para que compare los objetos de PlatoA en base a su
# eficiencia energética.
  def <=>(an0ther)
    self.huellaNutricional() <=> an0ther.huellaNutricional()
  end

# Método para calcular el indicador de energía total de todos los alimentos del plato.
  def calculoEnergia
    total = 0.0
    nodoAux = @listaComida.head
    nodoAux2 = @listaCantidades.head

    while (nodoAux != nil) && (nodoAux2 != nil)
      total += nodoAux.value.valorEnergetico() * nodoAux2.value
      nodoAux = nodoAux.next
      nodoAux2 = nodoAux2.next
    end
    return total.round(1)
  end

# Método para calcular el indicador de la huella de carbono total de todos los alimentos del plato.
  def calculoCarbono
    total = 0.0
    nodoAux = @listaComida.head
    nodoAux2 = @listaCantidades.head

    while (nodoAux != nil) && (nodoAux2 != nil)
      total += nodoAux.value.gei * nodoAux2.value
      nodoAux = nodoAux.next
      nodoAux2 = nodoAux2.next
    end
    return total.round(1)
  end

# Método que devuelve el índice de impacto del indicador de la energía del plato.
  def indiceEnergia
    iEnergia = 0

    if self.calculoEnergia < 670
      iEnergia =  1
    elsif self.calculoEnergia > 830
      iEnergia = 3
    else
      iEnergia = 2
    end

    return iEnergia
  end

# Método que devuelve el índice de impacto del indicador de la huella de carbono del plato.
  def indiceCarbono
    iCarbono = 0

    if self.calculoCarbono < 800
      iCarbono = 1
    elsif self.calculoCarbono > 1200
      iCarbono = 3
    else
      iCarbono = 2
    end

    return iCarbono
  end

# Método que calcula el valor final de la huella nutricional de un objeto de la clase PlatoA.
  def huellaNutricional
    resultadoHN = (self.indiceEnergia + self.indiceCarbono) / 2
    return resultadoHN.round(1)
  end
end
