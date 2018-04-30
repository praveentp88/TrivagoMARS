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

Search using location	
	Click Element           css=span.room5-icons-search
	Press Key				xpath=.//*[@id="ajax-search-input"]			NewYork
	capture_page_screenshot
	
*** Test Cases ***
Successful Launch
	[Tags]	SanityTest	RegressionTest
    Open Browser To Landing Page	
	
Case1 : Search 
	[Tags]	RegressionTest
    Search using location
	capture_page_screenshot
	[Tear Down]		Close Browser
    