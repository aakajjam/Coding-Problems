# Use this link for reference https://www.geeksforgeeks.org/how-to-send-automated-email-messages-in-python/#

"""
# Import the modules
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
import smtplib
import os

# Establish a connection
smtpObj = smtplib.SMTP('smtp.gmail.com', 587)
smtpObj.ehlo() # Establish initial connection to the server
smtpObj.starttls() # TLS encryption to the server

# Login to your account
email = 'akshaymusic101@gmail.com'
app_password = 'Put app password string here' # Need to create this for security reasons
smtpObj.login(email, app_password)

# Create the multipart email content
message = MIMEMultipart() # Create the multipart message object
message.attach(MIMEText("Sending an email with python", "plain")) # Inside the attach method of the MIMEMultipart class, provide the text using MIMEText class
message['Subject'] = 'Test Email'

# Attach an image
img_file = "C:\\Users\\aksha\\Downloads\\motorcycle.jfif" # File path
with open(img_file, 'rb') as img: # Opens the image in the file path and reads the image as binary
    message.attach(MIMEImage(img.read(), name=os.path.basename(img_file))) # The image is then read and attached to the email message
    # os.path.basename(img_file) ignores the folder structure (C:\\Users\\aksha\\Downloads\\) and returns only the file name: "Proof of Address.jpg"

# Attach multiple images
picture_files = [
"C:\\Users\\aksha\\Downloads\\motorcycle.jfif",
"C:\\Users\\aksha\\Downloads\\elephant.jpg",
"C:\\Users\\aksha\\Downloads\\fierce_tiger.jfif",
"C:\\Users\\aksha\\Downloads\\angry_lion.webp",
] # File paths of the images

for photo in picture_files: # Looping over each path
    with open(photo,'rb') as pic: # Opening and reading each photo as a binary
        message.attach(MIMEImage(pic.read(), name=os.path.basename(photo)))
        # Attaching each image to the message of the email

# Attach several other files
other_files = [
"C:\\Users\\aksha\\Downloads\\Prompt Results.xlsx",
"C:\\Users\\aksha\\Downloads\\Tesla Resume.docx",
"C:\\Users\\aksha\\Downloads\\Nordic Resume and CV.pdf",
]
for files in other_files:
    with open(files,'rb') as f:
        message.attach(MIMEApplication(f.read(), name=os.path.basename(files)))

# Send the email
smtpObj.sendmail(from_addr=email, to_addrs=email, msg=message.as_string())
smtpObj.quit()
"""
