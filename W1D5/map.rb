class MyMap

  def initialize
    @map = []
  end

  def set(key, value)
    if keys.include?(key)
      access(key)[-1] = value
    else
      map << [key, value]
    end

    self
  end

  def get(key)
    access(key).last
  end

  def []=(key, value)
    set(key, value)
  end

  def [](key)
    get(key)
  end

  def delete(key)
    map.delete(access(key))
    self
  end

  def show
    map
  end

  private
  attr_reader :map

  def keys
    map.select { |pair| pair.first }.flatten
  end

  def access(key)
    map.find { |pair| pair.first == key}
  end

end
