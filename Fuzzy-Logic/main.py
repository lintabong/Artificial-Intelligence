xInput = input('input x = ')
yInput = input('input y= ')
zInput = input('input z = ')

x = int(xInput) # pertemanan x
y = int(yInput) # karma y
z = int(zInput) # waktu z

#deklarasi variabel sebagai float (angka yang ada komanya)
x1 = float()
x2 = float()
x3 = float()
y1 = float()
y2 = float()
y3 = float()
z1 = float()
z2 = float()
z3 = float()


#proses fuzifikasi
if x >= 60:
    x1 = 1
    x2 = 0
    x3 = 0
elif 60 >= x >= 40:
    x1 = (x - 40) / (60 - 40)
    x2 = -(x - 60) / (60 - 40)
    x3 = 0
elif 40 >= x >= 20:
    x1 = 0
    x2 = 1
    x3 = 0
elif 20 >= x >= 0:
    x1 = 0
    x2 = (x - 0) / (20 - 0)
    x3 = (20 - x) / (20 - 0)
elif x <= 0:
    x1 = 0
    x2 = 0
    x3 = 1

if y >= 60:
    y1 = 1
    y2 = 0
    y3 = 0
elif 60 >= y >= 40:
    y1 = (y - 40) / (60 - 40)
    y2 = -(y - 60) / (60 - 40)
    y3 = 0
elif 40 >= y >= 20:
    y1 = 0
    y2 = 1
    y3 = 0
elif 20 >= y >= 0:
    y1 = 0
    y2 = (y - 0) / (20 - 0)
    y3 = (20 - y) / (20 - 0)
elif y <= 0:
    y1 = 0
    y2 = 0
    y3 = 1

if z >= 20:
    z1 = 1
    z2 = 0
    z3 = 0
elif 20 >= z >= 15:
    z1 = (z - 15) / (20 - 15)
    z2 = -(z - 20) / (20 - 15)
    z3 = 0
elif 15 >= z >= 10:
    z1 = 0
    z2 = 1
    z3 = 0
elif 10 >= z >= 1:
    z1 = 0
    z2 = (z - 1) / (10 - 1)
    z3 = (10 - z) / (10 - 0)
elif z <= 1:
    z1 = 0
    z2 = 0
    z3 = 1

print(x1, x2, x3)
print(y1, y2, y3)
print(z1, z2, z3)

#interference sistem
end = []
def fungsiEndSatu(varX,varY,varZ):
    if varX != 0:
        if varY !=0:
            if varZ !=0:
                output = min(varX,varY,varX)
                end.append([output,1])

def fungsiEndDua(varX,varY,varZ):
    if varX != 0:
        if varY !=0:
            if varZ !=0:
                output = min(varX,varY,varX)
                end.append([output,2])

def fungsiEndTiga(varX,varY,varZ):
    if varX != 0:
        if varY !=0:
            if varZ !=0:
                output = min(varX,varY,varX)
                end.append([output,3])

fungsiEndSatu(x1, y1,z1)
fungsiEndSatu(x1, y1,z2)
fungsiEndSatu(x1, y1,z3)
fungsiEndSatu(x1, y2,z1)
fungsiEndDua(x1, y2,z2)
fungsiEndDua(x1, y2,z3)
fungsiEndSatu(x1, y3,z1)
fungsiEndDua(x1, y3,z2)
fungsiEndTiga(x1, y3,z3) #R9

fungsiEndSatu(x2, y1,z1)
fungsiEndDua(x2, y1,z2)
fungsiEndDua(x2, y1,z3)
fungsiEndDua(x2, y2,z1)
fungsiEndDua(x2, y2,z2)
fungsiEndDua(x2, y2,z3)
fungsiEndDua(x2, y3,z1)
fungsiEndDua(x2, y3,z2)
fungsiEndTiga(x2, y3,z3) #R18

fungsiEndSatu(x3, y1,z1)
fungsiEndDua(x3, y1,z2)
fungsiEndTiga(x3, y1,z3)
fungsiEndDua(x3, y2,z1)
fungsiEndDua(x3, y2,z2)
fungsiEndTiga(x3, y2,z3)
fungsiEndTiga(x3, y3,z1)
fungsiEndTiga(x3, y3,z2)
fungsiEndTiga(x3, y3,z3) #R27

print(end)
print(len(end))

#defuzifikasi
perkalianN = 0
pembagianN = 0

for i in range (0,len(end)):
    perkalian = end[i][0]*end[i][1]
    pembagian = end[i][0]
    perkalianN = perkalianN + perkalian
    pembagianN = pembagianN + pembagian

hasil = perkalianN/pembagianN
print(hasil)
