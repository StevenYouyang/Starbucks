<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
            height: 12px;
        }
        .auto-style2 {
            height: 12px;
        }
        .auto-style3 {
            width: 100px;
            height: 48px;
        }
        .auto-style4 {
            height: 41px;
        }
        .auto-style5 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center">
        <tr>
            <td rowspan="4"style="width:100px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/L001.jpg" style="margin-bottom: 0px" />

            </td>
            <td class="auto-style3">
                用户号：

            </td>
            <td class="auto-style5">

                <asp:TextBox ID="txtuserID" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="100" class="auto-style4">
                密码：
            </td>
            <td width="160" class="auto-style4">

                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>

            </td>
        </tr>
       
        <tr>
            <td class="auto-style1">

                <asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click">登陆</asp:LinkButton>

            </td>
            <td width="160" class="auto-style2">

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Regist.aspx">注册</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td colspan="2" >

                <asp:CheckBox ID="cbMemory" runat="server" Checked="True" Text="30天内记住我" />

            </td>
        </tr>
    </table>
</asp:Content>

