class LinkedListCycle
=begin
  A linked list is said to contain a cycle if any node is visited more than once
  while traversing the list.

  Complete the function provided in the editor below. It has one parameter: a
  pointer to a Node object named that points to the head of a linked list. Your
  function must return a boolean denoting whether or not there is a cycle in the
  list. If there is a cycle, return true; otherwise, return false.

  Note: If the list is empty,  will be null.

  Input Format

  Our hidden code checker passes the appropriate argument to your function. You
  are not responsible for reading any input from stdin.

  Constraints

  0 <= list size <= 100

  Output Format

  If the list contains a cycle, your function must return true. If the list does
  not contain a cycle, it must return false. The binary integer corresponding
  to the boolean value returned by your function is printed to stdout by our
  hidden code checker.
=end

  # Time  O(n), n = size of list
  # Space O(n), n = size of list
  def self.cycle_1?(head)
    memo = Hash.new # It could be an Array or a Hash

    # Traverse de list and record the nodes visited
    current = head
    while current != nil
      if memo[current.data]
        return 1
      else
        memo[current.data] = true
      end
      current = current.next
    end
    0
  end

  # Tortoise and hare algorthm for infinite linked list
  # Time  O(n)
  # Space O(1)
  def self.cycle_2?(head)
    slow = head
    fast = head.nex
    while slow != fast
      return 0 if fast == nil || fast.next == nil
      slow = slow.next
      fast = fast.next.next
    end
    return 1
  end

  # Taking in account the constraint
  # Time  O(1), because of the constraint <= 100
  # Space O(1)
  def selc.cycle_3?(head)
    i = 1
    current = head
    while i <= 100
      current = current.next
      return 0 if current == nil
      i += 1
    end
    1
  end
end
