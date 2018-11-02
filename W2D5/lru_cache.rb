class LRUCache
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    @store.count
  end

  def add(el)
    @store.delete(el) if @store.include?(el)
    @store.shift if self.count >= size
    @store.push(el)
  end

  def show
    @store.dup
  end

  private
  attr_reader :size

end
