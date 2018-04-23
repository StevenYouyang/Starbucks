<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Myorder.aspx.cs" Inherits="Myorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr><td>
            <asp:Label ID="lblWWC" runat="server" Font-Size="Larger" ForeColor="Red" Text="未完成订单："></asp:Label>
    </td>
            </tr>
        <tr>
    <asp:DataList ID="DataList2" runat="server" DataSourceID="dsOrders2" DataKeyField="OrderID" OnItemDataBound="DataList2_ItemDataBound" OnItemCommand="DataList2_ItemCommand">
         <ItemTemplate>
             
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd hh:mm:ss") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    <td align="right">
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink>
&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                    <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
&nbsp;</td>
                    <td align="right">
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label>
&nbsp;</td>
                </tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td><td>外卖员：<asp:Label ID="Label3" runat="server" Text='<%# Eval("WMYname") %>'></asp:Label>
                    </td><td align="right">外卖员电话：<asp:Label ID="Label4" runat="server" Text='<%# Eval("WMYtel") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="3">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" Width="920px">
                            <Columns>
                                <asp:BoundField DataField="productname" HeaderText="食品名称" SortExpression="productname" />
                                <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                    <ControlStyle Height="60px" Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ImageField>
                                <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                <asp:BoundField DataField="Je" HeaderText="金额" SortExpression="Je" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOrderItems2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @orderID)">
                            <SelectParameters>
                                <asp:Parameter Name="orderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsOrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @orderID)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="orderID" Name="orderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
            <asp:Button ID="btnAccept" runat="server" Text="确认收货" CommandName="accept" onClientClick="return confirm('确认收货成功');" />
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
    </asp:DataList>
            </tr>
        <tr><td><asp:DataList ID="DataList3" runat="server" DataSourceID="dsweekorders1" DataKeyField="weekorderID" OnItemDataBound="DataList3_ItemDataBound" OnItemCommand="DataList3_ItemCommand">
         <ItemTemplate>
             
            <table>
                <tr>
                    <td class="auto-style1">
                        时间：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Eval("weekdate") %>'></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("time") %>'></asp:Label>
                    </td>
                    <td class="auto-style1">
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("weekorderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("weekorderID") %>'></asp:HyperLink>
                    </td>
                    <td align="right" class="auto-style1">
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink>
&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                    <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
&nbsp;</td>
                    <td align="right">
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label>
&nbsp;</td>
                </tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td><td>外卖员：<asp:Label ID="Label3" runat="server" Text='<%# Eval("WMYname") %>'></asp:Label>
                    </td><td align="right">外卖员电话：<asp:Label ID="Label4" runat="server" Text='<%# Eval("WMYtel") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="3">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" Width="920px">
                            <Columns>
                                <asp:BoundField DataField="productname" HeaderText="食品名称" SortExpression="productname" />
                                <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                    <ControlStyle Height="60px" Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ImageField>
                                <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                <asp:BoundField DataField="Je" HeaderText="金额" SortExpression="Je" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOrderItems2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                            <SelectParameters>
                                <asp:Parameter Name="weekorderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsOrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @orderID)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="orderID" Name="orderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
            <asp:Button ID="btnAccept" runat="server" Text="确认收货" CommandName="accept" onClientClick="return confirm('确认收货成功');" />
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
    </asp:DataList>
            <asp:SqlDataSource ID="dsweekorders1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time,weekdate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe,(select WMYname AS Expr1 from WMY where WMYID=weekorders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=weekorders.WMYID) AS WMYtel FROM weekorders WHERE (userID = @userID) AND (accept &lt;&gt; '已完成') ORDER BY weekdate DESC,time DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td></tr>
        <tr><td>
            <asp:Label ID="lblYWC" runat="server" Font-Size="Larger" ForeColor="#0066FF" Text="已完成订单："></asp:Label>
            </td></tr>
        <tr>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="orderID" DataSourceID="dsOrders" OnItemDataBound="DataList1_ItemDataBound" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
        <AlternatingItemStyle BackColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <ItemTemplate>
          
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd hh:mm:ss") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    <td align="right">
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink>
&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                    <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
&nbsp;</td>
                    <td align="right">
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label>
&nbsp;</td>
                </tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td><td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td><td>&nbsp;</td></tr>
                <tr>
                    <td colspan="3">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems" Width="920px">
                            <Columns>
                                <asp:BoundField DataField="productname" HeaderText="食品名称" SortExpression="productname" />
                                <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                    <ControlStyle Height="60px" Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ImageField>
                                <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                <asp:BoundField DataField="Je" HeaderText="金额" SortExpression="Je" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @orderID)">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="orderID" Name="orderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("orderID","comments.aspx?orderID={0}") %>'>去评价</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>

        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />

    </asp:DataList>
            </tr>
        <tr><td> <asp:DataList ID="DataList4" runat="server" DataKeyField="weekorderID" DataSourceID="dsweekorders2" OnItemDataBound="DataList4_ItemDataBound" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" >
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <ItemTemplate>
          
            <table>
                <tr>
                    <td>
                        时间：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Eval("weekdate") %>'></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("time") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("weekorderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("weekorderID") %>'></asp:HyperLink>
                    </td>
                    <td align="right">
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink>
&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                    <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
&nbsp;</td>
                    <td align="right">
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label>
&nbsp;</td>
                </tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td><td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td><td>&nbsp;</td></tr>
                <tr>
                    <td colspan="3">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems" Width="920px">
                            <Columns>
                                <asp:BoundField DataField="productname" HeaderText="食品名称" SortExpression="productname" />
                                <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                    <ControlStyle Height="60px" Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:ImageField>
                                <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                <asp:BoundField DataField="Je" HeaderText="金额" SortExpression="Je" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsOrderItems" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                            <SelectParameters>
                                <asp:Parameter Name="weekorderID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("weekorderID", "comments.aspx?orderID={0}") %>'>去评价</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>

            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />

    </asp:DataList>
            <asp:SqlDataSource ID="dsweekorders2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, weekdate,time, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (accept = '已完成') ORDER BY weekdate DESC,time DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td></tr>
        </table>
    <asp:SqlDataSource ID="dsOrders2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe,(select WMYname AS Expr1 from WMY where WMYID=orders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=orders.WMYID) AS WMYtel FROM orders WHERE (userID = @userID) AND (accept &lt;&gt; '已完成') ORDER BY orderDate DESC">
        <SelectParameters>
            <asp:SessionParameter Name="userID" SessionField="userID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString %>" SelectCommand="SELECT orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe FROM orders WHERE (userID = @userID) AND (accept = '已完成') ORDER BY orderDate DESC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="userID" SessionField="userID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</asp:Content>

