import kivy

from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.gridlayout import GridLayout
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button


class MyGrid(GridLayout):
    def __init__(self, **kwargs):
        super(MyGrid, self).__init__(**kwargs)
        self.cols = 2

        """
        self.add_widget(Label(text = "First Name"))
        self.FirstName = TextInput(multiline = False)
        self.add_widget(self.FirstName)

        self.add_widget(Label(text="Last Name"))
        self.LastName = TextInput(multiline=False)
        self.add_widget(self.LastName)
        """

        self.add_widget(Label(text = "Enter your Zip Code"))
        self.ZipCode = TextInput(multiline = False)
        self.add_widget(self.ZipCode)

        self.submit = Button(text = "SUBMIT", font_size = 40)
        self.add_widget(self.submit)

# This stuff below was just for testing. Make sure to learn CLASSES and INHERITANCES
class COVID_APP(App):
    def build(self):
        return MyGrid()

# if __name__== "__main__ ":
COVID_APP().run()


"""
# This is another way for opening up a GUI window
import tkinter as tk
from tkinter import filedialog, Text
import os

root = tk.Tk()

root.mainloop()
"""
