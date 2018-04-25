using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class count : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CurrentUrl = HttpContext.Current.Request.Url.PathAndQuery;
        if (!IsPostBack)
        {
            date1.Text = DateTime.Today.AddDays(-100).ToString("yyyy-MM-dd");
            date2.Text = DateTime.Today.ToString("yyyy-MM-dd");
        }
        //if (GridView1.Rows.Count==null)
        //{
        //    Label1.Text = "";
        //}
        
    }

    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      
        GridView2.DataBind();
    }
}