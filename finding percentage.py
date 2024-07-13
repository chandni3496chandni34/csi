if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name]= scores
    query_name = input()
    #print(student_marks)
    
    marks = []
    for name in student_marks:
        if(name == query_name):
            marks = student_marks[name]
    #print(marks)
    
    sm = sum(marks)
    #for x in marks:
    #    avg += x
    
    avg = (sm / len(marks))
    
    print('%0.2f' % avg)
