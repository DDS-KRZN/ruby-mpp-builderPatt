class Builder
  # @abstract
  def produce_part_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  def produce_part_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  def produce_part_c
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


class ConcreteBuilder1 < Builder
  def initialize
    reset
  end

  # Функція reset створює новий порожній об'єкт Product.
  def reset
    @product = Product1.new
  end

  # Функція product повертає побудований об'єкт Product і скидає об'єкт будівельника до початкового стану.
  def product
    product = @product
    reset
    product
  end

  def produce_part_a
    @product.add('PartA1')
  end

  def produce_part_b
    @product.add('PartB1')
  end

  def produce_part_c
    @product.add('PartC1')
  end
end


class Product1
  # Функція initialize є конструктором класу Product1. В цьому конструкторі створюється новий порожній масив @parts,
  # який буде використовуватися для зберігання частин продукту.
  # Також це значення по замовчуванню для екземплярів класу Product1.
  def initialize
    @parts = []
  end

  # @param [String] part
  # Метод add дозволяє додати нову частину в продукт.
  # Цей метод отримує рядок, який представляє нову частину, і додає його до масиву @parts.
  def add(part)
    @parts << part
  end

  # Метод list_parts виводить список всіх частин продукту, що були додані за допомогою методу add.
  # Цей метод використовує метод join для злиття всіх частин в один рядок, розділених комою.
  # Результат виводиться на екран за допомогою методу print.
  def list_parts
    print "Product parts: #{@parts.join(', ')}"
  end
end


class Director
  # @return [Builder]
  # Коли ми використовуємо attr_accessor :builder, то ми генеруємо методи builder та builder=.
  attr_accessor :builder

  # Функція initialize встановлює значення поля builder у nil,
  # тобто створює порожній об'єкт класу Director, який не має жодного зв'язку з будь-яким об'єктом будівельника.
  def initialize
    @builder = nil
  end

  def builder=(builder)
    @builder = builder
  end

  # Ця функція створює об'єкт builder та викликає методи на ньому,
  # щоб згенерувати найпростіший продукт.
  def build_minimal_viable_product
    @builder.produce_part_a
  end

  # Ця функція реалізує процес збирання продукту зі створених раніше його частин.
  def build_full_featured_product
    @builder.produce_part_a
    @builder.produce_part_b
    @builder.produce_part_c
  end
end


director = Director.new
builder = ConcreteBuilder1.new
director.builder = builder

puts 'Standard basic product: '
director.build_minimal_viable_product
builder.product.list_parts

puts "\n\n"

puts 'Standard full featured product: '
director.build_full_featured_product
builder.product.list_parts

puts "\n\n"

puts 'Custom product: '
builder.produce_part_a
builder.produce_part_b
builder.product.list_parts
# frozen_string_literal: true

