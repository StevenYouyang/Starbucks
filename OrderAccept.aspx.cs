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
}


