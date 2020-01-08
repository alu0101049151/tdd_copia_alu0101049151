require 'spec_helper'

RSpec.describe Nutricion do
              before (:all) do
                @carne_vaca = Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
                @carne_cordero = Nutricion.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
                @camarones = Nutricion.new("Camarones (piscifactoría)", 17.6, 1.5, 0.6, 18.0, 2.0)
                @chocolate = Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4)
                @salmon = Nutricion.new("Salmon (piscifactoría)", 19.9, 0.0, 13.6, 6.0, 3.7)
                @cerdo = Nutricion.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
                @pollo = Nutricion.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
                @queso = Nutricion.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
                @cerveza = Nutricion.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
                @leche_vaca = Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
                @huevos = Nutricion.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
                @cafe = Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
                @tofu = Nutricion.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
                @lentejas = Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
                @nuez = Nutricion.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

                @menu = Nutricion.new("Menu", 0, 0, 0, 0, 0)
                @hombre = [@salmon, @chocolate, @nuez, @lenteja]
                @cuanto_hombre = [1, 2, 3, 1]
                @mujer = [@chocolate, @lenteja, @queso, @nuez]
                @cuanto_mujer = [2, 1, 1, 1]
              end


  it "Debe existir un nombre para el alimento." do
    expect(@carne_vaca.nombre).to eq("Carne de vaca")
    expect(@carne_cordero.nombre).to eq("Carne de Cordero")
    expect(@huevos.nombre).to eq("Huevos")
    expect(@tofu.nombre).to eq("Tofu")
  end

  it "Debe existi un valor para el GEI del alimento." do
    expect(@carne_vaca.gei).to eq(50.0)
    expect(@carne_cordero.gei).to eq(20.0)
    expect(@huevos.gei).to eq(4.2)
    expect(@tofu.gei).to eq(2.0)
  end

  it "Debe existir un valor para el terreno utilizado." do
    expect(@carne_vaca.terreno).to eq(164.0)
    expect(@carne_cordero.terreno).to eq(185.0)
    expect(@huevos.terreno).to eq(5.7)
    expect(@tofu.terreno).to eq(2.2)
  end

  it "Existe un método para obtener el nombre del alimento." do
    expect(@carne_vaca.getNombre).to eq("Carne de vaca")
    expect(@carne_cordero.getNombre).to eq("Carne de Cordero")
    expect(@huevos.getNombre).to eq("Huevos")
    expect(@tofu.getNombre).to eq("Tofu")
  end

  it "Existe un método para obtener el GEI del alimento." do
    expect(@carne_vaca.getGei).to eq(50.0)
    expect(@carne_cordero.getGei).to eq(20.0)
    expect(@huevos.getGei).to eq(4.2)
    expect(@tofu.getGei).to eq(2.0)
  end

  it "Existe un método para obtener el Terreno del alimento." do
    expect(@carne_vaca.getTerreno).to eq(164.0)
    expect(@carne_cordero.getTerreno).to eq(185.0)
    expect(@huevos.getTerreno).to eq(5.7)
    expect(@tofu.getTerreno).to eq(2.2)
  end

  it "Existe un método para obtener el alimento formateado." do
    expect(@carne_vaca.to_s).to eq(["Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0])
    expect(@carne_cordero.to_s).to eq(["Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0])
    expect(@huevos.to_s).to eq(["Huevos", 13.0, 1.1, 11.0, 4.2, 5.7])
    expect(@tofu.to_s).to eq(["Tofu", 8.0, 1.9, 4.8, 2.0, 2.2])
  end

  it "Existe un método para obtener el valor energético de cada alimento." do
    expect(@carne_vaca.valorEnergetico).to eq(112.3)
    expect(@carne_cordero.valorEnergetico).to eq(225)
    expect(@huevos.valorEnergetico).to eq(155.4)
    expect(@tofu.valorEnergetico).to eq(82.8)
  end

  it "Las instancias de los alimentos son comparables." do
    expect(@carne_vaca > @cafe).to eq(true)
    expect(@carne_vaca < @cafe).to eq(false)
    expect(@carne_vaca == @cafe).to eq(false)
    expect(@carne_vaca <= @cafe).to eq(false)
    expect(@carne_vaca >= @cafe).to eq(true)
    expect(@carne_vaca.valorEnergetico.between?(100, 120)).to eq(true)
  end

end


RSpec.describe Lista do
 before :all do

    @nodoprox = Node.new(2)
    @nodoprev = Node.new(3)
    @nodo = Node.new(1, @nodoprox, @nodoprev)

    @head = Node.new(0)
    @tail = Node.new(0)
    @listaPrueba = Lista.new(@head, @tail)

    @Espanola = Lista.new(nil, nil)
    @Vasca = Lista.new(nil, nil)
    @Vegetariana = Lista.new(nil, nil)
    @Vegetaliana = Lista.new(nil, nil)
    @LocuraCarne = Lista.new(nil, nil)
 end

  context "Elementos de un nodo" do
    it "Existe un Nodo de la lisa con sus datos, su siguiente y su previo." do
      expect(@nodo.value).to eq(1)
      expect(@nodo.next).to be(@nodoprox)
      expect(@nodo.prev).to be(@nodoprev)
    end
  end

  context "Atributos de la clase" do

    it "Debe existir una lista con su cabeza." do
      expect(@listaPrueba.head).to be(@head)
      expect(@listaPrueba.tail).to be(@tail)
    end

    it "Se puede insertar un elemento en la lista." do
      @listaPrueba.insertTail(2)
      expect(@listaPrueba.tail.value).to eq(2)  # Expectativa para la inserción por la cola
      @listaPrueba.insertHead(3)
      expect(@listaPrueba.head.value).to eq(3)  # Expectativa para la inserción por la cabeza
    end

    it "Se extrae el ultimo elemento de la lista." do
      expect(@listaPrueba.extractTail.value).to eq(2) # Expectativa para la extracción por la cola
    end

    it "Se extrae el primer elemento de la lista." do
      expect(@listaPrueba.extractHead.value).to eq(3) # Expectativa para la extracción por la cabeza
    end

    it "Se pueden insertar varios elementos en la lista." do
      @listaPrueba.insertSome([1,2,3])
      expect(@listaPrueba.head.value).to eq(3)
      expect(@listaPrueba.head.next.value).to eq(2)
      expect(@listaPrueba.tail.value).to eq(0)
    end

    it "La lista ha de ser enumerable." do
      @listaPrueba.insertHead(4)
      expect(@listaPrueba.max).to eq(4)
      expect(@listaPrueba.min).to eq(0)
      expect(@listaPrueba.sort).to eq([0, 1, 2, 3, 4])
      expect(@listaPrueba.collect{|i| i}).to eq([4, 3, 2, 1, 0])
      expect(@listaPrueba.select{|i| i}).to eq([4, 3, 2, 1, 0])
    end

  end

  context "Método de la dieta." do
    it "Dieta española." do
      @Espanola.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
      @Espanola.insertHead(Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
      @Espanola.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      @Espanola.insertHead(Nutricion.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0))


      expect(@Espanola.dailyGei).to eq(16.9)
      expect(@Espanola.annualGei).to eq(6168.5)
      expect(@Espanola.groundDiet).to eq(53.6)
    end

    it "Dieta Vasca." do
      @Vasca.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
      @Vasca.insertHead(Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
      @Vasca.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      @Vasca.insertHead(Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))

      expect(@Vasca.dailyGei).to eq(6.3)
      expect(@Vasca.annualGei).to eq(2299.5)
      expect(@Vasca.groundDiet).to eq(16)
    end

    it "Dieta vegetariana." do
      @Vegetariana.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
      @Vegetariana.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      @Vegetariana.insertHead(Nutricion.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7))

      expect(@Vegetariana.dailyGei).to eq(9.7)
      expect(@Vegetariana.annualGei).to eq(3540.5)
      expect(@Vegetariana.groundDiet).to eq(18)
    end

    it "Dieta vegetaliana." do
      @Vegetaliana.insertHead(Nutricion.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
      @Vegetaliana.insertHead(Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
      @Vegetaliana.insertHead(Nutricion.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))

      expect(@Vegetaliana.dailyGei).to eq(2.7)
      expect(@Vegetaliana.annualGei).to eq(985.5)
      expect(@Vegetaliana.groundDiet).to eq(13.5)
    end

    it "Dieta Gusto por la carne." do
      @LocuraCarne.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
      @LocuraCarne.insertHead(Nutricion.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
      @LocuraCarne.insertHead(Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0))
      @LocuraCarne.insertHead(Nutricion.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))

      expect(@LocuraCarne.dailyGei).to eq(60.1)
      expect(@LocuraCarne.annualGei).to eq(21936.5)
      expect(@LocuraCarne.groundDiet).to eq(178.6)
    end
  end
end

RSpec.describe PlatoN do

  before :all do
    @listaPlato = Lista.new(nil, nil)
    @listaPlato.insertHead(Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0))
    @listaPlato.insertHead(Nutricion.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
    @cantidades = Lista.new(nil, nil)
    @cantidades.insertHead(200)
    @cantidades.insertHead(100)
    @platoN = PlatoN.new("platoN", @listaPlato, @cantidades)
    @listaPlato2 = Lista.new(nil, nil)
    @listaPlato2.insertHead(Nutricion.new("Camarones (piscifactoría)", 17.6, 1.5, 0.6, 18.0, 2.0))
    @listaPlato2.insertHead( Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @cantidades2 = Lista.new(nil, nil)
    @cantidades2.insertHead(300)
    @cantidades2.insertHead(400)
    @platoN2 = PlatoN.new("platoN2", @listaPlato2, @cantidades2)
  end

  context "Atributos de la clase." do

    it "Nombre del plato." do
      expect(@platoN.nombrePlato).to eq("platoN")
    end

    it "Alimentos del plato." do
      expect(@platoN.listaComida).to be(@listaPlato)
    end

    it "Cantidades del plato." do
      expect(@platoN.listaCantidades).to be(@cantidades)
    end
  end

  context "Métodos de la clase PlatoN." do
    it "Porcentaje de proteínas del conjunto de alimentos." do
      expect(@platoN.porcentajeProt).to eq(6.22)
    end

    it "Porcentaje de carbohidratos del conjunto de alimentos." do
      expect(@platoN.porcentajeCarbo).to eq(2.1)
    end

    it "Porcentaje de lípidos del conjunto de alimentos." do
      expect(@platoN.porcentajeLipido).to eq(6.02)
    end

    it "Valor Calórico Total del conjunto de alimentos." do
      expect(@platoN.valCalTotal).to eq(762.3)
    end

    it "Se obtiene el plato formateado." do
      expect(@platoN.to_s).to eq("[\"Nuez\", \"Carne de vaca\"]")
    end

    it "Se pueden comparar dos platos de la clase PlatoN." do
      expect(@platoN < @platoN2).to eq(false)
      expect(@platoN > @platoN2).to eq(true)
      expect(@platoN <= @platoN2).to eq(false)
      expect(@platoN >= @platoN2).to eq(true)
      expect(@platoN == @platoN2).to eq(false)
      expect(@platoN.valCalTotal.between?(700, 800)).to eq(true)
    end
  end
end

RSpec.describe PlatoA do

  before :each do
    @listaPlato = Lista.new(nil, nil)
    @listaPlato.insertHead(Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0))
    @listaPlato.insertHead(Nutricion.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
    @cantidades = Lista.new(nil, nil)
    @cantidades.insertHead(2)
    @cantidades.insertHead(5)
    @platoA = PlatoA.new("platoA", @listaPlato, @cantidades)
    @listaPlato2 = Lista.new(nil, nil)
    @listaPlato2.insertHead(Nutricion.new("Camarones (piscifactoría)", 17.6, 1.5, 0.6, 18.0, 2.0))
    @listaPlato2.insertHead( Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @cantidades2 = Lista.new(nil, nil)
    @cantidades2.insertHead(5)
    @cantidades2.insertHead(4)
    @platoA2 = PlatoA.new("platoA2", @listaPlato2, @cantidades2)

    #ESPAÑOLA:
    @Espanola1 = Lista.new(nil, nil)
    @Espanola1.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @Espanola1.insertHead(Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
    @cantidadesE1 = Lista.new(nil, nil)
    @cantidadesE1.insertHead(2)
    @cantidadesE1.insertHead(3)
    @platoEspanola1 = PlatoA.new("PlatoE1", @Espanola1, @cantidadesE1)

    @Espanola2 = Lista.new(nil, nil)
    @Espanola2.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
    @Espanola2.insertHead(Nutricion.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0))
    @cantidadesE2 = Lista.new(nil, nil)
    @cantidadesE2.insertHead(3)
    @cantidadesE2.insertHead(4)
    @platoEspanola2 = PlatoA.new("PlatoE2", @Espanola2, @cantidadesE2)

    @dietaEspanola = Lista.new(nil, nil)
    @dietaEspanola.insertHead(@platoEspanola1)
    @dietaEspanola.insertHead(@platoEspanola2)

    #VASCA
    @Vasca1 = Lista.new(nil, nil)
    @Vasca1.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @Vasca1.insertHead(Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
    @cantidadesV1 = Lista.new(nil, nil)
    @cantidadesV1.insertHead(2)
    @cantidadesV1.insertHead(3)
    @platoVasca1 = PlatoA.new("PlatoV1", @Vasca1, @cantidadesV1)

    @Vasca2 = Lista.new(nil, nil)
    @Vasca2.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
    @Vasca2.insertHead(Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
    @cantidadesV2 = Lista.new(nil, nil)
    @cantidadesV2.insertHead(3)
    @cantidadesV2.insertHead(4)
    @platoVasca2 = PlatoA.new("PlatoV2", @Vasca2, @cantidadesV2)

    @dietaVasca = Lista.new(nil, nil)
    @dietaVasca.insertHead(@platoVasca1)
    @dietaVasca.insertHead(@platoVasca2)

    #VEGETARIANA
    @Vegetariana1 = Lista.new(nil, nil)
    @Vegetariana1.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @Vegetariana1.insertHead(Nutricion.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7))
    @cantidadesVE1 = Lista.new(nil, nil)
    @cantidadesVE1.insertHead(2)
    @cantidadesVE1.insertHead(3)
    @platoVegetariana1 = PlatoA.new("PlatoVE1", @Vegetariana1, @cantidadesVE1)

    @Vegetariana2 = Lista.new(nil, nil)
    @Vegetariana2.insertHead(Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
    @Vegetariana2.insertHead(Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
    @cantidadesVE2 = Lista.new(nil, nil)
    @cantidadesVE2.insertHead(5)
    @cantidadesVE2.insertHead(4)
    @platoVegetariana2 = PlatoA.new("PlatoVE2", @Vegetariana2, @cantidadesVE2)

    @dietaVegetariana = Lista.new(nil, nil)
    @dietaVegetariana.insertHead(@platoVegetariana1)
    @dietaVegetariana.insertHead(@platoVegetariana2)

    #VEGETALIANA
    @Vegetaliana1 = Lista.new(nil, nil)
    @Vegetaliana1.insertHead(Nutricion.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
    @Vegetaliana1.insertHead(Nutricion.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
    @cantidadesVE1 = Lista.new(nil, nil)
    @cantidadesVE1.insertHead(2)
    @cantidadesVE1.insertHead(1)
    @platoVegetaliana1 = PlatoA.new("PlatoVEL1", @Vegetaliana1, @cantidadesVE1)

    @Vegetaliana2 = Lista.new(nil, nil)
    @Vegetaliana2.insertHead(Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
    @Vegetaliana2.insertHead(Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
    @cantidadesVE2 = Lista.new(nil, nil)
    @cantidadesVE2.insertHead(5)
    @cantidadesVE2.insertHead(2)
    @platoVegetaliana2 = PlatoA.new("PlatoVEL2", @Vegetaliana2, @cantidadesVE2)

    @dietaVegetaliana = Lista.new(nil, nil)
    @dietaVegetaliana.insertHead(@platoVegetaliana1)
    @dietaVegetaliana.insertHead(@platoVegetaliana2)

    #LOCURA POR LA CARNE
    @LocuraCarne1 = Lista.new(nil, nil)
    @LocuraCarne1.insertHead(Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4))
    @LocuraCarne1.insertHead(Nutricion.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
    @cantidadesCA1 = Lista.new(nil, nil)
    @cantidadesCA1.insertHead(6)
    @cantidadesCA1.insertHead(9)
    @platoLocuraCarne1 = PlatoA.new("PlatoCAR1", @LocuraCarne1, @cantidadesCA1)

    @LocuraCarne2 = Lista.new(nil, nil)
    @LocuraCarne2.insertHead(Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0))
    @LocuraCarne2.insertHead(Nutricion.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
    @cantidadesCA2 = Lista.new(nil, nil)
    @cantidadesCA2.insertHead(8)
    @cantidadesCA2.insertHead(6)
    @platoLocuraCarne2 = PlatoA.new("PlatoCAR2", @LocuraCarne2, @cantidadesCA2)

    @dietaLocuraCarne = Lista.new(nil, nil)
    @dietaLocuraCarne.insertHead(@platoLocuraCarne1)
    @dietaLocuraCarne.insertHead(@platoLocuraCarne2)

    #==================================================
    #               MENÚ DIETÉTICO
    #==================================================
    @arrayPlatos = [@platoEspanola1, @platoVasca2, @platoVegetariana1, @platoVegetaliana2, @platoLocuraCarne1]
    @arrayPrecios = [25.0, 30.5, 20.4, 50.1, 70.0]

    #==================================================
    #         FUNCIONES DE ORDEN SUPERIOR
    #==================================================

    # Función para calcular el plato con máximo huellaNutricional
    def fos_max_huella_nutricional(platos)
      valorMaximo = platos.max
      return valorMaximo
    end

    # Función que multiplica cada precio del array de precios por el valor de la
    # de la mayor huella nutricional de la lista de alimentos.
    def fos_factorizacion_precio(precios)
      platoMaximo = fos_max_huella_nutricional(@arrayPlatos)
      factor = platoMaximo.huellaNutricional
      preciosFinales = precios.collect {|e| e*factor}
      return preciosFinales
    end

  end

  context "Métodos de la clase PlatoA." do
    it "Valor total de las emisiones diarias de gases de efecto invernadero." do
      expect(@platoA.totalGei).to eq(50.3)
    end

    it "Estimacion de los metros cuadrados de uso de terreno." do
      expect(@platoA.totalTerreno).to eq(171.9)
    end

    it "Eficiencia Energética." do
      expect(@platoA.eficiencia).to eq(82.0)
    end

    it "Se obtiene la eficiciencia energética formateada." do
      expect(@platoA.to_s).to eq("Eficiencia energética: 82.0")
    end

    it "Comprobación de que es una clase." do
      expect(@platoA.is_a?PlatoA).to eq(true)
      expect(@platoA.is_a?PlatoN).to eq(true)
      expect(@platoA.is_a?Object).to eq(true)
      expect(@platoA.is_a?BasicObject).to eq(true)
    end

    it "Comprobación del tipo de objeto." do
      expect(@platoA.kind_of?PlatoA).to eq(true)
      expect(@platoA.kind_of?PlatoN).to eq(true)
      expect(@platoA.kind_of?Object).to eq(true)
      expect(@platoA.kind_of?BasicObject).to eq(true)
    end

    it "Comprobación de la pertenencia a una jerarquía." do
      expect(@platoA.instance_of?PlatoA).to eq(true)
      expect(@platoA.instance_of?PlatoN).to eq(false)
      expect(@platoA.instance_of?Object).to eq(false)
      expect(@platoA.instance_of?BasicObject).to eq(false)
    end

    it "Se pueden comparar dos platos de la clase PlatoA." do
      expect(@platoA < @platoA2).to eq(false)
    end
  end

  context "Métodos para las dietas." do
    it "Comparar Dietas." do
      expect(@dietaEspanola.head.value < @dietaEspanola.head.next.value).to eq(false)
      expect(@dietaVasca.head.value > @dietaVasca.head.value).to eq(false)
      expect(@dietaVasca.head.next.value <= @dietaVegetariana.head.value).to eq(true)
      expect(@dietaEspanola.head.next.value >= @dietaVegetariana.head.value).to eq(false)
      expect(@dietaLocuraCarne.head.value == @dietaVegetaliana.head.value).to eq(false)
      expect(@dietaEspanola.head.value.between?(@platoEspanola1, @platoEspanola2)).to eq(true)
    end
  end

  it "Se pueden enumerar listas de platos." do
    expect(@dietaEspanola.max).to eq(@platoEspanola2)
    expect(@dietaEspanola.min).to eq(@platoEspanola1)
    expect(@dietaEspanola.sort).to eq([@platoEspanola1, @platoEspanola2])
    expect(@dietaEspanola.select{ |i| i}).to eq([@platoEspanola2, @platoEspanola1])
    expect(@dietaEspanola.collect{ |i| i}).to eq([@platoEspanola2, @platoEspanola1])
  end

  context "Menú dietético." do
    it "Prueba para comprobar el índice de impacto de la energía y la huella de carbono." do
      expect(@platoVegetaliana1.indiceEnergia).to eq(2)
      expect(@platoVegetaliana2.indiceCarbono).to eq(1)

      expect(@platoEspanola2.indiceEnergia).to eq(3)
      expect(@platoEspanola2.indiceCarbono).to eq(1)

      expect(@platoLocuraCarne1.indiceEnergia).to eq(3)
      expect(@platoLocuraCarne1.indiceCarbono).to eq(1)
    end

    it "Prueba para comprobar la Huella Nutricional de cada plato." do
      expect(@platoEspanola1.huellaNutricional).to eq(1)
      expect(@platoEspanola2.huellaNutricional).to eq(2)
      expect(@platoVasca1.huellaNutricional).to eq(1)
      expect(@platoVasca2.huellaNutricional).to eq(2)
      expect(@platoVegetariana1.huellaNutricional).to eq(2)
      expect(@platoVegetariana2.huellaNutricional).to eq(2)
      expect(@platoVegetaliana1.huellaNutricional).to eq(1)
      expect(@platoVegetaliana2.huellaNutricional).to eq(1)
      expect(@platoLocuraCarne1.huellaNutricional).to eq(2)
      expect(@platoLocuraCarne2.huellaNutricional).to eq(2)
    end

    it "Prueba para comprobar la máxima huella nutricional de un Menú dietético." do
      expect(fos_max_huella_nutricional(@arrayPlatos)).to eq(@platoVasca2)
    end

    it "Prueba para incrementar el precio de los platos de un menú dietético en proporcion a la HN." do
      expect(fos_factorizacion_precio(@arrayPrecios)).to eq([50.0, 61.0, 40.8, 100.2, 140.0])
    end
  end
end

RSpec.describe PlatoDSL do
  before :each do

    cafe = Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
    chocolate = Nutricion.new("Chocolate", 5.3, 4.7, 30.0, 2.3, 3.4)

    @platodsl = PlatoDSL.new("Plato Española") do
      nombre_plato  "Café con chocolate"
      alimento    :objetoAlimento => cafe, :gramos => 3
      alimento    :objetoAlimento => chocolate, :gramos => 2
    end
  end

  context "Presentación formateada del plato." do
    it "Prueba para comprobar que se imprime el PlatoDSL formateado." do
      expect(@platodsl.to_s).to eq("Plato Española\n==============\nNombre específico del plato: Café con chocolate \nAlimentos:  Café (3 g),  Chocolate (2 g)\nValor energético total del plato: 621.2\nValor huella de carbono del plato: 5.8\n\n")
      #puts @platodsl
    end
  end
end

RSpec.describe MenuDSL do
  before :each do
    carne_vaca = Nutricion.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    lentejas = Nutricion.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
    cafe = Nutricion.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
    leche_vaca = Nutricion.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)

    primerPlato = PlatoDSL.new("Primer Plato") do
      nombre_plato  "Lentejas Compuestas"
      alimento    :objetoAlimento => lentejas, :gramos => 4
      alimento    :objetoAlimento => carne_vaca, :gramos => 3
    end

    postre = PlatoDSL.new("Postre") do
      nombre_plato "Cafe con leche"
      alimento :objetoAlimento => cafe, :gramos => 0.05
      alimento :objetoAlimento => leche_vaca, :gramos => 0.50
    end

    @menudsl = MenuDSL.new("Menu del día") do
      descripcion "Lentejas con carne y café con leche"
      componente :plato => primerPlato, :precio => 6.50
      componente :plato => postre, :precio => 0.70
    end
  end

  context "Presentación formateada del menú." do
    it "Prueba para comprobar que se imprime el MenuDSL formateado." do
      #puts @menudsl
      expect(@menudsl.to_s).to eq("Menu del día\n============\nDescrición del menú: Lentejas con carne y café con leche \nPlatos:  Primer Plato: Lentejas Compuestas (6.5€),  Postre: Cafe con leche (0.7€)\nPrecio del menú: 7.2€\nValor calórico total del menú: 1625.9 Kcal\nValor de la huella de carbono del menú: 153.2 gCO2\n\n")
    end
  end
end
