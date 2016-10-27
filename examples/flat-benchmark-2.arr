#lang pyret

# A flat function which doesn't have to worry about getting resumed
fun get-5() block:
  5
end

fun use-flat(n, sum):
  if n > 0:
    # Multiple flat calls in a row should get the caller optimization
    a = get-5()
    b = get-5()
    new-sum = sum + a + b
    use-flat(n - 1, new-sum)
  else:
    sum
  end
end

ntimes = num-expt(10, 5) * 3

print("Sum 1 is " + tostring(use-flat(ntimes, 0)) + "\n")
print("Sum 2 is " + tostring(use-flat(ntimes, 0)) + "\n")
print("Sum 3 is " + tostring(use-flat(ntimes, 0)) + "\n")
