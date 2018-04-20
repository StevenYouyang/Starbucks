using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class TJ : System.Web.UI.Page
{
    DataSet dsTJ;
    string productIDhaha = "";
    private void Bind()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        string sql;
        sql = "select * from products where productID= (select  top 1 orderItems.productID from orders INNER JOIN orderItems on orderItems.orderID=orders.orderID where (orders.userID=@userID) group by productID order by SUM(CAST(amount as int)) desc)";
        
        SqlCommand cmd = new SqlCommand(sql, cn);
        cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"];
        dsTJ = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        try
        {
     
            cmd.ExecuteNonQuery();
            da.Fill(dsTJ, "tj");
            productIDhaha = dsTJ.Tables["tj"].Rows[0][0].ToString();
            cn.Close();
            DataList1.DataSource = dsTJ.Tables["tj"];
            DataList1.DataBind();

            Session["dsTJ"] = dsTJ;
            
        }
        catch (Exception ex)
        {
           lblIfNull.Text = "您还没有购买记录";
        }
        finally
        {
            cn.Close();
        }
        //da.Fill(dsTJ, "tj");
        //productIDhaha = dsTJ.Tables["tj"].Rows[0][0].ToString();
        //cn.Close();
        //DataList1.DataSource = dsTJ.Tables["tj"];
        //DataList1.DataBind();

        //Session["dsTJ"] = dsTJ;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["userID"] == null)
        {
            Response.Redirect("Products.aspx");
        }
        if(!IsPostBack)
            Bind();
    }
    //_________________________________________________________________________
    private DataRow getProductByID(string productID)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM products WHERE productID=@productID", cn);
        cmd.Parameters.Add("@productID", SqlDbType.NVarChar).Value = productID;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count > 0)
            return ds.Tables[0].Rows[0];
        else
            return null;

    }
    //---------------------------------------------------------------------------

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //95__________________________________________________________________________
        if (e.CommandName == "Buy")
        {
            Bind();
            DataRow dr = getProductByID(productIDhaha);
            string productID = dr["productID"].ToString();
            string productname = dr["productname"].ToString();
            //string size = dr["size"].ToString;
            double price = Convert.ToDouble(dr["price"].ToString());
            int Amount = Convert.ToInt32(((TextBox)(e.Item.FindControl("txtAmount"))).Text);
            DataTable dt;
            if (Session["Cart"] != null)
            {
                dt = (DataTable)Session["Cart"];
            }
            else
            {
                dt = new DataTable();
                DataColumn dc;
                dc = new DataColumn("productID", typeof(String));
                dt.Columns.Add(dc);
                dc = new DataColumn("productname", typeof(String));
                dt.Columns.Add(dc);
                dc = new DataColumn("price", typeof(double));
                dt.Columns.Add(dc);
                dc = new DataColumn("Amount", typeof(double));
                dt.Columns.Add(dc);
                dc = new DataColumn("Je", typeof(double));
                dt.Columns.Add(dc);
            }
            bool IsExist = false;
            for (int I = 0; I < dt.Rows.Count; I++)
            {
                if (dt.Rows[I]["productID"].ToString() == productID)
                {
                    IsExist = true;
                    dt.Rows[I]["Amount"] = Convert.ToInt32(dt.Rows[I]["Amount"].ToString()) + Amount;
                    dt.Rows[I]["Je"] = Convert.ToInt32(dt.Rows[I]["Amount"].ToString()) * Convert.ToInt32(dt.Rows[I]["price"].ToString());
                    break;

                }
            }
            if (!IsExist)
            {
                DataRow drNew = dt.NewRow();
                drNew["productID"] = productID;
                drNew["productname"] = productname;// + "(" +sizeof+")";
                drNew["price"] = price;
                drNew["Amount"] = Amount;
                drNew["Je"] = price * Amount;
                dt.Rows.Add(drNew);
            }
            Session["Cart"] = dt;
            Response.Redirect("AddCartSuccess.aspx");
        }
        //95--------------------------------------------------------
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}