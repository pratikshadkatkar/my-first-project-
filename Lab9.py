# start = int(input("Enter the starting point for countdown:"))
# while start!=0:
#     print(start,end='')
#     start = start - 1
#     print()
# print("HAPPY NEW YEAR!!")




# correct_password = "Adiee"

# while True:
#     password = input("Enter your Password:")


#     if password == correct_password:
#         print("Access Granted:")
#     else:
#         print(f"{password} Wrong Password:Try Again")



total_calories = 0

while True:
    food = input("Enter food name:")

    if food.lower() == "Done":
        break

    calories = input(f"Enter calories for {food}:")
    total_calories = total_calories + int(calories)

    print("\n Daily calories report:")
    print("---------------------------")
    print("Total calories consumed:",total_calories)




