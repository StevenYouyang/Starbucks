<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="count.aspx.cs" Inherits="count" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="70%">
        <tr>
            <td >
                <asp:Label ID="Label3" runat="server" Text="请选择开始日期：（默认最近100天）"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="date1" runat="server" onClick="WdatePicker()"></asp:TextBox>
            </td>
            <td >
                <asp:Label ID="Label4" runat="server" Text="请选择结束日期："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="date2" runat="server" onClick="WdatePicker()"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="Aqua" Text="查询" />
            </td>
        </tr>
    </table>
    <table width="100%">
        
        <tr><td width="45%"><table width="100%"><tr><td>
            <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="Blue" Text="商品销量统计："></asp:Label>
            </td></tr><tr><td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="productID" HeaderText="商品编号" SortExpression="productID" />
                        <asp:BoundField DataField="name" HeaderText="商品名称" SortExpression="name" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="图片">
                            <ControlStyle Height="60px" Width="60px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:ImageField>
                        <asp:BoundField DataField="sale" HeaderText="销售状态" SortExpression="sale">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="price" DataFormatString="{0:N2}" HeaderText="单价" SortExpression="price">
                        <ControlStyle ForeColor="#33CC33" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cnt" HeaderText="销售数量" SortExpression="cnt">
                        <ControlStyle ForeColor="#0066FF" />
                        <HeaderStyle ForeColor="Blue" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Blue" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cntt" DataFormatString="{0:N2}" HeaderText="销售金额" SortExpression="cntt">
                        <ControlStyle ForeColor="Red" />
                        <HeaderStyle ForeColor="Red" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Red" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="select 
productID,SUM(CAST(amount as int)) as cnt,(select productImage from products where productID=orderItems.productID) as Image,(select productname from products where productID=orderItems.productID) as name,SUM(CAST(amount*price as int)) as cntt,price,(select sale from products where productID=orderItems.productID) as sale
from orderItems 
where(  convert(varchar(10),( select orderDate from orders where orderID=orderItems.orderID) ,120)&gt;=@date1
	and convert(varchar(10),(select orderDate from orders where orderID=orderItems.orderID), 120)&lt;=@date2)
or(
convert(varchar(10),( select setdate from weekorders where weekorderID=orderItems.orderID) ,120)&gt;=@date1
	and convert(varchar(10),(select setdate from weekorders where weekorderID=orderItems.orderID), 120)&lt;=@date2)
group by productID,price
order by cnt desc,cntt desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="date1" Name="date1" PropertyName="Text" />
                        <asp:ControlParameter ControlID="date2" Name="date2" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr></table></td><td width="5%"></td>
                <td valign="top"><table width="100%"><tr><td>输入商品编号来查询：<asp:TextBox ID="tb1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" BackColor="Lime" CommandName="search" OnClick="Button2_Click" Text="查询" />
                    </td><td>&nbsp;</td></tr>
                    <tr><td colspan="2">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnDataBound="GridView2_DataBound">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="商品编号" SortExpression="ID">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="商品名称" SortExpression="name">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:ImageField DataImageUrlField="Image" HeaderText="图片">
                                    <ControlStyle Height="80px" Width="80px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ImageField>
                                <asp:BoundField DataField="sale" HeaderText="销售状态" SortExpression="sale">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="price" DataFormatString="{0:N2}" HeaderText="单价" SortExpression="price" />
                                <asp:BoundField DataField="cnt" HeaderText="销售数量" SortExpression="cnt">
                                <HeaderStyle ForeColor="Blue" />
                                <ItemStyle ForeColor="Blue" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cntt" DataFormatString="{0:N2}" HeaderText="销售金额" SortExpression="cntt">
                                <HeaderStyle ForeColor="Red" />
                                <ItemStyle ForeColor="Red" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="select (select price from products where productID=@productID) as price,@productID as ID,
SUM(case when productID=@productID then CAST(amount as int) else 0 end) as cnt,(select productImage from products where productID=@productID) as Image,(select productname from products where productID=@productID) as name,SUM(case when productID=@productID then  CAST(amount*price as int) else 0 end) as cntt,(select sale from products where productID=@productID) as sale
from orderItems 
where productID=@productID and(  convert(varchar(10),( select orderDate from orders where orderID=orderItems.orderID) ,120)&gt;=@date1
	and convert(varchar(10),(select orderDate from orders where orderID=orderItems.orderID), 120)&lt;=@date2)
or(
convert(varchar(10),( select setdate from weekorders where weekorderID=orderItems.orderID) ,120)&gt;=@date1
	and convert(varchar(10),(select setdate from weekorders where weekorderID=orderItems.orderID), 120)&lt;=@date2) ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="tb1" Name="productID" PropertyName="Text" />
                                <asp:ControlParameter ControlID="date1" Name="date1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="date2" Name="date2" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </td></tr>
                                 </table></td></tr>
    </table>
</asp:Content>

