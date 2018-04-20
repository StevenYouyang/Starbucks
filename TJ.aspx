<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TJ.aspx.cs" Inherits="TJ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .btnBuy
        {
            border-style:none;
            border-color:inherit;
            border-width:medium;
            background:url(Images/AddCart4.jpg) no-repeat left top;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblIfNull" runat="server"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
             <table cellpadding="6" cellspacing="6">
                <tr>
                    <td rowspan="5" width="170">

                        <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl='<%# Eval("productImage") %>' Width="160px" />

                    </td>
                    <td valign="middle" height="23" width="100">
                        食品名称：

                    </td>
                    <td width="490">

                        <asp:Label ID="lbproductname" runat="server" Text='<%# Eval("productname")+"("+Eval("hoc")+")" %>'></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td valign="middle" class="auto-style1">
                        食品编号：
                    </td>
                    <td class="auto-style1">

                        <asp:Label ID="lbproductID" runat="server" Text='<%# Eval("productID") %>'></asp:Label>

                    </td>
                </tr>
                 <tr>
                    <td valign="middle" height="23" class="style1">
                        价格：
                    </td>
                    <td>

                        <asp:Label ID="lbprice" runat="server" Text='<%# Eval("price","{0:C}") %>'></asp:Label>

                    </td>
                     </tr>
                 <tr>
                    <td valign="middle" height="23" class="style1">
                        购买数量：
                    </td>
                    <td>

                        <asp:TextBox ID="txtAmount" runat="server">1</asp:TextBox>

                    </td>
                     </tr>
                <tr>
                    <td align="left" colspan="2" class="auto-style2">

                        <asp:LinkButton ID="btnBuy" runat="server" CommandName="Buy" CssClass="btnBuy" Height="30px"  Width="135px">加入托盘中</asp:LinkButton>

                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

