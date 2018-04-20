using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class OrderByID : System.Web.UI.Page
{
    //173__________________
    DataSet dsStarbucks;
    //173------------------
    //173_____________________________________________________
    private void Bind()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        string sql;
        sql = "SELECT orders.*";
        sql += ",Je=(SELECT sum(Amount*price)FROM orderItems WHERE orderID=@orderID)";
        sql += "FROM orders WHERE orderID=@orderID AND userID=@userID";
        SqlCommand cmd = new SqlCommand(sql, cn);
        cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = Request.QueryString["orderID"];
        cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"];
        dsStarbucks = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(dsStarbucks, "orders");
        cn.Close();
        DataList1.DataSource = dsStarbucks.Tables["orders"];
        DataList1.DataBind();
        sql = "SELECT OI.*,productname=productname+'('+hoc+')',productImage,Je=Amount*OI.price";
        sql += " FROM orderItems OI,products M";
        sql += "    WHERE OI.productID=M.productID AND orderID=@orderID";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = Request.QueryString["orderID"];
        da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(dsStarbucks, "orderItems");
        cn.Close();
        gvOrderItems.DataSource = dsStarbucks.Tables["orderItems"];
        gvOrderItems.DataBind();
        Session["dsStarbucks"] = dsStarbucks;

    }
    //173-----------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //174______________________________
        if (Request.QueryString["orderID"] == null || Session["userID"] == null)
        {
            Response.Redirect("Products.aspx");
        }
        else if (!IsPostBack)
            Bind();
        //174------------------------------
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}