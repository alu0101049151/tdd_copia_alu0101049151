#require 'pry'
class PlatoDSL
  attr_accessor :nombre, :alimentos, :nombrePlato, :cantidades, :alimentosPlato

  def initialize(nombre, &block)
      @nombre = nombre
      @alimentos = []
      @alimentosPlato = Lista.new(nil, nil)
      @cantidades = Lista.new(nil, nil)

      if block_given?
          if block.arity == 1
              yield self
          else
              instance_eval(&block)
          end
      end
  end

  def to_s
      output = @nombre
      output << "\n#{'=' * @nombre.size}\n"
      output << "Nombre específico del plato: #{@nombrePlato} \n"
      output << "Alimentos: #{@alimentos.join(', ')}\n"
      output << "Valor energético total del plato: #{calculoEnergiaDSL}\n"
      output << "Valor huella de carbono del plato: #{calculoCarbonoDSL}\n\n"
  end

  def nombre_plato(nombre)
      @nombrePlato = nombre
  end

  def alimento(options = {})
      alimento = options[:objetoAlimento]  # Es el objeto nutrición que representa el alimento actua.
      nombreAlimento = alimento.nombre
      @alimentosPlato.insertHead(alimento) # Inserto el alimento en la lista de alimentos del plato.

      cantidadAlimento = options[:gramos]  # Es la cantidad en gramos del alimento que hemos insertado.
      @cantidades.insertHead(cantidadAlimento) # Inserto la lista de cantidades la cantidad en gramos leída.

      alimento = " #{nombreAlimento}"
      alimento << " (#{cantidadAlimento} g)"

      @alimentos << alimento
  end

  def calculoEnergiaDSL
    platoaux = PlatoA.new(@nombrePlato, @alimentosPlato, @cantidades)
    platoaux.calculoEnergia
  end

  def calculoCarbonoDSL
    platoaux = PlatoA.new(@nombrePlato, @alimentosPlato, @cantidades)
    platoaux.calculoCarbono
  end

#binding pry
end
