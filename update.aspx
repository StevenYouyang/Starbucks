<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="productID" DataSourceID="changeProducts" Width="100%" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table cellpadding="4"cellspacing="4">
                <tr>
                    <td rowspan="6"width="170">
                        <asp:Image ID="mImage" runat="server" Height="160px" ImageUrl='<%# Eval("productImage") %>' Width="160px" />
                    </td>
                    <td vaign="middle"height="23"width="100">
                        商品名称：
                    </td>
                    <td>
                        <asp:Label ID="lblmProductName" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="middle"height="23"class="style1">
                        价格：
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("price") %>' TextMode="Number"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="请输入在1~500¥之间的价格" MaximumValue="500" MinimumValue="1"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                     <td valign="middle"height="23"class="style1" id="ddlSale">
                         <asp:DropDownList ID="ddlSale" runat="server" AutoPostBack="True">
                             <asp:ListItem>销售</asp:ListItem>
                             <asp:ListItem>下架</asp:ListItem>
                         </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                     <td valign="middle"height="23"class="style1">
                         <asp:Button ID="btnChange" runat="server" BackColor="#66FF33" CommandName="Change" CssClass="btnChange" Text="确认修改" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="changeProducts" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT * FROM [products] WHERE ([productID] = @productID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="productID" QueryStringField="productID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

