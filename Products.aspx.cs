using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (!IsPostBack)
            {
                ShowAllcate();
            }
        }
        {
            if (Session["userID"] != null)
            {
                lbTJ.Text = "点击这里，可以查看咖啡师对您口味的推荐哦~";
            }
            else
            {
                lbTJ.Text = "";
            }
        }


    }
    private void ShowAllcate()
    {
        for(int i=0;i<DataListcate.Items.Count;i++)
        {
            LinkButton x = (LinkButton)DataListcate.Items[i].FindControl("lbcategory");

            x.BackColor = System.Drawing.Color.White;
        }
        LinkButton all = (LinkButton)DataListcate.Items[0].FindControl("lbcategory");

        all.BackColor = System.Drawing.Color.Aqua;

        SqlDataSource1.SelectParameters["cateID"].DefaultValue = "";

    }

    protected void DataListcate_ItemCommand(object source, DataListCommandEventArgs e)
    {
        for(int i=0;i<DataListcate.Items.Count;i++)
        {
            LinkButton x = (LinkButton)DataListcate.Items[i].FindControl("lbcategory");

            x.BackColor = System.Drawing.Color.White;
        }
        LinkButton l = (LinkButton)e.Item.FindControl("lbcategory");

        l.BackColor = System.Drawing.Color.Aqua;

        SqlDataSource1.SelectParameters["cateID"].DefaultValue = l.CommandArgument;

        DataListcate.DataBind();
    }



    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        
    }
}