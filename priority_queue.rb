class PriorityQueue
  def initialize
    @n = 0
    @heap = []
  end
  
  def maxHeapify x
    l = 2*x
    r = 2*x+1
    if l <= @n && @heap[l] > @heap[x]
      largest = l
    else
      largest = x
    end
    if r <= @n && @heap[r] > @heap[largest]
      largest = r
    end
    if largest != x
      @heap[x], @heap[largest] = @heap[largest], @heap[x]
      maxHeapify(largest)
    end
  end
   
  def extract
    key = @heap[1]
    @heap[1] = @heap[@n]
    @n -= 1
    maxHeapify(1)
    key
  end
   
  def insert key
    @n += 1
    @heap[@n] = key
    i = @n
    while i > 1 && @heap[i/2] < @heap[i]
      @heap[i], @heap[i/2] = @heap[i/2], @heap[i]
      i /= 2
    end
  end
end
