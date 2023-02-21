s="Hello World"
char=list(s)
i=0
print (char)
while len(char)>i:
    char[i]=char[i]*2
    i=i+1
print ("".join(char))
