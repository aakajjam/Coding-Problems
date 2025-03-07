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

##################################################Hold For now#############################
test_skysqlUI.py code

"""
This module contains UI tests for SkySQL using Playwright.
"""

from playwright.sync_api import Page, expect
import pytest
import re

preprod_url = "https://test-skysql.com/"
prod_url = "https://skysql.com/"

# Run npm run dev command in Visual Studio Code before executing any tests locally
local_url = "https://localhost:8000" # This URL opens the UI portal LOCALLY

# Test going on to the site
def test_site(page: Page):
   page.goto(url=prod_url)
   page.get_by_role(role="link", name="Log in").click()

# Login with correct credentials: TC_LOGIN_001
def test_login(page: Page):
    # Given: User is logged out of SkySQL
    page.goto(url="prod_url")
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    page.locator('button[type=submit]').click()
    #page.on("console", lambda msg: print(msg.text)) - DO NOT REMOVE THIS LINE
    page.click('button[type=submit]')

    page.wait_for_url("https://app.skysql.com/dashboard*", timeout=30000)
    # Then: User is able to access their account

    expect(page).to_have_url(re.compile(r"^https://app.skysql.com/dashboard"))


# Logging in with correct username and wrong password: TC_LOGIN_002
# Logging in with wrong username and correct password: TC_LOGIN_003
# Logging in wrong username and wrong password: TC_LOGIN_004
def test_wrong_login(page: Page, username, password):
    page.goto(url=prod_url) # Go to the website
    page.get_by_role(role="link", name="Log in").click() # Click on the login button

    page.locator('id=username').fill(username) # Fill in the username in the textbox
    page.locator('id=password').fill(password) # Fill in the password in the textbox

    page.click('button[type=submit]') # Click on the submit button

    # Then: User is unable to login
    page.locator('aria-label=You have entered wrong username or password') # Ensure sees the error message after a failed login


@pytest.mark.parametrize("prompt", [
    "Get Connected - From a Java App?",
    "Get Connected - From a Node.js App",
    "Get Connected - DBeaver Tool",
    "Load data - Create and load using Synthetic Data",
    "Migration - Live Migration to SkySQL?"
])
def test_prompts_responses(page:Page, prompt):
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')

    page.click('button[type=submit]')

    #expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('textarea[autofocus]').fill(prompt)

    page.keyboard.press(key="Enter")

    page.locator('id=copilot-messages').wait_for(state="visible", timeout=60000) # state="visible means user can see and/or interact with the element
    page.locator('id=copilot-messages', has_text=prompt)

    page.wait_for_timeout(timeout=30000)


def test_text_dump(page: Page):

    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')

    page.click('button[type=submit]')

    # expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('id=copilot-messages').wait_for(state="attached", timeout=30000)
    # With many prompts its hard to see all the text, we say state="attached" to ensure that the elements are present in the DOM,
    # This makes it easier for a text dump ensuring we capture all the content
    # If we said state="visible", we are checking the text that the user can see without scrolling, so doing a text dump may show only what the user sees and not the entire context

    text_dump = page.locator('id=copilot-messages').inner_text(timeout=60000)
    print(text_dump)

    with open("text_content.txt", "a") as file:
        file.write(text_dump)

def test_dump():
    pass
    # Open the file
    # Iterate over the file
    # If the string content matches the prompt, make that
"""
# This code was written by using Test Generation in Playwright.
# Need to do more research on which method is better for writing test code for automation test cases
import re
from playwright.sync_api import Playwright, sync_playwright, expect

def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://skysql.com/")

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)

"""

#################################################Hold for###########################3
test_accum.py
"""
This module contains a basic accumulator class.
Its purpose is to show how to use the pytest framework for testing classes.
"""


