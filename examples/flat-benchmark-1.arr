#lang pyret

fun get-5() block:
  "a string so I can easily find this in the compiled code"
  5
end

fun use-flat():
  ntimes = num-expt(10, 6) * 5
  for fold(sum from 0, elem from range(0, ntimes)):
    # Normally would produce >= 2 case statements, but our optimization should
    # reduce it to one
    a = get-5()
    b = get-5()
    sum + a + b
  end
end

print("Sum 1 is " + tostring(use-flat()) + "\n")
print("Sum 2 is " + tostring(use-flat()) + "\n")
print("Sum 3 is " + tostring(use-flat()) + "\n")
