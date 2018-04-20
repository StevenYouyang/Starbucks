<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="week.aspx.cs" Inherits="week" %>

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
    <table width="100%" >
        <tr><td width="55%"  > <table width="100%"><tr><td colspan="2" >
            <asp:Label ID="lblweek" runat="server" Text="每周计划：" ForeColor="#0066FF"></asp:Label>

                                          </td></tr>
            <tr><td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="星期一" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2" width="100%" >
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="weekorderID" OnItemDataBound="DataList1_ItemDataBound" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemCommand="DataList1_ItemCommand">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek1">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>

                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期一')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
            
            <tr><td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="星期二" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2">
                 <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" DataKeyField="weekorderID" OnItemDataBound="DataList2_ItemDataBound" CellPadding="4" ForeColor="#333333" OnItemCommand="DataList2_ItemCommand">
                     <AlternatingItemStyle BackColor="White" />
                     <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                     <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                     <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66FFFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek2">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                     <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期二')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
                
            
            <tr><td colspan="2">
                <asp:Label ID="Label3" runat="server" Text="星期三" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2">
                 <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" DataKeyField="weekorderID" OnItemDataBound="DataList3_ItemDataBound" CellPadding="4" ForeColor="#333333" OnItemCommand="DataList3_ItemCommand">
                     <AlternatingItemStyle BackColor="White" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <ItemStyle BackColor="#EFF3FB" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66FFFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek3">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek3" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                     <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address,time, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期三')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
                
           
            <tr><td colspan="2">
                <asp:Label ID="Label4" runat="server" Text="星期四" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2">
                 <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4" DataKeyField="weekorderID" OnItemDataBound="DataList4_ItemDataBound" CellPadding="4" ForeColor="#333333" OnItemCommand="DataList4_ItemCommand">
                     <AlternatingItemStyle BackColor="White" />
                     <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                     <ItemStyle BackColor="#E3EAEB" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66FFFF"></asp:Label>
                                   
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek4">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek4" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                     <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期四')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
                
           
            <tr><td colspan="2">
                <asp:Label ID="Label5" runat="server" Text="星期五" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2"> <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5" DataKeyField="weekorderID" OnItemDataBound="DataList5_ItemDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" OnItemCommand="DataList5_ItemCommand">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66FFFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek5">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek5" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期五')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
            
            <tr><td colspan="2">
                <asp:Label ID="Label6" runat="server" Text="星期六" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2"> <asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource6" DataKeyField="weekorderID" OnItemDataBound="DataList6_ItemDataBound" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnItemCommand="DataList6_ItemCommand1">
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66FFFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek6">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek6" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期六')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
            
            <tr><td colspan="2">
                <asp:Label ID="Label7" runat="server" Text="星期日" ForeColor="Red"></asp:Label>
                </td></tr>
            <tr><td colspan="2"> <asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource7" DataKeyField="weekorderID" OnItemDataBound="DataList7_ItemDataBound" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnItemCommand="DataList7_ItemCommand1">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F7DE" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2">
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  colspan="2">
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                <td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td>
                            </tr>
                            <tr><td colspan="4">
                                <asp:GridView ID="gv1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="orderItemID" DataSourceID="dsweek7">
                                    <Columns>
                                        <asp:BoundField DataField="productname" HeaderText="商品名称" SortExpression="productname" />
                                        <asp:ImageField DataImageUrlField="productImage" HeaderText="图片">
                                            <ControlStyle Height="60px" Width="60px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Amount" HeaderText="数量" SortExpression="Amount" />
                                        <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                                        <asp:BoundField DataField="Je" HeaderText="总金额" SortExpression="Je" />
                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="dsweek7" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </td></tr>
                            <tr><td colspan="2">
                                &nbsp;</td><td>
                                    <asp:LinkButton ID="lbclear1" runat="server" CommandName="clear" onClientClick="return confirm('删除 成功');">删除</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address,time, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (userID = @userID) AND (weekdate = '星期日')">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
           

                               </table>
            </td><td width="5%"></td>
            <td valign="top" width="40%" ><table valign="top" ><tr><td colspan="3"><asp:DropDownList ID="ddlweek" runat="server">
                <asp:ListItem>星期一</asp:ListItem>
                <asp:ListItem>星期二</asp:ListItem>
                <asp:ListItem>星期三</asp:ListItem>
                <asp:ListItem>星期四</asp:ListItem>
                <asp:ListItem>星期五</asp:ListItem>
                <asp:ListItem>星期六</asp:ListItem>
                <asp:ListItem>星期日</asp:ListItem>
            </asp:DropDownList></td></tr>
                <tr><td colspan="3" style="vertical-align:top" >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="productname1" HeaderText="商品名称" />
                        <asp:BoundField DataField="price1" DataFormatString="{0:N2}" HeaderText="价格" />
                        <asp:TemplateField HeaderText="数量">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount1") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtamount1" runat="server" Text='<%# Bind("Amount1") %>' onkeyup="txtAmountkeyup()" TextMode="Number"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Je1" DataFormatString="{0:N2}" HeaderText="金额" />
                        <asp:ButtonField CommandName="del" Text="删除" />
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
            </td></tr>
                 <tr>
            <td >
                <asp:Button ID="btnclear1" runat="server" Text="清空" OnClick="btnclear1_Click" OnClientClick="javascript:return confirm('确认要删除吗？')"/>
            </td><td>
                <asp:Button ID="btnchange1" runat="server" Text="更改数量" OnClick="btnchange1_Click" />
                <asp:Label ID="lblsum1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td><td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">确认</asp:LinkButton>
            </td>
        </tr>
                <tr><td></td><td></td>
            <td colspan="2" >
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Products.aspx">继续添加</asp:HyperLink>
            </td><td>
                &nbsp;</td>
        </tr> </table></td>
            
        
            
        
       
        
       </tr>
    </table>
</asp:Content>

