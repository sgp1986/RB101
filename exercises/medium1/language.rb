def push(stack, register) # push register value to stack
  stack << register
end

def add(stack, register) # pops value from stack and adds to register value
  register += stack.pop
end

def sub(stack, register) # pops value from stack and subtracts from register value
  register -= stack.pop
end

def mult(stack, register) # pops value from stack and multiplies by register value
  register *= stack.pop
end

def div(stack, register) # pops value from stack and divides into register value
  register /= stack.pop
end

def mod(stack, register) # pops value from stack and divides into register value, storing remainder in register
  register %= stack.pop
end

def pop(stack, register) # removes topmost item from stack and places in register
  register = stack.pop
end

def print(register) # prints register value
  p register
end

def minilang(command)
  register = 0
  stack = []
  command.split.each do |token|
    case token
    when 'PUSH'  then stack.push(register)
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then print(register)
    else              register = token.to_i
    end
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)