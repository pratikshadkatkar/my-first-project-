# text="PRATIKSHA"

# print(text[0:3])
# print(text[3:6])
# print(text[6:9])
# print(text[1:3])
# print(text[5:8])
# print(text[-4:5])
# print(text[0-7:3])
# print(text[0-1:3])

rows = 15
cols = 30

a = cols / 2
b = rows / 2

for y in range(rows):
    for x in range(cols):
        value = ((x - a) ** 2) / (a ** 2) + ((y - b) ** 2) / (b ** 2)
        if 0.90 <= value <= 1.10:
            print("*", end="")
        else:
            print(" ", end="")
    print()