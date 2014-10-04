=begin
 Write code to remove duplicates from an unsorted linked list
 Temporary buffer is not allowed
=end

# Model of a linked-list using hashes
head = { next: {
    data: 5, next: {
      data: 7, next: {
        data: 7, next: {
          data: 8
        }
      }
    }
  }
}

class LinkedList
  def self.run(head)
    previous = head
    current = previous[:next]
    puts previous
    puts current
    puts "===="
    while !current.nil? do
      runner = head
      while runner != current do
        if runner[:data] == current[:data]
          current = current[:next]
          previous[:next] = current
          break
        end
        runner = runner[:next]
      end
      if runner == current
        previous = current
        current = current[:next]
        puts previous
        puts current
        puts "===="
      end
    end
  end
end

#previous = head
#previous[:next] = previous[:next][:next]
#current = previous[:next]
#previous = current
LinkedList.run(head)
#puts previous
puts head