# --------------------------------------------------------------------------------
# Class: Accumulator
# --------------------------------------------------------------------------------
"""
class Accumulator:

    # The __init__ method initializes the class with a starting count of zero.
    # Internally, the tally is saved in the self._count variable.
    # This variable should be treated as private because it is prefixed with a single underscore.
    def __init__(self) -> None:
        self._count = 0

    # The count method returns the value of the count.This method is aproperty, as denoted by the @ propertydecorator.
    # properties control how callers can "get" and "set" values.
    # With this property, a caller can get the value of count but cannot set the value directly with an assignment statement.
    @property
    def count(self) -> int:
        return self._count


    # The add method is the only way to change the internal count value. It accepts an amount to add as input and adds this amount to the internal account.
    # By default, the amount to add is one, but this value may be overwritten.
    def add(self, more=1) -> None:
        self._count += more
"""

from playwright.sync_api import Page, expect
import pytest
import re
prod_url = "https://skysql.com"
preprod_url = "https://test-skysql.com/"

# Run npm run dev command in Visual Studio Code before executing any tests locally
local_url = "https://localhost:8000"  # This URL opens the UI portal LOCALLY

def test_prompts(page: Page):
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    page.locator('[data-action-button-primary="true"]').click()

    page.goto(url="https://app.skysql.com/dashboard")
    #expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))
    print("I am logged in to my account")
    # expect(page).to_have_title(re.compile("SkySQL"))

    # Read on these functions first in Playwright docs
    """
    page.wait_for_timeout()
    page.wait_for_url()
    page.wait_for_event() - may use
    page.wait_for_function() - may use this
    page.wait_for_selector()
    page.wait_for_load_state()
    page.go_forward()
    """

    # Wait 10 seconds until the page has loaded then try searching for the element
    page.locator('name=__privateStripeMetricsController2020').wait_for(state="visible",timeout=20000)

    items = page.locator('name=__privateStripeMetricsController2020')
    count = items.count()  # Get the number of matching elements
    print(count, "This is the count number")
    if count > 3:  # Check if there are at least 4 elements
        expect(items.nth(3)).to_be_visible(visible=True)
    else:
        raise Exception('Not enough elements found.')

   # expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)
   # page.locator('.nav-title.ml-2').wait_for(state="visible")
    #page.locator('.v-list-item--link').nth(3).wait_for(state="visible", timeout=5000)
   # page.wait_for_selector(selector='.v-list-item--link',state="visible")
   # page.locator('.v-list-item--link').nth(3).click()  # Use this, as this is a parent element, which is less likely to change

   # page.locator('textarea[autofocus]').fill('How do I make an alert in my account')

# This option will just check that prompts and responses appear in the chat window

# Works with ONLY one prompt and one response
def test_prompts_responses(page:Page):
    global prompt_text
    global response_text
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    #page.locator('[data-action-button-primary="true"]').click()
    page.click('button[type=submit]')
    #page.goto(url="https://app.skysql.com/dashboard")

    expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    #items = page.locator('.v-list-item--link')
    #count = items.count()  # Get the number of matching elements
    #print(count, "This is the count number")
    #if count > 3:  # Check if there are at least 4 elements
    #    expect(items.nth(3)).to_be_visible(visible=True)
    #else:
    #    raise Exception('Not enough elements found.')

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('textarea[autofocus]').fill("What aler are available")

    page.keyboard.press(key="Enter")

    #page.locator("id=copilot-messages").wait_for(state="visible",timeout=20000) # Time limit set for an operation to complete. If the operation doesn't finish within the specified time, a timeout error occurs
    #page.locator("id=copilot-messages", has_text="sdfgffbb") # We want to see the text response

    #page.locator('.message-content').wait_for(state="visible", timeout=20000)
    #page.locator('.message-content', has_text="feel free to ask!")


    page.locator('id=copilot-messages').wait_for(state="visible", timeout=60000) # Time limit set for an operation to complete. If the operation doesn't finish within the specified time, a timeout error occurs
    prompt_element = page.locator('id=copilot-messages', has_text="What aler are available") # We want to see the text response

    #prompt_text = prompt_element.inner_text(timeout=60000)
    #prompt_text = prompt_text.replace(",",",")
    #print(prompt_text)
    #sys.stdout.flush() # Forcing a print
    #print(type(prompt_text))
    #sys.stdout.flush()

    #page.locator('.message-content').wait_for(state="visible", timeout=60000)
    #response_element = page.locator('.message-content', has_text=re.compile(r'.+'))

    response_element = prompt_element.locator("~.message-content").wait_for(state="visible")
    print(response_element.text_content())

    #response_text = response_element.inner_text(timeout=60000)
    #response_text = response_text.replace(",","," )
    #print(response_text)
    #sys.stdout.flush()
    #print(type(response_text))
    #sys.stdout.flush() # Forcing a print
    # Make sure to have pytest -s in the terminal to disable output capturing. This will allow us to see the printed content on the console - DO NOT REMOVE THIS COMMENT

    #id=copilot-messages.prompt, has_text="How am I billed in SkySQL < .message-content - DO NOT REMOVE THIS COMMENT


   # page.locator().inner_html() - Can try this
   # page.locator().inner_text()
   # page.locator().all()
   # page.locator().all_text_contents()
   # page.locator().all_inner_texts()

