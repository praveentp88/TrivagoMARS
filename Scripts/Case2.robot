*** Settings ***
Documentation           This is a sample test for TRIVAGO Challenge
Library                 Selenium2Library

*** Variables ***
${URL}               http://room5.trivago.com/
${BROWSER}              Chrome
${DELAY}                0
${resultText}			

*** Keywords ***
Open Browser To Landing Page
	Open Browser        ${URL}   ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed  ${DELAY}
	
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Search using location	
	Maximize Browser Window	
	Click Element			xpath=//*[@id="cn-accept-cookie"]
	Scroll Page To Location    0    8000
	Click Element           xpath=//a[text()= "Contact"]

Fill Contacts page
	Press Key				xpath=.//*[@id='message']		Sample Message from Candidate
	Press Key				xpath=.//*[@id='full_name']		test
	Press Key				xpath=.//*[@id='email']			test@test.test
	Click Element 			xpath=.//*[@id='contactform-submit']
	capture_page_screenshot
	
*** Test Cases ***
Successful Launch
	[Tags]	SanityTest	RegressionTest
    Open Browser To Landing Page	
	
Case2
	[Tags]	RegressionTest
    Search using location
	Fill Contacts page
    [Tear Down]		Close Browser