<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="comments.aspx.cs" Inherits="comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="orderItemID" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
          
            <table cellpadding="6" cellspacing="6">
                <tr>
                    <td width="70px" height="70px">
                        <asp:Image ID="Image1" runat="server" Height="65px" ImageUrl='<%# Eval("productImage") %>' Width="65px" />
                    </td><td>
                        <asp:Label ID="lblname" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("productID") %>' Visible="False"></asp:Label>
                        <asp:Label ID="lblorderItemID" runat="server" Text='<%# Eval("orderItemID") %>' Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:TextBox ID="tbC" runat="server" Height="100px" Width="700px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" CommandName="comment" Text="提交评价" onClientClick="return confirm('提交评价成功');" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.ifcomment, orderItems.productID, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @orderID) AND (orderItems.ifcomment = 0)">
        <SelectParameters>
            <asp:QueryStringParameter Name="orderID" QueryStringField="orderID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

