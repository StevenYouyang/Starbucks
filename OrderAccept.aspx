<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="OrderAccept.aspx.cs" Inherits="OrderAccept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table width="100%">
          <tr><td width="48%"><table width="100%"><tr><td > <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="Red" Text="待接收订单："></asp:Label>

                                     </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="orderID" OnItemDataBound="DataList1_ItemDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">
                       <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                       <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                       <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                       <ItemTemplate>
             
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    
                </tr>

                <tr><td >
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink></td>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                  
                </tr>
                <tr> <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label></td>
                    <td >
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label></td></tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                        
            <asp:Button ID="btnAccept" runat="server" Text="接单" CommandName="accept" onClientClick="return confirm('确认收货成功');" />
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe FROM orders WHERE (accept='待接单') ORDER BY orderDate DESC"></asp:SqlDataSource>
                  </td></tr>
              <tr><td>
                  <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="#FF9900" Text="待分配订单："></asp:Label>
                  </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList2" runat="server" DataKeyField="orderID" DataSourceID="SqlDataSource2" OnItemDataBound="DataList2_ItemDataBound" CellPadding="4" ForeColor="#333333">
                      <AlternatingItemStyle BackColor="White" />
                      <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                      <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                      <ItemTemplate>
             
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    
                </tr>

                <tr><td >
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink></td>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                  
                </tr>
                <tr> <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label></td>
                    <td >
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label></td></tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                        
            <asp:Button ID="btnAccept" runat="server" Text="配单" CommandName="accept" onClientClick="return confirm('确认收货成功');" />
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe FROM orders WHERE (accept='待配单') ORDER BY orderDate DESC"></asp:SqlDataSource>
                  
                  </td></tr>
              <tr><td>
                  <asp:Label ID="Label3" runat="server" Font-Size="Large" ForeColor="Lime" Text="配送中订单："></asp:Label>
                  </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList4" runat="server" DataKeyField="orderID" DataSourceID="SqlDataSource3" OnItemDataBound="DataList4_ItemDataBound" CellPadding="4" ForeColor="#333333">
                      <AlternatingItemStyle BackColor="White" />
                      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <ItemStyle BackColor="#EFF3FB" />
                      <ItemTemplate>
             
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    
                </tr>

                <tr><td >
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink></td>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                  
                </tr>
                <tr> <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label></td>
                    <td >
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label></td></tr>
                <tr><td>
                    外卖员：
                     
                    <asp:Label ID="lblwmyname" runat="server" Text='<%# Eval("WMYID") %>'></asp:Label>
                    </td><td>外卖员电话：

                          
                        <asp:Label ID="lbwmytel" runat="server" Text='<%# Eval("WMYtel") %>'></asp:Label>

                         </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                        
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT 
orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe ,(select WMYname AS Expr1 from WMY where WMYID=orders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=orders.WMYID) AS WMYtel FROM orders WHERE (accept='配送中') ORDER BY orderDate DESC"></asp:SqlDataSource>
                  </td></tr>
              <tr><td>
                  <asp:Label ID="Label4" runat="server" Font-Size="Large" ForeColor="Blue" Text="已完成订单："></asp:Label>
                  </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList5" runat="server" DataKeyField="orderID" DataSourceID="SqlDataSource4" OnItemDataBound="DataList5_ItemDataBound" CellPadding="3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                      <AlternatingItemStyle BackColor="#F7F7F7" />
                      <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                      <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                      <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                      <ItemTemplate>
             
            <table>
                <tr>
                    <td>
                        日期：
                     
                        <asp:Label ID="OrderDateLable" runat="server" Text='<%# Convert.ToDateTime(Eval("orderDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </td>
                    <td>
                        订单号码：<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("orderID","OrderByID.aspx?orderID={0}") %>' Target="_blank" Text='<%# Eval("orderID") %>'></asp:HyperLink>
                    </td>
                    
                </tr>

                <tr><td >
                        送餐地址：<asp:HyperLink ID="addressLable" runat="server" Text='<%# Eval("address") %>'></asp:HyperLink></td>
                    <td>
                        联系人：
                     
                        <asp:Label ID="LXELable" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                    </td>
                  
                </tr>
                <tr> <td>
                        电话号码：<asp:Label ID="telLable" runat="server" Text='<%# Eval("dztel") %>'></asp:Label></td>
                    <td >
                        本单总金额：<asp:Label ID="SumJeLable" runat="server" Text='<%# Eval("SumJe") %>'></asp:Label></td></tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                        
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT 
orderID, userID, LXR, dztel, address, orderDate, accept, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = orders.orderID)) AS SumJe ,(select WMYname AS Expr1 from WMY where WMYID=orders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=orders.WMYID) AS WMYtel FROM orders WHERE (accept='已完成') ORDER BY orderDate DESC"></asp:SqlDataSource>
                  </td></tr>
                              </table> </td>
             
             <td  width="4%"></td><td width="48%" valign="top"><table width="100%" valign="top"><tr><td valign="top"> 今天是
              <asp:Label ID="lblday" runat="server" Text="Label" Font-Size="Large" ForeColor="#0066FF"></asp:Label>,以下是今日周计划订单：</td></tr>
                 <tr><td>
                     <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource5" DataKeyField="weekorderID" OnItemDataBound="DataList3_ItemDataBound" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnItemCommand="DataList1_ItemCommand">
                    <AlternatingItemStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td >
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  >
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                
                            </tr>
                            <tr><td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td></tr>
                            <tr><td colspan="2">
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

                                    <asp:LinkButton ID="lbaccept" runat="server" CommandName="accept" onClientClick="return confirm('删除 成功');">接单</asp:LinkButton>
                                </td></tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT weekorderID, userID, LXR, dztel, address, time, (SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe FROM weekorders WHERE (weekdate = @weekdate) and accept='待接单' order by time">
                    <SelectParameters>
                        <asp:SessionParameter Name="weekdate" SessionField="weekdate" />
                    </SelectParameters>
                </asp:SqlDataSource>
                     </td></tr>
                 <tr><td>
                     <asp:Label ID="Label14" runat="server" Text="待配单：" Font-Size="Large" ForeColor="Red"></asp:Label>
                     </td></tr>
                  <tr><td>
                  <asp:DataList ID="DataList6" runat="server" DataKeyField="weekorderID" DataSourceID="SqlDataSource6" OnItemDataBound="DataList6_ItemDataBound" CellPadding="4" ForeColor="#333333">
                      <AlternatingItemStyle BackColor="White" />
                      <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                      <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                      <ItemTemplate>
             
            <table>
               <tr>
                                <td >
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  >
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                
                            </tr>
                            <tr><td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                       <asp:SqlDataSource ID="dsweek1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        
            <asp:Button ID="btnAccept" runat="server" Text="配单" CommandName="accept" onClientClick="return confirm('确认收货成功');" />
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT 
weekorderID, userID, LXR, dztel, address, weekdate,accept, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe ,(select WMYname AS Expr1 from WMY where WMYID=weekorders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=weekorders.WMYID) AS WMYtel FROM weekorders WHERE (accept='待配单' and weekdate=@weekdate) ORDER BY time DESC">
                      <SelectParameters>
                          <asp:SessionParameter Name="weekdate" SessionField="weekdate" />
                      </SelectParameters>
                      </asp:SqlDataSource>
                  
                  </td></tr>
              <tr><td>
                  <asp:Label ID="Label5" runat="server" Font-Size="Large" ForeColor="Lime" Text="配送中："></asp:Label>
                  </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList7" runat="server" DataKeyField="weekorderID" DataSourceID="SqlDataSource7" OnItemDataBound="DataList7_ItemDataBound" CellPadding="4" ForeColor="#333333">
                      <AlternatingItemStyle BackColor="White" />
                      <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <ItemStyle BackColor="#EFF3FB" />
                      <ItemTemplate>
             
            <table>
               <tr>
                                <td >
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  >
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                
                            </tr>
                            <tr><td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td></tr>
                <tr><td>
                    外卖员：
                     
                    <asp:Label ID="lblwmyname" runat="server" Text='<%# Eval("WMYID") %>'></asp:Label>
                    </td><td>外卖员电话：

                          
                        <asp:Label ID="lbwmytel" runat="server" Text='<%# Eval("WMYtel") %>'></asp:Label>

                         </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                       <asp:SqlDataSource ID="dsweek1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT 
weekorderID, userID, LXR, dztel, address, weekdate,accept, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe ,(select WMYname AS Expr1 from WMY where WMYID=weekorders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=weekorders.WMYID) AS WMYtel FROM weekorders WHERE (accept='配送中' and weekdate=@weekdate) ORDER BY time DESC">
                      <SelectParameters>
                          <asp:SessionParameter Name="weekdate" SessionField="weekdate" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  </td></tr>
              <tr><td>
                  <asp:Label ID="Label6" runat="server" Font-Size="Large" ForeColor="Blue" Text="已完成："></asp:Label>
                  </td></tr>
              <tr><td>
                  <asp:DataList ID="DataList8" runat="server" DataKeyField="weekorderID" DataSourceID="SqlDataSource8" OnItemDataBound="DataList8_ItemDataBound" CellPadding="3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                      <AlternatingItemStyle BackColor="#F7F7F7" />
                      <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                      <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                      <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                      <ItemTemplate>
             
            <table>
                <tr>
                                <td >
                                    订单号码：<asp:Label ID="Label8" runat="server" Text='<%# Eval("weekorderID") %>' ForeColor="#66CCFF"></asp:Label>
                                    
                                </td><td  >
                                    送货地址：
                                      
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                     </td>
                            </tr>
                            <tr><td>
                                联系人：
                                 
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td><td>送餐时间：<asp:Label ID="Label13" runat="server" ForeColor="Blue" Text='<%# Eval("time") %>'></asp:Label>
                                </td>
                                
                            </tr>
                            <tr><td>
                                    电话：
                                 
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("dztel") %>' ForeColor="Blue"></asp:Label>
                                </td>
                                <td>
                                    本单总金额：<asp:Label ID="Label12" runat="server" Text='<%# Eval("sumJe") %>'></asp:Label>
&nbsp;</td></tr>
                <tr><td>
                    订单状态：
                     
                    <asp:Label ID="lblAccept" runat="server" Text='<%# Eval("accept") %>'></asp:Label>
                    </td></tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderWidth="1px" DataKeyNames="orderItemID" DataSourceID="dsOrderItems2" >
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
                        <asp:SqlDataSource ID="dsweek1" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT orderItems.orderItemID, orderItems.orderID, orderItems.productID, orderItems.Amount, orderItems.price, orderItems.Amount * orderItems.price AS Je, products.productname + '(' + products.hoc + ')' AS productname, products.productImage FROM orderItems INNER JOIN products ON orderItems.productID = products.productID WHERE (orderItems.orderID = @weekorderID)">
                                    <SelectParameters>
                                        <asp:Parameter Name="weekorderID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        
                    </td>
                </tr>
            </table>
            <br />
            
            <br />
        </ItemTemplate>
                       <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                  </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT 
weekorderID, userID, LXR, dztel, address, weekdate,accept, time,(SELECT SUM(price * Amount) AS Expr1 FROM orderItems WHERE (orderID = weekorders.weekorderID)) AS SumJe ,(select WMYname AS Expr1 from WMY where WMYID=weekorders.WMYID) as WMYname,(select WMYtel AS Expr1 from WMY where WMYID=weekorders.WMYID) AS WMYtel FROM weekorders WHERE (accept='已完成' and weekdate=@weekdate) ORDER BY time DESC">
                      <SelectParameters>
                          <asp:SessionParameter Name="weekdate" SessionField="weekdate" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  </td></tr>
                                                   </table>
            </td></tr>
      </table>
</asp:Content>

