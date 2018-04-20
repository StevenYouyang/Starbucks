using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
   
            lblmName.Text = "您好，" + Session["mname"].ToString() + ",欢迎进入星巴克管理系统！";
            
     
    }
}
