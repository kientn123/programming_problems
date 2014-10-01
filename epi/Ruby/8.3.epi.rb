=begin
reverse a single sublist
=end

class Node
  attr_accessor(:data, :next)
  def initialize(data, node)
    @data = data; @next = node
  end

  def to_s
    @data.to_s
  end

  def list
    res = ""
    runner = self
    until runner.next.nil?
      runner = runner.next
      res << runner.to_s + " "
    end
    return res.strip
  end
end
