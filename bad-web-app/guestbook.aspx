<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guestbook.aspx.cs" Inherits="bad_web_app.guestbook" ValidateRequest="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>XSS vulnerability example</title>
</head>
 <script runat="server">
  void btnSubmit_Click(Object sender, EventArgs e)
  {
    // If ValidateRequest is false, then 'hello' is displayed
    // If ValidateRequest is true, then ASP.NET returns an exception
    Response.Write(txtString.Text);
  }
 </script>
 <body>
  <form id="form2" runat="server">
    <asp:TextBox Width="300" Height="300" id="txtString" runat="server" 
                 Text="Hello" />
    <asp:Button id="btnSubmit" runat="server" OnClick="btnSubmit_Click" 
                 Text="Submit" />
  </form>
 </body>
</html>