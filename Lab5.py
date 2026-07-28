print("***********COLLEGE ADMISSION ELIGIBILITY CHECKER***********")

Age=int(input("Enter your Age:"))
marks=float(input("Enter your marks:"))

if Age >= 18 and Age <= 25: 
  if marks >= 60:
   print("You are eligible for college Admission.")
    
   if marks >=85:
      print("You will get Admission for AIML.")

   elif marks>=75:
      print("You will get Admission for CSE.")

   elif marks >=60:
      print("You will get Admission for General course.")


   else:
    print("You have not passed age criteria for college Admission.")

  else:
       print("You have not passed marks criteria for college Admission.")



     
      
    