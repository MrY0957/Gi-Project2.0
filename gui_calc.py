import customtkinter as ctk

# থিম এবং কালার সেটআপ
ctk.set_appearance_mode("dark")  # Modes: "System", "Dark", "Light"
ctk.set_default_color_theme("blue")  # Themes: "blue", "green", "dark-blue"

def calculate():
    try:
        num1 = float(entry1.get())
        num2 = float(entry2.get())
        op = operator.get()
        
        if op == '+': result = num1 + num2
        elif op == '-': result = num1 - num2
        elif op == '*': result = num1 * num2
        elif op == '/': 
            result = num1 / num2 if num2 != 0 else "Error (Div by 0)"
        else:
            result = "Invalid Operator"
            
        label_result.configure(text=f"Result: {result}", text_color="#2ECC71") # সফল হলে সবুজ রঙ
    except ValueError:
        label_result.configure(text="Please try again!", text_color="#E74C3C") # ভুল হলে লাল রঙ

# মূল উইন্ডো তৈরি
root = ctk.CTk()
root.title("Modern Calc")
root.geometry("350x400")
root.resizable(False, False)

# হেডিং লেবেল
title_label = ctk.CTkLabel(root, text="Simple Calculator", font=("Arial", 20, "bold"))
title_label.pack(pady=20)

# প্রথম ইনপুট বক্স
entry1 = ctk.CTkEntry(root, placeholder_text="Enter 1st number", width=220, height=40, corner_radius=8)
entry1.pack(pady=10)

# অপারেটর ইনপুট বক্স
operator = ctk.CTkEntry(root, placeholder_text="Operator (+, -, *, /)", width=220, height=40, corner_radius=8, justify="center")
operator.pack(pady=10)

# দ্বিতীয় ইনপুট বক্স
entry2 = ctk.CTkEntry(root, placeholder_text="Enter 2nd number", width=220, height=40, corner_radius=8)
entry2.pack(pady=10)

# মডার্ন সাবমিট বাটন (হোভার ইফেক্টসহ)
btn = ctk.CTkButton(root, text="Submit", command=calculate, width=220, height=45, corner_radius=8, font=("Arial", 14, "bold"), fg_color="#3498DB", hover_color="#2980B9")
btn.pack(pady=20)

# ফলাফল দেখানোর লেবেল
label_result = ctk.CTkLabel(root, text="Result: ", font=("Arial", 16, "bold"))
label_result.pack(pady=10)

root.mainloop()
