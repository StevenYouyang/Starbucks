<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:LinkButton ID="lbTJ" runat="server" PostBackUrl="~/TJ.aspx">推荐</asp:LinkButton>
    
    <br />
    <table width="100%">
        <tr>
            <td align="right" valign="top" height="20" width="100">
                <asp:Label ID="Label2" runat="server" Text="请选择类别"></asp:Label>
            </td>
            <td>
                <asp:DataList ID="DataListcate" runat="server" DataSourceID="dscate" RepeatColumns="8" RepeatDirection="Horizontal" OnItemCommand="DataListcate_ItemCommand" OnSelectedIndexChanged="Page_Load" DataKeyField="cateID">
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="lbcategory" runat="server" CommandArgument='<%# Eval("cateID") %>' Text='<%# Eval("category") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <asp:DataList ID="DataListProducts" runat="server" DataKeyField="productID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal">
    <ItemTemplate>
        <table width="300">
            <tr>
                <td align="center">
                    <a href='<%#Eval("productID","productDetail.aspx?productID={0}") %>'target="_blank">
                    <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl='<%# Eval("productImage") %>' Width="160px" />
                        </a>
                </td>
            </tr>
            <tr>
                <td align="center" height="60"valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("productname") %>' NavigateUrl='<%# Eval("productID","productIDDetail.aspx?productID={0}") %>' Target="_blank"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("price", "{0:C}") %>'></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT * FROM [products] WHERE (([sale] = @sale) AND ([cateID] LIKE '%' + @cateID + '%'))">
    <SelectParameters>
        <asp:Parameter Name="sale" Type="String" DefaultValue="销售"/>
        <asp:Parameter Name="cateID" Type="String" ConvertEmptyStringToNull="false" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dscate" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT cateID,category FROM cate
UNION
SELECT'','全部'
ORDER BY cateID"></asp:SqlDataSource>
</asp:Content>

