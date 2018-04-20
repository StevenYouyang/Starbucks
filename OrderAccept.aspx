<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="OrderAccept.aspx.cs" Inherits="OrderAccept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table width="100%">
          <tr><td width="45%">
              <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="Red" Text="待接收订单："></asp:Label>
              </td><td rowspan="2" width="10%"></td><td width="45%">
                  今天是
              <asp:Label ID="lblday" runat="server" Text="Label" Font-Size="Large" ForeColor="#0066FF"></asp:Label>
              </td></tr>
          <tr><td>
              <asp:DataList ID="DataList1" runat="server">
              </asp:DataList>
              </td><td>
                  <asp:DataList ID="DataList2" runat="server">
                  </asp:DataList>
              </td></tr>
          <tr><td colspan="3">
              <asp:DataList ID="DataList3" runat="server">
              </asp:DataList>
              </td></tr>
      </table>
</asp:Content>

