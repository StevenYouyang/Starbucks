<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Regist.aspx.cs" Inherits="Regist" %>

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
                用户注册
            </td>
        </tr>
        <tr>
            <td align="right" width="100">
                8位用户名：
            </td>
            <td width="500">

                <asp:TextBox ID="txtuserID" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuserID" Display="Dynamic" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                姓名：
            </td>
            <td>

                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtusername" Display="Dynamic" ErrorMessage="请输入姓名"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                性别：
            </td>
            <td align="left">

                <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:RadioButtonList>

            </td>
        </tr>
        <tr>
            <td align="right">
                8位密码：
            </td>
            <td>

                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpwd" Display="Dynamic" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                确认密码：
            </td>
            <td>

                <asp:TextBox ID="txtpwd2" runat="server" TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpwd2" Display="Dynamic" ErrorMessage="请输入确认密码"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpwd" ControlToValidate="txtpwd2" Display="Dynamic" ErrorMessage="两次输入密码不一致"></asp:CompareValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                电话：
            </td>
            <td>

                <asp:TextBox ID="txttel" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td align="right">
                上传头像：
            </td>
            <td>

                <asp:FileUpload ID="fuuser" runat="server" onchange="CheckImgCss(this,'img');" />
                <asp:Label ID="lblUpFile" runat="server"></asp:Label>
                <br />
                <br />
                <div id="img" style="filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=<%= pic %>,sizing Method=scale);
                    width:150px;height:200px;">

                </div>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">

                <asp:Button ID="btnReg" runat="server" Text="注册" Width="100px" OnClick="btnReg_Click" />

            </td>       

        </tr>
    </table>
</asp:Content>

