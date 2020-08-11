***Settings***
Documentation       Code to open session with Appium

Library             AppiumLibrary

Resource            kws.robot

***Keywords***
#Hooks
Open Session
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     app=${EXECDIR}/app/ninjachef.apk
    ...                     udid\t=emulator-5554
    ...                     adbExecTimeout=100000

Close Session
    Close Application