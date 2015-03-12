<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="dpcTrackr.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <link rel="stylesheet" href="LoginStyle.css" />

    <title>Login</title>
</head>
<body> 
    <div class="background">
           
   
     <div class="login">
    <form id="form1" runat="server" class="loginform">

                       
                <asp:Label ID="lblLoginTitle" cssclass="lblLoginTitle" runat="server" Text="Login"></asp:Label>
                <br />
           
                <asp:Label ID="lblUserName" runat="server" Text="User Name:"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="A user name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
               
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br/>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="A password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
               
        <asp:Label ID="lblFeedback" runat="server"></asp:Label></form> 


               </div>
     
       <footer id="footer">
            <p>Copyright &#169 Natural by Design; 2014</p>
        </footer> 
    </div>
    

    
</body>
</html>
