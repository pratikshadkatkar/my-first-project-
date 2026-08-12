print("==================================================")
print("          INVOICE AND RECEIPT GENERATOR           ")
print("==================================================")


print("\n ----Exercise 1: Receipt number pattern-----")
rows_pattern = int(input("Enter the number of rows for the receipt number pattern:"))

print("\n Generated pattern")


for i in range(1, rows_pattern + 1):
     for j in range(1, i + 1):
           print(i , end=' ')
           print()



print("\n" + "_" * 40)
print("----Exercise 2: Invoice frame border-----")
frame_rows = int(input("Enter frame heigth(rows):"))
frame_cols = int(input("Enter frame width(columns):"))

print("\n Generated border:")

for i in range(frame_rows):
      for j in range(frame_cols):
            if i ==0 or i ==frame_rows - 1  or j == 0 or j ==frame_cols - 1:
                  print("*", end="")
            else:
                  print(" ", end="")
                  print() 


