<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mlogin.aspx.cs" Inherits="Mlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center">
        <tr>
            <td rowspan="4"style="width:100px">
                <asp:Image ID="ImageM" runat="server" ImageUrl="~/Images/M.jpg" />

            </td>
            <td style="withth:100px"height="60">
                管理员号：

            </td>
            <td >

                <asp:TextBox ID="txtmID" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="100"height="60">
                密码：
            </td>
            <td width="160" height="60">

                <asp:TextBox ID="txtmpwd" runat="server" TextMode="Password"></asp:TextBox>

            </td>
        </tr>
       
        <tr>
            <td colspan="2" height="60" >

                
                <asp:LinkButton ID="lbmLogin" runat="server" OnClick="lbmLogin_Click">登录</asp:LinkButton>

                
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:CheckBox ID="mcbMemory" runat="server" Checked="True" Text="30天内记住我" />

            </td>
        </tr>
        </table>
</asp:Content>

