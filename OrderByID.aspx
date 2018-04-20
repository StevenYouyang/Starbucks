<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderByID.aspx.cs" Inherits="OrderByID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 900px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="日期："></asp:Label>
                        <asp:Label ID="orderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="订单号码："></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("orderID") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="送餐地址："></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="联系人："></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="电话号码："></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="食品总金额："></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Je") %>'></asp:Label>
                    </td>
                </tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td></tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="productname" HeaderText="商品名称" />
            <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                <ControlStyle Height="60px" Width="60px" />
            </asp:ImageField>
            <asp:BoundField DataField="Amount" HeaderText="数量" />
            <asp:BoundField DataField="price" HeaderText="单价" />
            <asp:BoundField DataField="Je" HeaderText="金额" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
<asp:Label ID="Label12" runat="server" Text="订单已提交，欢迎再次光临！~"></asp:Label>
</asp:Content>

