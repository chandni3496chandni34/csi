def solve(s):
    r=list(s.split(" "))
    m=""
    for i in range(0,len(r)):       
        m=m+r[i].capitalize()+" " 
    return m
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = solve(s)

    fptr.write(result + '\n')

    fptr.close()
