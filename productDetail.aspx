<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="productDetail.aspx.cs" Inherits="productDetail" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="productID" DataSourceID="SqlDataSource1" Width="100%" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
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
                    <td align="left" >

                        <asp:LinkButton ID="btnBuy" runat="server" CommandName="Buy" CssClass="btnBuy" Height="30px"  Width="135px">加入托盘中</asp:LinkButton>

                    </td><td>&nbsp;<asp:Button ID="Button1" runat="server" Text="加入周计划" CommandName="week" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT * FROM [products] WHERE ([productID] = @productID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="productID" QueryStringField="productID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table ><tr><td align="center" width="300">
    <asp:Label ID="Label4" runat="server" Font-Italic="False" Font-Size="Large" ForeColor="#0066FF" Text="买家评论:"></asp:Label></td></tr>
   </table>
    <asp:DataList ID="DataList2" runat="server" DataKeyField="CID" DataSourceID="SqlDataSource2" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        
        <ItemTemplate>
            <br />
            <table cellpadding="2" cellspacing="2">
                <tr><td colspan="2">******************************************************************************</td></tr>
                <tr>
                   
                    <td  valign="left"    height="23" width="300">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>' ForeColor="#3366FF"></asp:Label>
                    </td>
                    <td valign="left"  width="300">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cdate", "{0}") %>'></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2" width="600">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("comment") %>' BackColor="#FFCC66"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT users.username, users.userImage, comments.comment, comments.CID,comments.Cdate, comments.productID FROM users INNER JOIN comments ON users.userID = comments.userID WHERE (comments.productID = @productID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="productID" QueryStringField="productID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

