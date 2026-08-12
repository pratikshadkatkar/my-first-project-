
print("***************MONTHLY EXPENSE TRACKER***************")

n = int(input("Enter the number of expenses:"))

expense = []
total = 0

for i in range(n):
    amount = float(input(f"Enter expense {i + 1}:"))
    expense.append(amount)
    total += amount

while True:
    print("\n-----------Expense Tracker Menu-----------")
    print("1. Show all expenses")
    print("2. Show Total expenses")
    print("3. Add new expenses")
    print("4. Exit")

    choice = int(input("Enter your choice:"))

    if choice == 1:
        print("\nExpense list:")
        for i in range(len(expense)):
            print(f"expense {1 + i} {expense[1]}")

    elif choice == 2:
        print("Total monthly expense=",total)

    elif choice == 3:
        new_expenses = float(input("Enter new expense:" ))
        expense.append(new_expenses)
        total += new_expenses
        print("Expense added succesfully.")

    elif choice == 4:
        print("Thank you for using the monthly expense tracker!")
        break

    else:
        print("Invalid choice Please try again,")


                                                     







