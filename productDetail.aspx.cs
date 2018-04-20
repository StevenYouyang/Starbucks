using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class productDetail : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (DataList2.Items.Count <= 0)
        {
            Label4.Text = "";
        }
       
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

    //*************************************************
   // protected void btnG_Click(object sender, EventArgs e)
   // {

        //  Button btnG = (Button)sender;
        //Label tb = (Label)btnG.Parent.FindControl("lbprice");
        //SqlConnection Conn = new SqlConnection("Data Source=THINKPADSTEVEN;    Initial Catalog=Starbucks;Integrated Security=True");

        //SqlCommand cmd = new SqlCommand("select * from products");

        //SqlDataReader dr = cmd.ExecuteReader();
        //Conn.Open();
        //Button btnG = (Button)sender;
        //Label tb = (Label)btnG.Parent.FindControl("lbprice");
        //while (dr.Read())
        //{
        //    tb.Text += dr["price" + 3];
        //}
        //Conn.Close();
        //cmd.Dispose();



   // }
    //***************************************************

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //95__________________________________________________________________________
        if (e.CommandName == "Buy")
        {
            DataRow dr = getProductByID(Request.QueryString["productID"]);
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
            for(int I=0;I<dt.Rows.Count;I++)
            {
                if(dt.Rows[I]["productID"].ToString()==productID)
                {
                    IsExist = true;
                    dt.Rows[I]["Amount"] = Convert.ToInt32(dt.Rows[I]["Amount"].ToString()) + Amount;
                    dt.Rows[I]["Je"] = Convert.ToInt32(dt.Rows[I]["Amount"].ToString()) * Convert.ToInt32(dt.Rows[I]["price"].ToString());
                    break;

                }
            }
            if(!IsExist)
            {
                DataRow drNew = dt.NewRow();
                drNew["productID"] = productID;
                drNew["productname"] = productname;  //+ "(" + +")";
                drNew["price"] = price;
                drNew["Amount"] = Amount;
                drNew["Je"] = price * Amount;
                dt.Rows.Add(drNew);
            }
            Session["Cart"] = dt;
            Response.Redirect("AddCartSuccess.aspx");
        }
        //95--------------------------------------------------------
        //95__________________________________________________________________________
        if (e.CommandName == "week")
        {
            DataRow drr = getProductByID(Request.QueryString["productID"]);
            string productID = drr["productID"].ToString();
            string productname = drr["productname"].ToString();
            //string size = dr["size"].ToString;
            double price = Convert.ToDouble(drr["price"].ToString());
            int Amount = Convert.ToInt32(((TextBox)(e.Item.FindControl("txtAmount"))).Text);
           
            DataTable dtt;
            if (Session["week"] != null)
            {
                dtt = (DataTable)Session["week"];
            }
            else
            {
                dtt = new DataTable();
                DataColumn dcc;
                dcc = new DataColumn("productID1", typeof(String));
                dtt.Columns.Add(dcc);
                dcc = new DataColumn("productname1", typeof(String));
                dtt.Columns.Add(dcc);
                dcc = new DataColumn("price1", typeof(double));
                dtt.Columns.Add(dcc);
                dcc = new DataColumn("Amount1", typeof(double));
                dtt.Columns.Add(dcc);
                dcc = new DataColumn("Je1", typeof(double));
                dtt.Columns.Add(dcc);
               
            }
            bool IsExist = false;
            for (int I = 0; I < dtt.Rows.Count; I++)
            {
                if (dtt.Rows[I]["productID1"].ToString() == productID)
                {
                    IsExist = true;
                    dtt.Rows[I]["Amount1"] = Convert.ToInt32(dtt.Rows[I]["Amount1"].ToString()) + Amount;
                    dtt.Rows[I]["Je1"] = Convert.ToInt32(dtt.Rows[I]["Amount1"].ToString()) * Convert.ToInt32(dtt.Rows[I]["price1"].ToString());
                    break;

                }
            }
            if (!IsExist)
            {
                DataRow drNew = dtt.NewRow();
                drNew["productID1"] = productID;
                drNew["productname1"] = productname;  //+ "(" + +")";
                drNew["price1"] = price;
                drNew["Amount1"] = Amount;
                drNew["Je1"] = price * Amount;
                
                dtt.Rows.Add(drNew);
            }
            Session["week"] = dtt;
            Response.Redirect("week.aspx");
        }
        //95--------------------------------------------------------
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
