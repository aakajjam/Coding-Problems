"""
This module contains UI tests for SkySQL using Selenium test_SkyUI.py.
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
import pytest
import re
import time
from selenium.common.exceptions import TimeoutException


preprod_url = "Give the URL here"
prod_url = "Give the URL here"
login_url = "Give the URL here" # This URL opens the login page directly

my_username = "Give the username here"
my_password = "Give the password here"

# Run npm run dev command in Visual Studio Code before executing any tests locally
local_url = "Give the URL here" # This URL opens the UI portal LOCALLY 

@pytest.fixture(scope="function")
def driver():
    driver = webdriver.Chrome()
    yield driver
    driver.quit()

def test_login_PP(driver):
    # Go to the website
    driver.get(preprod_url)

    # Make sure the page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    # Wait for the login button to be clickable and click it
    #login_button = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.LINK_TEXT, "Log in")))
    #login_button.click()
    # Verify if "Verify you are human" checkbox is present
    try:
        verification_box = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "content")))
        if verification_box.is_displayed(): # This returns a boolean value
            # Click checkbox on "Verify you are human" if visible
            driver.find_element(By.CSS_SELECTOR, "input[type=checkbox]").click()
            print("Verification box is present and clicked.")
    except:
        # If no verification box, continue with login
        pass # Do nothing

    # Wait for username or password fields to be visible
    WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.ID, "username")))

    # Fill in the username and password in the respective textboxes
    driver.find_element(By.ID, "username").send_keys(my_username)
    driver.find_element(By.ID, "password").send_keys(my_password)

    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-action-button-primary='true']")))

    """
    buttons = driver.find_elements(By.CSS_SELECTOR, "button[type=submit]")
    for button in buttons:
        if button.text == "Continue":
            button.click()
            break
    """    

    driver.find_element(By.CSS_SELECTOR, "button[data-action-button-primary='true']").click()

    # For debugging only - DO NOT REMOVE 
    #all_buttons = driver.find_elements(By.CSS_SELECTOR, "button[type=submit]")
    #for idx, btn in enumerate(all_buttons):
    #    print(f"Button {idx}: Text={btn.text}, Displayed={btn.is_displayed()}, Enabled={btn.is_enabled()}")
    
    # Click on the submit button
    #buttons = driver.find_elements(By.CSS_SELECTOR, "button[type=submit]")
    #continue_button = buttons[1]
    #continue_button.click()

   
    # Use this link for reference https://www.selenium.dev/documentation/webdriver/elements/finders/
            
    # Add assertion here to verify successful login or any post-login validation - example, verify that the user is redirected to a dashboard page

    # Make sure home page is loaded
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    try:
        WebDriverWait(driver, 10).until(EC.url_contains("dashboard"))  # Example: Check if URL contains "dashboard" after login
        print("Login successful!")
    except:
        print("Login failed or page did not redirect to the dashboard.")

    WebDriverWait(driver, 30).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.v-list-item--link')))
    driver.find_elements(By.CSS_SELECTOR, '.v-list-item--link')[4].click()
    
    #for tab in tabs:
    #    if tab.text == "SkyAI Agents":
    #        tab.click()
    #        break

    WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CLASS_NAME, 'sidebar')))

    WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.ID, 'copilot-messages')))

    driver.find_element(By.CSS_SELECTOR, 'textarea[placeholder]').send_keys("Hello World!")
    

    time.sleep(5)  # Wait for the page to load completely

def test_logout_PP(driver):
    # Go to the website
    driver.get(preprod_url)

    # Make sure the page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    # Wait for the login button to be clickable and click it
    #login_button = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.LINK_TEXT, "Log in")))
    #login_button.click()
    # Verify if "Verify you are human" checkbox is present
    try:
        verification_box = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "content")))
        if verification_box.is_displayed(): # This returns a boolean value
            # Click checkbox on "Verify you are human" if visible
            driver.find_element(By.CSS_SELECTOR, "input[type=checkbox]").click()
            print("Verification box is present and clicked.")

    except:
        # If no verification box, continue with login
        pass # Do nothing

    # Wait for username or password fields to be visible
    WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.ID, "username")))

    # Fill in the username and password in the respective textboxes
    driver.find_element(By.ID, "username").send_keys(my_username)
    driver.find_element(By.ID, "password").send_keys(my_password)

    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-action-button-primary='true']")))

    driver.find_element(By.CSS_SELECTOR, "button[data-action-button-primary='true']").click()

    # For debugging only - DO NOT REMOVE 
    #all_buttons = driver.find_elements(By.CSS_SELECTOR, "button[type=submit]")
    #for idx, btn in enumerate(all_buttons):
    #    print(f"Button {idx}: Text={btn.text}, Displayed={btn.is_displayed()}, Enabled={btn.is_enabled()}")
    
    # Click on the submit button
    #buttons = driver.find_elements(By.CSS_SELECTOR, "button[type=submit]")
    #continue_button = buttons[1]
    #continue_button.click()

   
    # Use this link for reference https://www.selenium.dev/documentation/webdriver/elements/finders/

    # Make sure home page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")
            
    # Add assertion here to verify successful login or any post-login validation - example, verify that the user is redirected to a dashboard page
    try:
        WebDriverWait(driver, 10).until(EC.url_contains("dashboard"))  # Example: Check if URL contains "dashboard" after login
        print("Login successful!")
    except:
        print("Login failed or page did not redirect to the dashboard.")


    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, "[data-test-id='btn-user-menu-action']"))) 

    driver.find_element(By.CSS_SELECTOR, "[data-test-id='btn-user-menu-action']").click()

    driver.find_element(By.CSS_SELECTOR, "[data-test-id='user-menu-item-logout']").click()

    WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.ID, "username"))) 
    # Make sure to have a dot before the class name when using a class element as your CSS_SELECTOR (.mr-0) 
    # If the class locator has multiple class names, choose CSS_SELECTOR instead of CLASS_NAME and use a dot before the class name 

    # Go to the account name and click
    #drop_down = driver.find_element(By.CSS_SELECTOR, '.mr-0')

    # Wait for the login page to be visible again via the username box

    # Make sure page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    # Wait for the username field to be located again
    WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.ID, "username"))) 



def test_prompts(driver): 
    
    # Go to the website
    driver.get(preprod_url)

    # Wait for the login button to be clickable and click it
    #login_button = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.LINK_TEXT, "Log in")))
    #login_button.click()
    # Verify if "Verify you are human" checkbox is present
    try:
        verification_box = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "content")))
        if verification_box.is_displayed(): # This returns a boolean value
            # Click checkbox on "Verify you are human" if visible
            driver.find_element(By.CSS_SELECTOR, "input[type=checkbox]").click()
            print("Verification box is present and clicked.")

    except:
        # If no verification box, continue with login
        pass # Do nothing

    # Wait for username or password fields to be visible
    WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.ID, "username")))

    # Fill in the username and password in the respective textboxes
    driver.find_element(By.ID, "username").send_keys(my_username)
    driver.find_element(By.ID, "password").send_keys(my_password)

    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-action-button-primary='true']")))

    driver.find_element(By.CSS_SELECTOR, "button[data-action-button-primary='true']").click()

    try:
        WebDriverWait(driver, 10).until(EC.url_contains("dashboard"))  # Example: Check if URL contains "dashboard" after login
        print("Login successful!")
    except:
        print("Login failed or page did not redirect to the dashboard.")

    WebDriverWait(driver, 30).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.v-list-item--link')))
    driver.find_elements(By.CSS_SELECTOR, '.v-list-item--link')[4].click()
    
    #for tab in tabs:
    #    if tab.text == "SkyAI Agents":
    #        tab.click()
    #        break

    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")
    
    #WebDriverWait(driver, 30).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.v-card--link')))

    prompt_bar = driver.find_element(By.CSS_SELECTOR, "textarea[placeholder]").is_enabled()
    print(f"Prompt bar element is enabled: {prompt_bar}")

    #time.sleep(0.25)  

    driver.find_element(By.CSS_SELECTOR, "textarea[placeholder]").send_keys("Get Connected")

    driver.find_element(By.CSS_SELECTOR, "[data-test-id='btn-send-prompt']").click()

    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, "[data-test-id='btn-user-menu-action']"))) 

    driver.find_element(By.CSS_SELECTOR, "[data-test-id='btn-user-menu-action']").click()


    logout_enaled = driver.find_element(By.CSS_SELECTOR, "[data-test-id='user-menu-item-logout']").is_enabled()
    print(f"Logout button is enabled: {logout_enaled}")

    driver.find_element(By.CSS_SELECTOR, "[data-test-id='user-menu-item-logout']").click()

    WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.ID, "username"))) 
    # Make sure to have a dot before the class name when using a class element as your CSS_SELECTOR (.mr-0) 
    # If the class locator has multiple class names, choose CSS_SELECTOR instead of CLASS_NAME and use a dot before the class name 

    # Go to the account name and click
    #drop_down = driver.find_element(By.CSS_SELECTOR, '.mr-0')

    # Wait for the login page to be visible again via the username box
    WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.ID, "username"))) 

    #driver.find_element(By.CSS_SELECTOR, "copilot-messages").click()

    #time.sleep(5)

    # Verify prompt and response are present in the UI

    # How do I ca

def test_no_services(driver):
    # Go to the website
    driver.get(preprod_url)

    # Make sure the page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    # Wait for the login button to be clickable and click it
    #login_button = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.LINK_TEXT, "Log in")))
    #login_button.click()
    # Verify if "Verify you are human" checkbox is present
    try:
        verification_box = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "content")))
        if verification_box.is_displayed(): # This returns a boolean value
            # Click checkbox on "Verify you are human" if visible
            driver.find_element(By.CSS_SELECTOR, "input[type=checkbox]").click()
            print("Verification box is present and clicked.")

    except:
        # If no verification box, continue with login
        pass # Do nothing

    # Wait for username or password fields to be visible
    WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.ID, "username")))

    # Fill in the username and password in the respective textboxes
    driver.find_element(By.ID, "username").send_keys(my_username)
    driver.find_element(By.ID, "password").send_keys(my_password)

    # Find the "Continue" button and click the "Continue" button
    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-action-button-primary='true']")))
    driver.find_element(By.CSS_SELECTOR, "button[data-action-button-primary='true']").click()

    # Make sure home page is ready after logging in
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    try:
        WebDriverWait(driver, 10).until(EC.url_contains("dashboard"))  # Example: Check if URL contains "dashboard" after login
        print("Login successful!")
    except:
        print("Login failed or page did not redirect to the dashboard.")

    # Wait for the element with class name 'my-5' to be present in the web page
    WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CLASS_NAME, 'my-5')))

    # Find the element with the launch service text
    launch_service_text = driver.find_element(By.CSS_SELECTOR, '.my-5')    

    # Assert that the text is "You don’t have any SkySQL services right now."
    assert launch_service_text.text == "You don’t have any SkySQL services right now."
    print(f"Expected 'No services found', but got '{launch_service_text.text}'")


def test_create_service_serverless_fix(driver):
    # Go to the website
    driver.get(preprod_url)

    # Make sure the page is ready
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    # Wait for the login button to be clickable and click it
    #login_button = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.LINK_TEXT, "Log in")))
    #login_button.click()
    # Verify if "Verify you are human" checkbox is present
    try:
        verification_box = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.ID, "content")))
        if verification_box.is_displayed(): # This returns a boolean value
            # Click checkbox on "Verify you are human" if visible
            driver.find_element(By.CSS_SELECTOR, "input[type=checkbox]").click()
            print("Verification box is present and clicked.")

    except:
        # If no verification box, continue with login
        pass # Do nothing

    # Wait for username or password fields to be visible
    WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.ID, "username")))

    # Fill in the username and password in the respective textboxes
    driver.find_element(By.ID, "username").send_keys(my_username)
    driver.find_element(By.ID, "password").send_keys(my_password)

    # Find the "Continue" button and click the "Continue" button
    WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-action-button-primary='true']")))
    driver.find_element(By.CSS_SELECTOR, "button[data-action-button-primary='true']").click()

    # Make sure home page is ready after logging in
    ready_state = WebDriverWait(driver, 10).until(lambda d: d.execute_script("return document.readyState")) == "complete"
    print(f"Page ready state: {ready_state}")

    try:
        WebDriverWait(driver, 10).until(EC.url_contains("dashboard"))  # Example: Check if URL contains "dashboard" after login
        print("Login successful!")
    except:
        print("Login failed or page did not redirect to the dashboard.")

    
    try: # Try to locate the element with class name 'my-5' - This is associated with the launch service text
        WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CLASS_NAME, 'my-5')))

        # Locate the element with the launch service text
        launch_service_text = driver.find_element(By.CSS_SELECTOR, '.my-5')    

        assert launch_service_text.text == "You don’t have any SkySQL services right now."
        print(f"Expected 'You don’t have any SkySQL services right now.', but got '{launch_service_text.text}'")

    except:# If the element is not found, it means the user has services already - we check this here
        
        # If service card is already present, then we click the launch service button
        WebDriverWait(driver, 30).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.service-card')))
        WebDriverWait(driver, 30).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.service-card')))
        
        # Wait for the launch button to be located in the web page
        WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.launch-btn')))

        # Click on the launch button
        driver.find_element(By.CSS_SELECTOR, '.launch-btn').click()

        # Wait for the page to load after clicking the launch a free service button
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.row')))

        # Find the headline and verify by its text "Launch a Cloud Database"
        headline = driver.find_element(By.CLASS_NAME, 'view-headline')
        assert headline.text == "Launch a Cloud Database"
        print(f"Expected 'Launch a Cloud Database', but got '{headline.text}'")

        # Wait for the prescence of the cloud provider panel element in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "cloudProviderPanel")))

        # Find the text Cloud Provider in the page
        cloud_provider_panel = driver.find_element(By.ID, "cloudProviderPanel")

        # Scroll to the Cloud Provider text box until visible
        ActionChains(driver).scroll_to_element(cloud_provider_panel).perform()

        # Click on Azure
        driver.find_element(By.CSS_SELECTOR, "[data-test-id='btn-cloud-select-azure']").click()

        # Wait for the Service Attributes panel to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "serverPanel")))
        service_attribute_panel = driver.find_element(By.ID, "serverPanel")

        # Scroll to the Service Attributes text box until visible
        ActionChains(driver).scroll_to_element(service_attribute_panel).perform()

        # Wait for the Service Name text box to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, 'v-text-field__slot')))

        # Find the Service Name text box in the page
        service_name_box = driver.find_element(By.CLASS_NAME, 'v-text-field__slot')

        # Scroll to the Service Name text box until visible
        ActionChains(driver).scroll_to_element(service_name_box).perform()

        # Extract the text from the Service Name text box - This will be used to verify the services after creation
        service_name_text = service_name_box.find_element(By.TAG_NAME, 'input').get_attribute('value') # The value html tag is implicitly used here (part of DOM maybe), we can't see this
        print(f"Service Name text box value: {service_name_text}")

        # Wait for the Launch Service button to be clickable
        WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.launch-button')))

        # Click the Launch Service button
        driver.find_element(By.CSS_SELECTOR, '.launch-button').click()

        # Wait for the entire service card (outer) box elements to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.service-card')))

        # Wait until the service card (outer) box is visible in the web page
        WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.service-card')))

        # Check for the header of the outer box of the service card
        WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.service-card-header')))

        # Wait for the bottom (inner) box of the service card to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

        # Wait for the botton (inner) box of the service card to be visible in the web page
        WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

        # Check that we don't see a launch failed message in the UI - if we see this print a message - FUTURE

        # Need to write code to verify the service is created successfully by checking the service name in the UI
        service_cards = driver.find_elements(By.CSS_SELECTOR, '.service-card.service-card-header.col')

        for card in service_cards:
            if card.text == service_name_text:
                print(f"Service card with name '{service_name_text}' is present.")
                card.click()  # Click on the service card to view details
                break   
        
        time.sleep(5)
    
    
    else: # Else block will execute if the try block does NOT raise an exception
        # Click the launch service button    
        driver.find_element(By.CSS_SELECTOR, '.launch-btn').click()

        # Wait for the page to load after clicking the launch a free service button
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.row')))

        # Find the headline and verify by its text "Launch a Cloud Database"
        headline = driver.find_element(By.CLASS_NAME, 'view-headline')
        assert headline.text == "Launch a Cloud Database"
        print(f"Expected 'Launch a Cloud Database', but got '{headline.text}'")

        # Wait for the prescence of the cloud provider panel element in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "cloudProviderPanel")))

        # Find the text Cloud Provider in the page
        cloud_provider_panel = driver.find_element(By.ID, "cloudProviderPanel")

        # Scroll to the Cloud Provider text box until visible
        ActionChains(driver).scroll_to_element(cloud_provider_panel).perform()

        time.sleep(5)

        # Click on Azure
        driver.find_element(By.CSS_SELECTOR, "[data-test-id='btn-cloud-select-azure']").click()

        time.sleep(5)

        # Wait for the Service Attributes panel to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "serverPanel")))
        service_attribute_panel = driver.find_element(By.ID, "serverPanel")

        # Scroll to the Service Attributes text box until visible
        ActionChains(driver).scroll_to_element(service_attribute_panel).perform()

        time.sleep(5)

        # Wait for the Service Name text box to be present in the web page
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, 'v-text-field__slot')))

        # Find the Service Name text box in the page
        service_name_box = driver.find_element(By.CLASS_NAME, 'v-text-field__slot')

        # Scroll to the Service Name text box until visible
        ActionChains(driver).scroll_to_element(service_name_box).perform()

        # Extract the text from the Service Name text box - This will be used to verify the services after creation
        service_name_text = service_name_box.find_element(By.TAG_NAME, 'input').get_attribute('value') # The value html tag is implicitly used here (part of DOM maybe), we can't see this
        print(f"Service Name text box value: {service_name_text}")

        # Wait for the Launch Service button to be clickable
        WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.launch-button')))

        # Click the Launch Service button
        driver.find_element(By.CSS_SELECTOR, '.launch-button').click()

        try: # This pop up comes up for the very first time a user creates a service, so we need to handle this pop up
            WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'button.v-btn--has-bg')))

            buttons = driver.find_elements(By.CSS_SELECTOR, 'button.v-btn--has-bg')
            for button in buttons:
                if button.text == "Continue":
                    button.click()
                    break

            # Wait for the entire service card (outer) box elements to be present in the web page
            WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.service-card')))

            # Wait until the service card (outer) box is visible in the web page
            WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.service-card')))

            # Check for the header of the outer box of the service card
            WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.service-card-header')))

            # Wait for the bottom (inner) box of the service card to be present in the web page
            WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

            # Wait for the botton (inner) box of the service card to be visible in the web page
            WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

            # Check that we don't see a launch failed message in the UI - if we see this print a message - FUTURE

            # Need to write code to verify the service is created successfully by checking the service name in the UI
            service_cards = driver.find_elements(By.CSS_SELECTOR, '.service-card.service-card-header.col')

            for card in service_cards:
                if card.text == service_name_text:
                    assert card.is_displayed()  # Check if the service card is displayed
                    print(f"Service card with name '{service_name_text}' is present.")
                    card.click()  # Click on the service card to view details
                    break

            time.sleep(5)        
            
        except:
            
            # Wait for the entire service card (outer) box elements to be present in the web page
            WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, '.service-card')))

            # Wait until the service card (outer) box is visible in the web page
            WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.service-card')))

            # Check for the header of the outer box of the service card
            WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.service-card-header')))

            # Wait for the bottom (inner) box of the service card to be present in the web page
            WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

            # Wait for the botton (inner) box of the service card to be visible in the web page
            WebDriverWait(driver, 10).until(EC.visibility_of_all_elements_located((By.CSS_SELECTOR, '.pa-4')))

            # Check that we don't see a launch failed message in the UI - if we see this print a message - FUTURE

            # Need to write code to verify the service is created successfully by checking the service name in the UI
            service_cards = driver.find_elements(By.CSS_SELECTOR, '.service-card.service-card-header.col')

            for card in service_cards:
                if card.text == service_name_text:
                    assert card.is_displayed()  # Check if the service card is displayed
                    print(f"Service card with name '{service_name_text}' is present.")
                    card.click()  # Click on the service card to view details
                    break

        time.sleep(5)    




# Add test code for ensuring the service name box has text - FUTURE

        # Select all the text in the Service Name text box
        #service_name_box.find_element(By.TAG_NAME, 'input').send_keys(Keys.CONTROL, 'a') # Use TAG_NAME to actually interact with the input field
        
        # Delete the current text in the Service Name text box
        #service_name_box.find_element(By.TAG_NAME, 'input').send_keys(Keys.DELETE)

        # Enter the new service name
        #service_name_box.find_element(By.TAG_NAME, 'input').send_keys("akshay-kajjam-rrgn-test")

        # Wait for the element with class name 'my-5' to be present in the web page
        # WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.CLASS_NAME, 'my-5')))



# Add test case to check the number of services allowed in the UI

    # Find the service name text box
    #service_name_box = driver.find_element(By.CLASS_NAME, 'v-text-field__slot')

    # Use ActionChains to scroll
    #ActionChains(driver).scroll_to_element(service_name_box).perform()

    #time.sleep(5)  # Wait for the scroll to complete




# DO NOT REMOVE
"""
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Assuming driver is already initialized
driver.get("your_login_page_url")

# Wait for the iframe containing the reCAPTCHA to be present
iframe = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, "//iframe[@title='reCAPTCHA']"))
)

# Switch to the iframe
driver.switch_to.frame(iframe)

# Wait for the "checkbox" inside the iframe to be clickable and click it
checkbox = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.ID, "recaptcha-anchor"))
)
checkbox.click()

# Switch back to the main content after interacting with the checkbox
driver.switch_to.default_content()

# Continue with the rest of your login process or any other actions
"""
