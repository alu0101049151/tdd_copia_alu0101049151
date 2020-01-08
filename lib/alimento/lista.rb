# = Estructura Node
# Representa un nodo de la lista
# - +value+ Es el valor del nodo en sí.
# - +next+ Es el puntero que apunta al siguiente nodo al actual.
# - +prev+ Es el puntero que apunta al nodo previo al actual.
Node = Struct.new(:value, :next, :prev)

# = Clase Lista
# Autor:: Basilio Gómez Navarro
# == Descripcion de la clase:
# Esta clase reprensenta el tipo de datos abstracto "Lista doblemente enlazada".
class Lista
  
  include Enumerable
# Contiene como atributos:

# - +head+ Es la cabeza de la lista. 
  attr_reader :head
# - +tail+ Es la cola de la lista.
  attr_reader :tail

  # +head+ Contiene la cabeza de la lista.
  #
  # +tail+ Contiene la cola de la lista.
  def initialize(head, tail)
    @head, @tail = head, tail
  end

# Método que comprueba si la lista está vacía o no.
# Devuelve 'true' en caso de estarlo y 'false' en caso contrario.
  def empty
    if (@head == nil && @tail == nil)
      return true
    else 
      return false
    end
  end

# Método que devuelve el tamaño de la lista.
  def size
    auxNodo = @head
    @i = 0
    while auxNodo.next != nil
      if auxNodo.value != nil
        @i += 1
        auxNodo = auxNodo.next
      end
    end
    puts @i
    return @i
  end


# Método para insertar el elemento +value+ por la cola.
  def insertTail(value)
    auxNodo = Node.new(value) # Nodo a insertar
    if (@tail != nil)
      @tail.next = auxNodo
      auxNodo.prev = @tail
      @tail = auxNodo
      @tail.next = nil
    else 
      @tail = auxNodo
    end
  end


# Método para insertar el elemento +value+ por la cabeza.
  def insertHead(value)
    auxNodo = Node.new(value) # Nodo a insertar
    if (@head != nil)
      @head.prev = auxNodo
      auxNodo.next = @head
      @head = auxNodo
      @head.prev = nil
    else
      @head = auxNodo
    end
  end


# Método para extraer un elemento por la cola.
  def extractTail
    if @tail != nil
      auxNodo = @tail

      @tail = tail.prev

      if (@tail == nil)
        @head = nil
      else
        @tail.next = nil
      end

      auxNodo.prev = nil
      return auxNodo
    end
  end

# Método para extraer un elemento por la cabeza.
  def extractHead
    if @head != nil
      auxNodo = @head
      
      @head = head.next
      
      if (@head == nil)
        @tail = nil
      else
        @head.prev = nil
      end

      auxNodo.prev = nil
      return auxNodo
    end
  end


# Método para insertar varios elementos.
  def insertSome (values)
    for i in values do
      insertHead(i)
    end
  end


# Método para estimar las emisiones diarias de gases de efecto invernadero para cada dieta.
  def dailyGei
    geiFinal = 0
    nodo = @head

    while(nodo != nil)
      geiFinal += nodo.value.gei
      nodo = nodo.next
    end
    return geiFinal.round(1)
  end


# Método para estimar las emisiones anuales de gases de efecto invernadero para dieta.
 def annualGei
   geiFinal = 0
   geiFinal = dailyGei
   geiFinal *= 365
   return geiFinal.round(1)
 end


# Método para calcular el uso de terreno por dieta.
 def groundDiet
  groundFinal = 0
  nodo = @head

  while(nodo != nil)
    groundFinal += nodo.value.terreno
    nodo = nodo.next
  end
  return groundFinal.round(1)
 end

#===========Práctica 8===========================

# Redefinición del método "each" del módul enumerable para la clase lista. 
  def each 
   auxNodo = @head
    while auxNodo != nil
      yield auxNodo.value
      auxNodo = auxNodo.next
    end
  end
  

end
