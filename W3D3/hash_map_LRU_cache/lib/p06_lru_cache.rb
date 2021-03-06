require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :prc

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key] != nil
      update_node!(@map[key])
      return @map[key].val
    else
      calc!(key)
      return @map[key].val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    eject! if count >= @max

    new_node = @store.append(key, prc.call(key))
    @map[key] = new_node
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    new_node = @store.append(node.key, node.val)
    @map[node.key] = new_node
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
