<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="weekinfo.aspx.cs" Inherits="weekinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table>
        <tr>
            <td style="width:100px">
                联系电话
            </td>
            <td style="width:100px">

                <asp:TextBox ID="txttel" runat="server"></asp:TextBox>

            </td>
            <td rowspan="11" width="100" ></td>
            <td rowspan="7" colspan="2" align="top">
                
                <asp:DataList ID="DataList1" runat="server" DataKeyField="dzID" DataSourceID="dsdz" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                       
                        <table>
                            <tr>
                                <td colspan="2">
                                    <font color="blue"> 地址：</font>
                                 
                                    <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr><td><font color="blue"> 联系人：</font><asp:Label ID="lblLXR" runat="server" Text='<%# Eval("LXR") %>'></asp:Label>
                                </td>
                                <td><font color="blue"> 电话：</font><asp:Label ID="lblTel" runat="server" Text='<%# Eval("dztel") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr><td>
                                <asp:Button ID="Button1" runat="server" CommandName="usethis" Text="使用此地址" BackColor="#6699FF" />
                                </td></tr>
                            <tr><td colspan="2">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td></tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="dsdz" runat="server" ConnectionString="<%$ ConnectionStrings:StarbucksConnectionString2 %>" SelectCommand="SELECT * FROM [dz] WHERE ([userID] = @userID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="userID" SessionField="userID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr height="30px">
            <td style="width:100px">
                送货地址
            </td>
            <td style="width:100px">

                <asp:TextBox ID="txtaddress" runat="server" Height="30px"></asp:TextBox>

            </td>
        </tr>
        <tr height="30px">
            <td style="width:100px">
                收货人
            </td>
            <td style="width:100px">

                <asp:TextBox ID="txtLXR" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr><td>
            <asp:DropDownList ID="ddlh" runat="server">
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            时<td>
                <asp:DropDownList ID="ddlm" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
                分</td></td></tr>
    
        <tr>
            <td colspan="2" >

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="productname1" HeaderText="食品名称" />
                        <asp:BoundField DataField="price1" DataFormatString="{0:N2}" HeaderText="价格" />
                        <asp:BoundField DataField="Amount1" HeaderText="数量" />
                        <asp:BoundField DataField="Je1" DataFormatString="{0:N2}" HeaderText="金额" />
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

            </td>
        </tr>
       
        <tr>
            <td align="right" colspan="2">

                <asp:Label ID="lblSum" runat="server" ForeColor="Red" Text="Label"></asp:Label>

            </td>

        </tr>
         <tr>
            <td align="right" colspan="2">

                <asp:LinkButton ID="lbOK" runat="server" OnClick="lbOK_Click" onClientClick="return confirm('添加成功，明日起生效！');">加入周计划</asp:LinkButton>

            </td>
        </tr>
        <tr><td rowspan="4" colspan="2"></td> </tr>
         <tr height="30px"><td class="auto-style1"><font color="red">地址：</font><td class="auto-style1">
            <asp:TextBox ID="txtnewaddress" runat="server"></asp:TextBox>
            </td></td></tr>
        <tr height="30px"><td><font color="red">联系人：</font><td>
            <asp:TextBox ID="txtnewLXR" runat="server"></asp:TextBox>
            </td></td></tr>
        <tr height="30px"><td><font color="red">电话：</font><td>
            <asp:TextBox ID="txtnewtel" runat="server"></asp:TextBox>
            </td></td></tr>
        <tr height="30px"><td colspan="3">
                &nbsp;</td><td colspan="2">
                <asp:Button ID="Button2" runat="server" Text="新增地址" BackColor="Lime" OnClick="Button2_Click" onClientClick="return confirm('新增地址成功');" />
            </td></tr>
        </table>
</asp:Content>
