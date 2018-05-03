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
                //161_______________________________________________________________________________________________________________
                string orderID = Guid.NewGuid().ToString();
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("INSERT orders(orderID,userID,dztel,address,LXR,accept) VALUES(@orderID,@userID,@dztel,@address,@LXR,'待配单')", cn);
                Label label8 = e.Item.FindControl("Label8") as Label;
                Label label9 = e.Item.FindControl("Label9") as Label;
                Label label10 = e.Item.FindControl("Label10") as Label;
                Label label11 = e.Item.FindControl("Label11") as Label;
                Label label16 = e.Item.FindControl("Label16") as Label;
                cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = orderID;
                
                cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = label16.Text.ToString();
                cmd.Parameters.Add("@dztel", SqlDbType.NChar).Value = label11.Text.Trim();
                cmd.Parameters.Add("@address", SqlDbType.NVarChar).Value = label9.Text.Trim();
                cmd.Parameters.Add("@LXR", SqlDbType.NChar).Value = label10.Text.Trim();
                //DataSet ds = new DataSet();
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //cn.Open();
                //da.Fill(ds);
                //cn.Close();

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('接单失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
                cmd = new SqlCommand("update orderItems set orderID=@orderID where orderID=@a", cn);
                cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = orderID;
                cmd.Parameters.Add("@a", SqlDbType.NVarChar).Value = label8.Text;
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                //cmd = new SqlCommand("update weekorders set date=@date where weekorderID=@b", cn);
                //cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = lbdate.Text;
                //cmd.Parameters.Add("@b", SqlDbType.NVarChar).Value = label8.Text;

                //cn.Open();
                //cmd.ExecuteNonQuery();
                //cn.Close();
                cmd = new SqlCommand("update weekorders set weekorderID=@weekorderID,date=getdate() where weekorderID=@c", cn);
                
                cmd.Parameters.Add("@weekorderID", SqlDbType.NVarChar).Value = orderID;
                cmd.Parameters.Add("@c", SqlDbType.NVarChar).Value = label8.Text;

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                Response.Redirect(Request.Url.ToString());
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



