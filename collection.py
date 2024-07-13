from collections import Counter
x = input()
sizes = list(map(int, input().split()))
sizes = Counter(sizes)
n = int((input()))

price = 0
for _ in range(n):
    customer = list(map(int, input().split()))
    if customer[0] in sizes:
        price += customer[1]
        sizes[customer[0]] -= 1
    if sizes[customer[0]] == 0:
        del sizes[customer[0]]
print(price)
