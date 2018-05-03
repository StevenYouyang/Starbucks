<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCartSuccess.aspx.cs" Inherits="AddCartSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .btnContinueBuy
        {
            border-style:none;
            border-color:inherit;
            border-width:medium;
            background:url(Images/jixu.JPG)no-repeat left top;
        }
        .btnGoCart
        {
             border-style:none;
            border-color:inherit;
            border-width:medium;
            background:url(Images/jiesuan.JPG)no-repeat left top;
        }
        }
        .auto-style1 {
            width: 288px;
        }
        .auto-style2 {
            width: 293px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="background-image:url('Images/食品已加入托盘背景.jpg')">
        <table align="center" cellpadding="0" cellspacing="0"style="width:562px">
            <tr><td colspan="2"><table align="center"width="300px">
                <td  style="background-image:url('Images/chenggong.jpg');background-repeat:no-repeat;"
                    height="150" class="auto-style1">

                </td></table></td>
            </tr>
            <tr>
                <td align="center" height="60" class="auto-style2">

                    <asp:LinkButton ID="lbContinue" runat="server" CssClass="btnContinueBuy" Height="40px" Width="124px" OnClick="lbContinue_Click"></asp:LinkButton>

                </td>
                <td align="center">

                    <asp:LinkButton ID="lbGoShoppingCart" runat="server" CssClass="btnGoCart" Height="40px" Width="162px" OnClick="lbGoShoppingCart_Click"></asp:LinkButton>

                </td>
            </tr>
        </table>    

    </div>
</asp:Content>

