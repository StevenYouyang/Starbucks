<%@ Page Title="" Language="C#" MasterPageFile="~/manage.master" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function $(o) {
            return document.getElementById(o);
        }
        function CheckImgCss(o, img) {
            if(!/\.((jpg)|(png))$/ig.test(o.value)){
              alert('只能上传jpg,png格式图片！');
                o.outerHTML=o.outerHTML;
               $(img).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src="";
            }
        else {
               $(img).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = o.value;
            }
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <br />
    <table align="center" cellspacing="3" cellpadding="3" border="1">
        <tr>
            <td align="center" colspan="2">
                商品上传
            </td>
        </tr>
        <tr>
            <td align="right" width="100">
                商品名称：
            </td>
            <td width="500">

                <asp:TextBox ID="txtmProductname" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmProductname" Display="Dynamic" ErrorMessage="商品名不能为空"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                型号：
            </td>
            <td>

                <asp:DropDownList ID="ddlmSize" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True">大</asp:ListItem>
                    <asp:ListItem>中</asp:ListItem>
                    <asp:ListItem>小</asp:ListItem>
                    <asp:ListItem>无</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td align="right">
                特点：
            </td>
            <td align="left">

                <asp:RadioButtonList ID="rblmHoc" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                    <asp:ListItem Selected="True">热</asp:ListItem>
                    <asp:ListItem>温</asp:ListItem>
                    <asp:ListItem>冷</asp:ListItem>
                    <asp:ListItem>冰</asp:ListItem>
                </asp:RadioButtonList>

            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style1">
                类别：
            </td>
            <td class="auto-style1">

                <asp:DropDownList ID="ddlmCate" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True">咖啡</asp:ListItem>
                    <asp:ListItem>茶</asp:ListItem>
                    <asp:ListItem>星冰乐</asp:ListItem>
                    <asp:ListItem>糕点</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td align="right">
                价格：
            </td>
            <td>

                <asp:TextBox ID="txtmPrice" runat="server" TextMode="Number">0</asp:TextBox>

                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="请输入正确范围的价格" MaximumValue="500" MinimumValue="1" ControlToValidate="txtmPrice"></asp:RangeValidator>

            </td>
        </tr>
        
        <tr>
            <td align="right">
                上传图片： </td>
            <td>

                <asp:FileUpload ID="fuProduct" runat="server" onchange="CheckImgCss(this,'img');" />
                <asp:Label ID="lblUpFile" runat="server"></asp:Label>
                <br />
                <br />
                <div id="img" style="filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=<%= pic%>,sizing Method=scale);
                    width:150px;height:200px;">

                </div>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">

                <asp:Button ID="btnUpload" runat="server" Text="确认上传" Width="100px" OnClick="btnUpload_Click"  />

            </td>       

        </tr>
    </table>
</asp:Content>

