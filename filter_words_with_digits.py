c = "Snap-on Power M1302A5 Imperial,IMPRL 0.062IN"
only_a = []
for word in c.split():
    #print(word)
    if not bool(re.search('\d',word)):
        #print(word)
        only_a.append(word)
' '.join(only_a)

any([word.isdigit() for word in c.split()])
