# Generate QR Codes for use at Providence

# Import qrcode
import qrcode

# Data to encode
data = "Enter your https link here"

# Create the qr code object
qr = qrcode.QRCode()

# Add the data to the qr code
qr.add_data(data=data)

# Generate the qr code
qr.make()

# Create the QR Code Image
picture = qr.make_image()

# Save the QR Code
picture.save("directions_pdf.png")

"""
# Import qrcode
from qrcode import QRCode

# Information we want to embed into the QR Code
url = "Some link"

# Create the QR Code object
qr = QRCode()

# Add our data to the QR Code
qr.add_data(url)

# Adjust the size of the QR Code

# Generate the QR Code

# Create the QR Code image

# Save the QR Code
"""
