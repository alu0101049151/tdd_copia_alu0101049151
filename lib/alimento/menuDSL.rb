class MenuDSL
  include Enumerable

  attr_reader :nombreMenu, :descripcionMenu, :componentes, :precios, :energias, :emisiones

  def initialize(nombre, &block)
      @nombreMenu = nombre
      @alimentos = []
      @componentes = []
      @precios = []
      @energias =[]
      @emisiones = []

      if block_given?
          if block.arity == 1
              yield self
          else
              instance_eval(&block)
          end
      end
  end

  def to_s
      output = @nombreMenu
      output << "\n#{'=' * @nombreMenu.size}\n"
      output << "Descrición del menú: #{@descripcionMenu} \n"
      output << "Platos: #{@componentes.join(', ')}\n"
      output << "Precio del menú: #{@precios.reduce(:+)}€\n"
      output << "Valor calórico total del menú: #{@energias.reduce(:+).round(1)} Kcal\n"
      output << "Valor de la huella de carbono del menú: #{@emisiones.reduce(:+).round(1)} gCO2\n\n"
  end

  def descripcion(descripcion)
    @descripcionMenu = descripcion
  end

  def componente(options = {})
    componente = options[:plato]
    @energias << componente.calculoEnergiaDSL
    @emisiones << componente.calculoCarbonoDSL

    nombreGeneral = componente.nombre
    nombrePlato = componente.nombrePlato
    precioPlato = options[:precio]
    @precios << precioPlato

    componenteFinal = " #{nombreGeneral}:"
    componenteFinal << " #{nombrePlato}"
    componenteFinal << " (#{precioPlato}€)"

    @componentes << componenteFinal
  end

end
