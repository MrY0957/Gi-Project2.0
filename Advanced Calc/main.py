# add, subtract, multiply, divide 
def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y == 0:
        return "Wrong! Not divided by zero."
    return x / y

# প্রধান লুপ যা ক্যালকুলেটরটিকে চালু রাখবে
while True:
    print("\n--- python Simple Calc ---")
    print("1. Add (+)")
    print("2. Sub (-)")
    print("3. Mul(*)")
    print("4. Div(/)")
    print("5. Close (Exit)")
    
    # ইউজারের কাছ থেকে চয়েস নেওয়া
    choice = input("Select your choice- 1/2/3/4/5: ")
    
    if choice == '5':
        print("Calculator is closed. Thanks!")
        break
        
    # চয়েসটি সঠিক কিনা তা চেক করা
    if choice in ('1', '2', '3', '4'):
        try:
            num1 = float(input("Enter 1st number: "))
            num2 = float(input("Enter 2nd number: "))
        except ValueError:
            print("Wrong input! Try again.")
            continue
            
        if choice == '1':
            print(f"Addition:  {num1} + {num2} = {add(num1, num2)}")
        elif choice == '2':
            print(f"Subtraction: {num1} - {num2} = {subtract(num1, num2)}")
        elif choice == '3':
            print(f"Multiplication: {num1} * {num2} = {multiply(num1, num2)}")
        elif choice == '4':
            print(f"Divition: {num1} / {num2} = {divide(num1, num2)}")
    else:
        print("Wrong selection!Select option 1 to 5 range.")
