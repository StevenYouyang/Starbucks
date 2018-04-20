<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function txtAmountkeyup() {
            document.getElementById("ct100_ContentPlaceHolder1_btnTemp").click();
        }
    </script>
   <style type="text/css">
       .hide
       {
           display:none;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table>
        <tr>
            <td colspan="2">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="productname" HeaderText="商品名称" />
                        <asp:BoundField DataField="price" DataFormatString="{0:N2}" HeaderText="价格" />
                        <asp:TemplateField HeaderText="数量">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount") %>' onkeyup="txtAmountkeyup()" TextMode="Number"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Je" HeaderText="金额" />
                        <asp:ButtonField CommandName="del" HeaderText="删除" Text="删除" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>

            </td>
        </tr>
        <tr>
            <td>

                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="清空托盘" OnClientClick="javascript:return confirm('确认要删除吗？')" />

            </td>
            <td align="right">
                <asp:Button ID="btnTemp" runat="server" Text="修改数量" OnClick="btnTemp_Click"  />

                <asp:Label ID="lblSum" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

            </td>
        </tr>
        <tr><td>&nbsp;<asp:Label ID="Label1" runat="server" Text="加入周计划："></asp:Label>
                        <asp:DropDownList ID="ddlweek" runat="server">
                            <asp:ListItem>星期一</asp:ListItem>
                            <asp:ListItem>星期二</asp:ListItem>
                            <asp:ListItem>星期三</asp:ListItem>
                            <asp:ListItem>星期四</asp:ListItem>
                            <asp:ListItem>星期五</asp:ListItem>
                            <asp:ListItem>星期六</asp:ListItem>
                            <asp:ListItem>星期日</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="Button1" runat="server" Text="添加" /></td>
           <td align="right" >
               <asp:Label ID="lblnocart" runat="server"></asp:Label>
               <asp:HyperLink ID="hlpay" runat="server" NavigateUrl="~/OrderInfo.aspx">
                   去结算
               </asp:HyperLink>
           </td>
        </tr>
    </table>
</asp:Content>