##############################################################################################################



# Test going on to the site
def test_site(page: Page):
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()


# Login with correct credentials: TC_LOGIN_001
def test_login(page: Page):
    # Given: User is logged out of SkySQL
    page.goto(url="prod_url")
    # page.goto(url="https://app.skysql.com/dashboard")
    # page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    # page.locator('[data-action-button-primary="true"]').click()
    # page.locator('button[type=submit]').click()
    page.on("console", lambda msg: print(msg.text))
    page.click('button[type=submit]')

    page.wait_for_url("https://app.skysql.com/dashboard*", timeout=30000)
    # expect(page).to_have_url(re.compile(r"^https://app.skysql.com/dashboard"))
    # page.goto(url="https://app.skysql.com/dashboard")
    # print("I am logged in")

    expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    # Then: User is able to access their account
    # expect(page).to_have_title(re.compile("SkySQL"))


# Logging in with correct username and wrong password: TC_LOGIN_002
# Logging in with wrong username and correct password: TC_LOGIN_003
# Logging in wrong username and wrong password: TC_LOGIN_004

def test_wrong_login(page: Page, username, password):
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    page.locator('id=username').fill(username)
    page.locator('id=password').fill(password)
    # page.locator('[data-action-button-primary="true"]').click()
    page.click('button[type=submit]')

    # Then: User is unable to login
    page.locator('aria-label=You have entered wrong username or password')


