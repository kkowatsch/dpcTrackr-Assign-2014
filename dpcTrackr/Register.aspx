<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="dpcTrackr.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblRegister" runat="server" Text="Register"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblUserName" runat="server" Text="User name:"></asp:Label>
&nbsp;<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="A user name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="A password is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblConfirm" runat="server" Text="Confirm:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;<asp:CompareValidator ID="cvConfirm" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="Passwords must match" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        <asp:RadioButtonList ID="rblRole" runat="server">
            <asp:ListItem>Worker</asp:ListItem>
            <asp:ListItem>Designer</asp:ListItem>
            <asp:ListItem>Manager</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Register" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
