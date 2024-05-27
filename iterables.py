import math

def comb(n,r):
    result = 1
    for i in range(n-r+1,n+1):
        result *= i
    result /= math.factorial(r)
    return result

N = int(input())
aCount = input().count("a")
K = int(input())
probability = 1 - comb(N-aCount,K)/comb(N,K)
print(f"{probability:.3f}")
