using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userID"]!=null)
        {
            Menu1.Items[4].Text = "注销";
            lblUserName.Text = "您好，" + Session["username"].ToString() + ",欢迎关顾星巴克，快去选择您喜欢的口味吧~！";
            Menu1.Items[3].Text = "";
            Menu1.Items[5].Text = "";
           
        }
        else
        {
            Menu1.Items[1].Text = "";
            Menu1.Items[2].Text = "";
            Menu1.Items[4].Text = "顾客登陆";
            lblUserName.Text = "";
            lblplan.Text = "";
        }
        //===================================
      
        
        //====================================================
    }
}
