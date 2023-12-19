<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="bad_web_app.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File upload vulnerability example</title>
</head>
<body>
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <input type="file" id="File1" name="File1" runat="server" />
    <br />
    <input type="submit" id="Submit1" value="Upload" runat="server" />
    </form>
</body>
</html>
