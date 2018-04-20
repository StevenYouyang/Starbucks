using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "comment")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("insert comments(userID,productID,comment) values(@userID,@productID,@comment)", cn);
                SqlCommand cmmd = new SqlCommand("update orderItems set ifcomment='1' where orderItemID=@orderItemID ", cn);
                Label c = e.Item.FindControl("lblorderItemID") as Label;
                cmmd.Parameters.Add("@orderItemID", SqlDbType.NChar).Value = c.Text.ToString();
               
                Label a = e.Item.FindControl("lblID") as Label;
                TextBox b = e.Item.FindControl("tbC") as TextBox;
                cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"].ToString();
                cmd.Parameters.Add("@productID", SqlDbType.NChar).Value = a.Text;
                cmd.Parameters.Add("@comment", SqlDbType.NChar).Value = b.Text.Trim();

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cmmd.ExecuteNonQuery();

                    // ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('评价成功！');</script>");
                    if (DataList1.DataSource==null )
                    {
                        Response.Redirect("Myorder.aspx");
                    }
                    else
                    {
                        Response.Redirect(Request.Url.ToString());
                    }

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('评价失败！');</script>");
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