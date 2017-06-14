# Use a stack to save the parenthesis and match them

def validBraces(str)
   stack = []
   
   # Split string and iterate over all the braces
   str.split("").each do |item|
       case item
       when ")"
           return false if stack.pop != "(" # We use stack.pop to pop the item and at the same time to compare it
       when "}"
           return false if stack.pop != "{"
       when "]"
           return false if stack.pop != "["
       else
           stack.push(item) # Here there must be a brace like = (, {, [
       end
   end
   
   return true if stack.empty?
end
