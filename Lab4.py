print("**********Grocery Store Billing System**********") 
rice_qty = float(input("Enter the quantity of rice (in kg):"))
rice_price_per_kg = 50
rice_total = rice_qty * rice_price_per_kg


sugar_qty = float(input("Enter the quantity of sugar (in kg):"))
sugar_price_per_kg = 40
sugar_total = sugar_qty * sugar_price_per_kg


oil_qty = float(input("Enter the quantity of oil (in litres):"))
oil_price_per_litre = 120
oil_total = oil_qty * oil_price_per_litre


print("**********Bill Details**********")
print("Rice: ", rice_total)
print("Sugar: ", sugar_total)
print("Oil: ", oil_total)


Total_Bill = rice_total + sugar_total + oil_total
print("Total Bill:", Total_Bill)

Discount = 0               
if Total_Bill >= 1000:
    Discount = Total_Bill * 0.1
    print("Discount: ", Discount)
elif Total_Bill >= 500:
    Discount = Total_Bill * 0.05
    print("Discount: ", Discount)    
else:
    print("no discount")

Final_Bill = Total_Bill - Discount
print("Final Bill:", Final_Bill)





