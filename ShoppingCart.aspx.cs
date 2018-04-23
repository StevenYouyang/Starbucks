using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ShoppingCart : System.Web.UI.Page
{
    //107_____________________
    DataTable dt;
    //107----------------------
    //113____________________________
    public void CalcSum()
    {
        double sum = 0;
        for(int I=0;I<GridView1.Rows.Count;I++)
        {
            TextBox t = (TextBox)GridView1.Rows[I].Cells[2].FindControl("txtAmount");
            if (t.Text == "")
                dt.Rows[I]["Amount"] = 0;
            else
                dt.Rows[I]["Amount"] = t.Text;
            dt.Rows[I]["Je"] = Convert.ToDouble(dt.Rows[I]["Amount"]) * Convert.ToDouble(dt.Rows[I]["price"]);
            GridView1.Rows[I].Cells[3].Text = string.Format("{0:N2}", dt.Rows[I]["Je"]);
        sum += Convert.ToDouble(dt.Rows[I]["Je"]);
        }
        lblSum.Text = "消费金额总计：" + string.Format("{0:N2}", sum);
    }
    //113------------------------------
    //115_____________________________________________________
    protected void btnTemp_Click(object sender,EventArgs e)
    {
        CalcSum();
    }
    //115-----------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //107_________________________________________________________________________-
        if (Session["Cart"] == null)
        {
            lblnocart.Text = "购物车竟然是空的!";
            hlpay.Text = "";
            btnClear.Visible = false;
            btnTemp.Visible = false;
            lblSum.Text = "";
            
        }

        else
            dt = (DataTable)Session["Cart"];
        if(!IsPostBack)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //114__________
            CalcSum();
            //114----------
        }
    //107---------------------------------------------------------------------------------
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //119__________________________________
        if(e.CommandName=="del")
        {
            int rowIndex = Int32.Parse((String)e.CommandArgument);
            dt.Rows.RemoveAt(rowIndex);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            CalcSum();
        }
        //119----------------------------------
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //119__________________________________________
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            ((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('确认要删除吗?')");
        }
        //119------------------------------------------
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        //121_____________________
        dt.Clear();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        CalcSum();
        //121---------------------
    }
}