# TEST CASE WILL WORK WHEN THE PROMPTS ARE UNIQUE
def test_prompts(page: Page):
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    page.click('button[type=submit]')
    # page.goto(url="https://app.skysql.com/dashboard")

    # expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    # items = page.locator('.v-list-item--link')
    # count = items.count()  # Get the number of matching elements
    # print(count, "This is the count number")
    # if count > 3:  # Check if there are at least 4 elements
    #    expect(items.nth(3)).to_be_visible(visible=True)
    # else:
    #    raise Exception('Not enough elements found.')

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(
        3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('textarea[autofocus]').fill("Testing")

    page.keyboard.press(key="Enter")

    # page.locator(".message.user").wait_for(state="visible", timeout=20000)  # Time limit set for an operation to complete. If the operation doesn't finish within the specified time, a timeout error occurs
    # page.locator(".message.user", has_text=prompts)  # We want to see the text response

    page.locator("id=copilot-messages").wait_for(state="visible",
                                                 timeout=20000)  # Time limit set for an operation to complete. If the operation doesn't finish within the specified time, a timeout error occurs
    page.locator("id=copilot-messages", has_text="Testing")  # We want to see the prompt

    page.locator('.message-content').wait_for(state="visible", timeout=20000)
    page.locator('.message-content', has_text="feel free to ask!")

    # READ ON THE DIFFERENT WAIT_FOR METHODS IN PLAYWRIGHT FIRST BEFORE USING CHATGPT


# page.wait_for_selector()
# page.wait_for_load_state()
# page.wait_for_event()
# page.wait_for_timeout()
# page.wait_for_url()
# page.wait_for_function()
# page.locator().wait_for()

###    # Try these prompts in ChatGPT   ###
# In ChatGPT
# 1) Give a prompt
# 2) Type the enter key
# 3) Wait for the response
# Write this in Playwright python code

# What about page.wait_for_selector

# Using Playwright and python how would I get the element locator and CSS selector for the prompt and the response

# All of the classes have the same name. How would I get the locator for the response for this prompt "What about page.wait_for_selector"
@pytest.mark.parametrize("prompt", [
    "Get Connected - From a Java App?",
    "Get Connected - From a Node.js App",
    "Get Connected - DBeaver Tool",
    "Load data - Create and load using Synthetic Data",
    "Migration - Live Migration to SkySQL?"
])
def test_prompts_responses(page: Page, prompt):
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    # page.locator('[data-action-button-primary="true"]').click()
    page.click('button[type=submit]')
    # page.goto(url="https://app.skysql.com/dashboard")

    # expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(
        3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('textarea[autofocus]').fill(prompt)

    page.keyboard.press(key="Enter")

    page.locator('id=copilot-messages').wait_for(state="visible",
                                                 timeout=60000)  # state="visible means user can see and/or interact with the element
    page.locator('id=copilot-messages', has_text=prompt)

    page.wait_for_timeout(timeout=30000)

    # text_dump = page.locator('id=copilot-messages').inner_text(timeout=60000)

    # prompt_text = prompt_element.inner_text(timeout=60000)
    # print(prompt_text)
    # print(type(prompt_text))

    # page.locator('.message-content').wait_for(state="visible", timeout=60000)
    # response_element = page.locator('.message-content', has_text=re.compile(r'.+'))

    # response_text = response_element.inner_text(timeout=60000)
    # print(response_text)
    # print(type(response_text))
    # Make sure to have pytest -s in the terminal to disable output capturing. This will allow us to see the printed content on the console

    # id=copilot-messages.prompt, has_text="How am I billed in SkySQL < .message-content


def test_text_dump(page: Page):
    # Given: User is logged out of SkySQL
    page.goto(url=prod_url)
    page.get_by_role(role="link", name="Log in").click()

    # When: User types in their credentials and hits log in
    page.locator('id=username').fill('kajjam.akshay@outlook.com')
    page.locator('id=password').fill('Sanatana@@2013')
    # page.locator('[data-action-button-primary="true"]').click()
    page.click('button[type=submit]')
    # page.goto(url="https://app.skysql.com/dashboard")

    # expect(page).to_have_url(re.compile("https://app.skysql.com/dashboard"))

    expect(page.locator('.v-list-item--link').nth(3)).to_be_visible(visible=True)

    page.locator('.v-list-item--link').nth(
        3).click()  # Use this, as this is a parent element, which is less likely to change

    page.locator('id=copilot-messages').wait_for(state="attached", timeout=30000)
    # With many prompts its hard to see all the text, we say state="attached" to ensure that the elements are present in the DOM,
    # This makes it easier for a text dump ensuring we capture all the content
    # If we said state="visible", we are checking the text that the user can see without scrolling, so doing a text dump may show only what the user sees and not the entire context
    text_dump = page.locator('id=copilot-messages').inner_text(timeout=60000)
    print(text_dump)


def test_create_agent():
    pass


def test_legacy_prompts():
    pass


"""
# This code was written by using Test Generation in Playwright.
# Need to do more research on which method is better for writing test code for automation test cases
import re
from playwright.sync_api import Playwright, sync_playwright, expect

def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://skysql.com/")

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)

"""

"""
FAILED                            [100%]Failed to load resource: the server responded with a status of 400 ()
Hotjar not launching due to suspicious userAgent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/128.0.6613.18 Safari/537.36
Failed to load resource: the server responded with a status of 404 ()
Failed to load resource: the server responded with a status of 404 ()
Refused to run the JavaScript URL because it violates the following Content Security Policy directive: "script-src 'nonce-1OikE2dRgTqQoLL4' 'unsafe-eval'". Either the 'unsafe-inline' keyword, a hash ('sha256-...'), or a nonce ('nonce-...') is required to enable inline execution. Note that hashes do not apply to event handlers, style attributes and javascript: navigations unless the 'unsafe-hashes' keyword is present.

Refused to run the JavaScript URL because it violates the following Content Security Policy directive: "script-src 'nonce-1OikE2dRgTqQoLL4' 'unsafe-eval'". Either the 'unsafe-inline' keyword, a hash ('sha256-...'), or a nonce ('nonce-...') is required to enable inline execution. Note that hashes do not apply to event handlers, style attributes and javascript: navigations unless the 'unsafe-hashes' keyword is present.


Error
/.*.*=.*/
/.*.*=.*/
function () { [native code] }
function () { [native code] }
JSHandle@node
JSHandle@node
 : 1
 : 1
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
 PYDA: WROj
 PYDA: WROj
%c%d font-size:0;color:transparent PYDA: WROj
%c%d font-size:0;color:transparent PYDA: WROj
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent PYDA: WROj
%c%d font-size:0;color:transparent PYDA: WROj
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
%c%d font-size:0;color:transparent NaN
console.groupEnd
Request for the Private Access Token challenge.
The next request for the Private Access Token challenge may return a 401 and show a warning in console.
Failed to load resource: the server responded with a status of 401 ()
console.groupEnd
The resource https://challenges.cloudflare.com/cdn-cgi/challenge-platform/h/b/cmg/1 was preloaded using link preload but not used within a few seconds from the window's load event. Please make sure it has an appropriate as value and it is preloaded intentionally.

tau-intro-to-pytest\tests\test_skysqlUI.py:22 (test_login[chromium])
page = <Page url='https://id.skysql.com/u/login?state=hKFo2SBoMWNkeEJOTGpOb1lybUVyZkRJZUJNc1JKWVd0cnQ4QqFur3VuaXZlcnNhbC1sb2dpbqN0aWTZIEFyWTJfN3RISXk4YTZPa09RSGdXZmdtd1pQSTZFTXJoo2NpZNkgbm9lQ2lkQ1VMTVRTeWtMaFFBYjBnRFlPTFU2Q21CYzE'>

    def test_login(page: Page):
        # Given: User is logged out of SkySQL
        #page.goto(url="prod_url")
        page.goto(url="https://app.skysql.com/dashboard")
        #page.get_by_role(role="link", name="Log in").click()

        # When: User types in their credentials and hits log in
        page.locator('id=username').fill('kajjam.akshay@outlook.com')
        page.locator('id=password').fill('Sanatana@@2013')
        #page.locator('[data-action-button-primary="true"]').click()
        #page.locator('button[type=submit]').click()
        page.on("console", lambda msg: print(msg.text))
        page.click('button[type=submit]')

>       page.wait_for_url("https://app.skysql.com/dashboard*", timeout=30000)

test_skysqlUI.py:37: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
..\..\venv\lib\site-packages\playwright\sync_api\_generated.py:8981: in wait_for_url
    self._sync(
..\..\venv\lib\site-packages\playwright\_impl\_page.py:548: in wait_for_url
    return await self._main_frame.wait_for_url(**locals_to_params(locals()))
..\..\venv\lib\site-packages\playwright\_impl\_frame.py:233: in wait_for_url
    async with self.expect_navigation(
..\..\venv\lib\site-packages\playwright\_impl\_event_context_manager.py:33: in __aexit__
    await self._future
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

    async def continuation() -> Optional[Response]:
>       event = await waiter.result()
E       playwright._impl._errors.TimeoutError: Timeout 30000ms exceeded.
E       =========================== logs ===========================
E       waiting for navigation to "https://app.skysql.com/dashboard*" until 'load'
E       ============================================================

..\..\venv\lib\site-packages\playwright\_impl\_frame.py:208: TimeoutError

Process finished with exit code 1
ChatGPT said:
The issue you're facing consists of several distinct problems, which I'll address step by step:

1. Hotjar Not Launching Due to Suspicious UserAgent
This error indicates that the website you're trying to test has a security mechanism in place (like Hotjar or other tracking tools) that blocks automated tools or headless browsers from running, based on the userAgent. Since you're using HeadlessChrome, it's likely detected as an automation tool, causing the website to block certain actions or resources.

Possible Fix:
You can set a custom userAgent for your browser to mimic a real user instead of the headless one. Here's how you can modify your code to set a custom userAgent:

python
Copy
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)  # or False if you want to see the browser
    context = browser.new_context(
        user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.6613.18 Safari/537.36"
    )
    page = context.new_page()
    page.goto('https://app.skysql.com/dashboard')
    # Continue your test
By providing a custom userAgent, you may bypass restrictions that block headless browsers.

2. Content Security Policy (CSP) Violations
The error message about CSP suggests that the page's security settings are blocking some JavaScript from running. The page is enforcing strict script-src policies that prevent inline scripts or scripts from untrusted sources.

Possible Fix:
This issue often arises when you're interacting with a site that uses modern security practices. You can try one of the following:

Use a non-headless browser: If you're using headless=True in the browser, try switching to a headful browser (headless=False) to see if that makes a difference. This often helps bypass certain security measures that block headless browsers.

Bypass CSP: It's difficult to bypass CSP restrictions unless you have control over the server or are allowed to modify headers, which isn't possible with most third-party websites. However, since you're testing, running the tests in a non-headless browser might work.

3. Timeout Error on wait_for_url
This error happens because your test is waiting for a URL to change to https://app.skysql.com/dashboard*, but the page never navigates to that URL within the timeout period (30 seconds). This could be happening due to:

The page never reaching the expected URL (due to CSP issues or Hotjar blocking).
Some external challenge (like a CAPTCHA or security challenge) might be preventing the login from completing.
An incorrect or partial URL in wait_for_url.
Possible Fixes:
Increase Timeout: If the page is slow to load, you can try increasing the timeout period.
python
Copy
page.wait_for_url("https://app.skysql.com/dashboard*", timeout=60000)  # 60 seconds
Check for CAPTCHA or Challenges: If the page is showing a CAPTCHA or other challenges (like Cloudflare’s protection), the login will fail. You might need to handle this manually or set up a mock or bypass for the security check.

Debug the Navigation: Add debugging statements to understand whether the page is being redirected or if it's stuck somewhere:

python
Copy
page.on("console", lambda msg: print(msg.text))  # Prints out browser console logs
This will allow you to see what’s happening in the browser's console and may help debug why the page isn't reaching the expected URL.

4. HTTP Errors (400 and 404)
400 (Bad Request): This is typically caused by invalid data or request formatting issues. Double-check the URL and form submission data.
404 (Not Found): The resource you’re trying to access might not exist or the URL may be wrong.
Possible Fix:
Make sure the URL you're trying to visit (https://app.skysql.com/dashboard) is correct, and if it's a form, ensure the credentials are correctly filled and submitted.

You can also add some more logging to check if the form submission is successful and if the URL is correct after submission.

python
Copy
page.on("response", lambda response: print(f"Response: {response.status()} {response.url()}"))
This will print the status and URL of each request made by the page, which can help you identify if the requests are being blocked or returning errors.

5. Private Access Token Challenge
The challenge related to Cloudflare’s security system often involves bot protection mechanisms. You can’t easily bypass these in an automated test unless you have a way to mock the response or resolve the challenge manually.

Possible Fix:
If you are testing an environment where bot protection is in place, you may need to use a CAPTCHA-solving service, or, depending on the project, use mocks/stubs to bypass this security for testing purposes.

Summary of Steps to Try:
Set a custom userAgent to bypass Hotjar detection.
Try running the tests in a headful browser (headless=False) to bypass CSP or Hotjar restrictions.
Increase the timeout in wait_for_url if needed.
Use console logs and network response logging to better understand why the page is not navigating to the expected URL.
Handle CAPTCHA or bot challenges if present, or use a mock if you control the test environment.
These steps should help you identify and solve the issues you're facing. Let me know if you need further assistance with any specific part!
"""


