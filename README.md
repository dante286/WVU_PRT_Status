# WVU_PRT_Status
The Status of the WVU PRT.

This is a basic shell script that uses wget to query the current status
of the WVU PRT.  If the status has changed the base index.html is over-
written and replaced with the most current status / response from the 
api.

This shell script will eventually be run as part of a Jenkins job and
email setup.  Emails can be sent when the status changes.

Also refer to the following URL for the API documentation for the PRT
status: https://prtstatus.wvu.edu/api/
