using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //3.23-------------------------------
        if (e.CommandName == "Change")
        {
            // 完成购买
            TextBox txtPrice = e.Item.FindControl("txtPrice") as TextBox;
            DropDownList ddlSale = e.Item.FindControl("ddlSale") as DropDownList;

            decimal price = Convert.ToDecimal(txtPrice.Text);
            string sale = ddlSale.SelectedValue.ToString();
            Profile.Save();
            //137-----------------------------------------------------------
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("UPDATE products SET price=@price,sale=@sale WHERE productID=@productID", cn);
                cmd.Parameters.Add("@price", SqlDbType.NChar).Value = price;
                cmd.Parameters.Add("@sale", SqlDbType.NChar).Value = sale;
                cmd.Parameters.Add("@productID", SqlDbType.NVarChar).Value = Request.QueryString["productID"];



                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('修改成功！');</script>");
                }
                catch(Exception ex)
                {
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('修改失败！');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
            //137-----------------------------------------------------------
        }

        //3.23----------------------------------------
    }
}