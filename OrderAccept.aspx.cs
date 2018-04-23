using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class OrderAccept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] day = new string[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        string week = day[Convert.ToInt32(DateTime.Now.DayOfWeek.ToString("d"))].ToString();
        lblday.Text = week;
        Session["weekdate"] = week;
        string today = DateTime.Now.Date.ToShortDateString();
        lbdate.Text = today;
        string yesterday = DateTime.Now.AddDays(-1).ToShortDateString();
        Session["yesterday"] = yesterday;

        if (DataList1.Items.Count <= 0)
        {
            Label1.Text = "";
        }
        if (DataList2.Items.Count <= 0)
        {
            Label2.Text = "";
        }
        if (DataList4.Items.Count <= 0)
        {
            Label3.Text = "";
        }
        if (DataList5.Items.Count <= 0)
        {
            Label4.Text = "";
        }
        if (DataList6.Items.Count <= 0)
        {
            Label14.Text = "";
        }
        if (DataList7.Items.Count <= 0)
        {
            Label5.Text = "";
        }
        if (DataList8.Items.Count <= 0)
        {
            Label6.Text = "";
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string orderID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems2 = (SqlDataSource)e.Item.FindControl("dsOrderItems2");
        dsOrderItems2.SelectParameters["orderID"].DefaultValue = orderID;
        //198--------------------------------------------
    }

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string orderID = DataList2.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems2 = (SqlDataSource)e.Item.FindControl("dsOrderItems2");
        dsOrderItems2.SelectParameters["orderID"].DefaultValue = orderID;
        //198--------------------------------------------
        //4/23
        //SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        //string cmd = "select * from WMY )";
        //SqlDataAdapter ada = new SqlDataAdapter(cmd, cn);
        //DataSet ds = new DataSet();
        //ada.Fill(ds, "WMY");
        //((DropDownList)(e.Item.FindControl("ddl1")).datasource
    }

    protected void DataList4_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string orderID = DataList4.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems2 = (SqlDataSource)e.Item.FindControl("dsOrderItems2");
        dsOrderItems2.SelectParameters["orderID"].DefaultValue = orderID;
        //198--------------------------------------------
    }

    protected void DataList5_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string orderID = DataList5.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems2 = (SqlDataSource)e.Item.FindControl("dsOrderItems2");
        dsOrderItems2.SelectParameters["orderID"].DefaultValue = orderID;
    }

    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList3.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek1 = (SqlDataSource)e.Item.FindControl("dsweek1");
        dsweek1.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList6_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList6.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek1 = (SqlDataSource)e.Item.FindControl("dsweek1");
        dsweek1.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList7_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList7.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek1 = (SqlDataSource)e.Item.FindControl("dsweek1");
        dsweek1.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList8_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string weekorderID = DataList8.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsweek1 = (SqlDataSource)e.Item.FindControl("dsweek1");
        dsweek1.SelectParameters["weekorderID"].DefaultValue = weekorderID;
        //198--------------------------------------------
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "accept")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update orders set accept='待配单' where orderID=@orderID", cn);
                HyperLink a = e.Item.FindControl("HyperLink1") as HyperLink;
                cmd.Parameters.Add("@orderID", SqlDbType.NChar).Value = a.Text;

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('接单失败！');</script>");
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
        if (e.CommandName == "accept")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update weekorders set accept='待配单' where weekorderID=@weekorderID", cn);
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
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('接单失败！');</script>");
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
        if (e.CommandName == "accept")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update orders set accept='配送中',WMYID=(select WMYID from WMY where WMYname=@WMYname) where orderID=@orderID", cn);
                DropDownList a = e.Item.FindControl("ddl1") as DropDownList;
                cmd.Parameters.Add("@WMYname", SqlDbType.NChar).Value = a.SelectedValue.ToString();
                HyperLink b = e.Item.FindControl("HyperLink1") as HyperLink;
                cmd.Parameters.Add("@orderID", SqlDbType.NChar).Value = b.Text;

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('配单失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137--------------------------------------------------------------------------
        }
    }

    protected void DataList2_DeleteCommand(object source, DataListCommandEventArgs e)
    {

    }

    //protected void ddl1_DataBound(object sender, EventArgs e)
    //{

    //    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
    //    string cmd = "select * from WMY )";
    //    SqlDataAdapter ada = new SqlDataAdapter(cmd, cn);
    //    DataSet ds = new DataSet();
    //    ada.Fill(ds, "WMY");
    //    ddl1.datasour
    //}

    protected void DataList6_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "accept")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update weekorders set accept='配送中',WMYID=(select WMYID from WMY where WMYname=@WMYname) where weekorderID=@weekorderID", cn);
                DropDownList a = e.Item.FindControl("ddl1") as DropDownList;
                cmd.Parameters.Add("@WMYname", SqlDbType.NChar).Value = a.SelectedValue.ToString();
                Label b = e.Item.FindControl("Label8") as Label;
                cmd.Parameters.Add("@weekorderID", SqlDbType.NChar).Value = b.Text;

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('配单失败！');</script>");
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



