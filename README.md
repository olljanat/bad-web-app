# bad-web-app
Example ASP.NET application where everything is done wrong.

Can be used for demostration/testing purposes.
Idea have been enable maximum number of vulnerabilities using minimum amount of code so also non-coding persons are able to understand that code with minimum effort.

Project also contains

# Features
## File upload
Allows user upload files to server.

Based on this example: https://support.microsoft.com/en-us/help/323246/how-to-upload-a-file-to-a-web-server-in-asp.net-by-using-visual-c-.net

Vulnerabilities:
- File upload without authentication
- No input validation (any files can be uploaded).

## Guestbook
Allows user leave comment to guestbook.

Based on this example: https://msdn.microsoft.com/en-us/library/ff649310.aspx

Vulnerabilities:
- Commenting without authentication/human validation (CAPTCHA)
- Request validation disabled => cross-site scripting (XSS)

## Web shell (cmd and PowerShell)
Allows user run cmd/PowerShell commands on web server.
Can be used to demostrate/test which kind of rights IIS user has on server.

Based on this: https://github.com/fuzzdb-project/fuzzdb/blob/master/web-backdoors/asp/cmdasp.aspx

Vulnerabilities:
- Run commands on server with IIS user rights.