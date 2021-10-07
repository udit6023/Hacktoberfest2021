def factorial_recursive(n):
    if n == 0 or n == 1:
        return n
    else:
        return n * factorial_recursive(n-1)
    
def factorial_non_recursive(n):
    fact = 1
    for i in range(1, n+1):
        fact *= i
    return fact

n = int(input("Enter The Value of Number :- "))
print("The value of facorial using reccursion is : " + str(factorial_recursive(n)))
print("The value of facorial without using reccursion is : " + str(factorial_non_recursive(n)))
