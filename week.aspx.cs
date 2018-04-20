using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class week : System.Web.UI.Page
{
    DataTable dt;
    //113____________________________
    public void CalcSum()
    {
        double sum = 0;
        for (int I = 0; I < GridView1.Rows.Count; I++)
        {
            TextBox t = (TextBox)GridView1.Rows[I].Cells[2].FindControl("txtamount1");
            if (t.Text == "")
                dt.Rows[I]["Amount1"] = 0;
            else
                dt.Rows[I]["Amount1"] = t.Text;
            dt.Rows[I]["Je1"] = Convert.ToDouble(dt.Rows[I]["Amount1"]) * Convert.ToDouble(dt.Rows[I]["price1"]);
            GridView1.Rows[I].Cells[3].Text = string.Format("{0:N2}", dt.Rows[I]["Je1"]);
            sum += Convert.ToDouble(dt.Rows[I]["Je1"]);
        }
        lblsum1.Text = "合计金额：" + string.Format("{0:N2}", sum);
    }
    //113------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //if (Session["day"] != null)
            //ddlweek.SelectedValue = Session["day"].ToString();
        //107_________________________________________________________________________-
        if (Session["week"] == null)
        {
            HyperLink2.Text = "去添加";
            LinkButton1.Text = "";
            btnclear1.Visible = false;
            btnchange1.Visible = false;
            lblsum1.Visible = false;
            ddlweek.Visible = false;
        }

        else
        {
            HyperLink2.Text = "继续添加";
            dt = (DataTable)Session["week"];
            
        }
        if (!IsPostBack)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //114__________
            CalcSum();
            //114----------
        }
        //107---------------------------------------------------------------------------------
        if (DataList1.Items.Count <= 0)
        {
            Label1.Text = "";
        }
        if (DataList2.Items.Count <= 0)
        {
            Label2.Text = "";
        }
        if (DataList3.Items.Count <= 0)
        {
            Label3.Text = "";
        }
        if (DataList4.Items.Count <= 0)
        {
            Label4.Text = "";
        }
        if (DataList5.Items.Count <= 0)
        {
            Label5.Text = "";
        }
        if (DataList6.Items.Count <= 0)
        {
            Label6.Text = "";
        }
        if (DataList7.Items.Count <= 0)
        {
            Label7.Text = "";
        }
        
    }

    protected void btnchange1_Click(object sender, EventArgs e)
    {
        CalcSum();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        //119__________________________________
        if (e.CommandName == "del")
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
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('确认要删除吗?')");
        }
        //119------------------------------------------
    }

    protected void btnclear1_Click(object sender, EventArgs e)
    {

        //121_____________________
        dt.Clear();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        CalcSum();
        //121---------------------
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ddlweek.SelectedValue = ddlweek.Text;
        Session["day"] = ddlweek.SelectedValue.ToString();
        Response.Redirect("weekinfo.aspx");
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek1 = (SqlDataSource)e.Item.FindControl("dsweek1");
        dsweek1.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList2.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek2 = (SqlDataSource)e.Item.FindControl("dsweek2");
        dsweek2.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList3.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek3 = (SqlDataSource)e.Item.FindControl("dsweek3");
        dsweek3.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }
    protected void DataList4_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList4.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek4 = (SqlDataSource)e.Item.FindControl("dsweek4");
        dsweek4.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }
    protected void DataList5_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList5.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek5 = (SqlDataSource)e.Item.FindControl("dsweek5");
        dsweek5.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }
    protected void DataList6_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList6.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek6 = (SqlDataSource)e.Item.FindControl("dsweek6");
        dsweek6.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }
    protected void DataList7_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList7.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek7 = (SqlDataSource)e.Item.FindControl("dsweek7");
        dsweek7.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }
   

    protected void DataList7_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList6_ItemCommand1(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "clear")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("delete from weekorders where weekorderID=@weekorderID;delete from orderItems where orderID=@weekorderID", cn);
                Label a = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = a.Text;
                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('删除失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }
}