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
	Click Element			xpath=//*[@id="cn-accept-cookie"]
	
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
	
Subscibe to Newsletter	
	Press Key				xpath=//*[@id="etn_email"]			test@test.test
	Select Checkbox			xpath=//*[@id="etn_conf_checkbox_de"]
	Click Button 			xpath=//*[@id="static-form"]/div[3]/button	
	capture_page_screenshot
	
Navigate to Destinations
	Click Element           css=.nav-icon
	Click Element			xpath=//a[@class="di-link term-link" and contains(text(),"USA")]
	Wait Until Page Contains Element		xpath=.//*[@id='articleheader']
	capture_page_screenshot
	
*** Test Cases ***
Successful Launch
	[Tags]	SanityTest	RegressionTest
    Open Browser To Landing Page	
	
Navigate to Destination
	[Tags]	RegressionTest
	Navigate to Destinations
	[Tear Down]		Close Browser
    