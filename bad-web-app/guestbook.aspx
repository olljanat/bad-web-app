<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guestbook.aspx.cs" Inherits="bad_web_app.guestbook" ValidateRequest="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>XSS/SQL injection vulnerability example</title>
</head>
 <script runat="server">
     void btnSubmit_Click(Object sender, EventArgs e)
     {
         AddToDB(txtString.Text);
         Response.Write(txtString.Text);
     }
     void btnSearch_Click(Object sender, EventArgs e)
     {
         SearchFromComments(txtString.Text);
     }
 </script>
 <body>
  <form id="form2" runat="server">
    <asp:TextBox Width="300" Height="300" id="txtString" runat="server" Text="" />
    <asp:Button id="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Leave comment" />
    <asp:Button id="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search from comments" />
  </form>
 </body>
</html>