using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class upload : System.Web.UI.Page
{
    public string pic = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //137____________________________________________________________________________________
        if (this.IsValid)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
            cn.Open();
            SqlCommand ccmd = new SqlCommand("select max(productID) from products", cn);
            SqlDataReader sdr = ccmd.ExecuteReader();
            sdr.Close();
            int productID = Convert.ToInt32(ccmd.ExecuteScalar());
            productID = productID + 1;
            SqlCommand cmd = new SqlCommand("INSERT products(productID,productname,hoc,size,cateID,productImage,price,sum,sale)VALUES(@productID,@productname,@hoc,@size,@cateID,@productImage,@price,'0','销售')", cn);
            cmd.Parameters.Add("@productID", SqlDbType.NChar).Value = productID.ToString();
            cmd.Parameters.Add("@productname", SqlDbType.NChar).Value = txtmProductname.Text;
            cmd.Parameters.Add("@hoc", SqlDbType.NChar).Value = rblmHoc.SelectedValue.ToString();
            cmd.Parameters.Add("@size", SqlDbType.NChar).Value = ddlmSize.SelectedItem.Text.ToString();
            string cateID = ddlmCate.SelectedItem.Value.ToString();
            string a = "咖啡";
            string b = "茶";
            string c = "星冰乐";
            string d = "糕点";
            if (cateID.Equals(a))
                cmd.Parameters.Add("@cateID", SqlDbType.NChar).Value = "001";
            else if(cateID.Equals(b))
                cmd.Parameters.Add("@cateID", SqlDbType.NChar).Value = "002";
            else if (cateID.Equals(c))
                cmd.Parameters.Add("@cateID", SqlDbType.NChar).Value ="003";
            else if (cateID.Equals(d))
                cmd.Parameters.Add("@cateID", SqlDbType.NChar).Value = "004";
            decimal price;
            string p = txtmPrice.Text;
            price = Convert.ToDecimal(p);
            cmd.Parameters.Add("@price", SqlDbType.Money).Value = price;
            if (fuProduct.HasFile)
            {
                if (fuProduct.PostedFile.ContentLength < 8192)
                {
                    lblUpFile.Text = "请上传小于8MB的文件";
                    cmd.Parameters.Add("@productImage", SqlDbType.NVarChar).Value = "";
                }
                else
                {
                    string newFileName = "photos/" + productID.ToString() + "" + DateTime.Now.ToString("yyyyMMddHHmmss") + System.IO.Path.GetFileName(fuProduct.FileName);
                    fuProduct.PostedFile.SaveAs(Server.MapPath(newFileName));
                    lblUpFile.Text = "文件上传成功";
                    cmd.Parameters.Add("@productImage", SqlDbType.NVarChar).Value = newFileName;
                }
            }
            else cmd.Parameters.Add("@productImage", SqlDbType.NVarChar).Value = "";
            try
            {
                //cn.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('上传成功！');</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(" + ex.ToString() + ");</script>");
               // ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('上传失败！');</script>");
            }
            finally
            {
                cn.Close();
            }
        }
        //137--------------------------------------------------------------------------
    }
}