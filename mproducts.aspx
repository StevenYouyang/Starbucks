<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="mproducts.aspx.cs" Inherits="mproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:burlywood">
    <asp:DataList ID="DataListmProducts" runat="server" DataKeyField="productID" DataSourceID="dsmProducts" HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal">
    <ItemTemplate>
       <table width="300">
           <tr>
               <td align="center">
                   <a href='<%#Eval("productID","update.aspx?productID={0}") %>'target="_blank">
                   <asp:Image ID="Image2" runat="server" Height="160px" ImageUrl='<%# Eval("productImage") %>' Width="160px" />
                       </a>
               </td>
           </tr>
           <tr>
               <td align="center"height="60"valign="top">
                   <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("productname") %>' NavigateUrl='<%# Eval("productID","update.aspx?productID={0}") %>' Target="_blank"></asp:HyperLink>
               </td>
           </tr>
           <caption>
               <tr>
                   <td align="center" height="60" valign="top">
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("price","{0:c}") %>'></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td align="center">
                       <asp:Label ID="Label2" runat="server" Text='<%# Eval("sale") %>'></asp:Label>
                   </td>
               </tr>
           </caption>
       </table>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="dsmProducts" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
</asp:Content>

