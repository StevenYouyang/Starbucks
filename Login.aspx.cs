using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userID"] = null;
        Session["address"] = null;
        if(!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["userID"];
            if (cookie!=null&&cookie["userID"].ToString()!="")
            {
                txtuserID.Text = cookie["userID"].ToString();
            }
        }
    }

    protected void lbLogin_Click(object sender, EventArgs e)
    {
        //147__________________________
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE userID=@userID AND pwd=@pwd", cn);
        cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = txtuserID.Text;
        cmd.Parameters.Add("@pwd", SqlDbType.NChar).Value = txtpwd.Text;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(ds);
        cn.Close();
        if(ds.Tables[0].Rows.Count>0)
        {
            HttpCookie cookie = Request.Cookies["userID"];
            if(cookie==null)
            {
                cookie = new HttpCookie("userID");
            }
            cookie.Values.Set("userID", txtuserID.Text);
            if (cbMemory.Checked)
                cookie.Expires = System.DateTime.Now.AddDays(30);
            else
                cookie.Expires = System.DateTime.Now;
            Response.SetCookie(cookie);
            Session["userID"] = txtuserID.Text;
            Session["username"] = ds.Tables[0].Rows[0]["username"];
            if (Request.QueryString["url"] != null)
            {
                Response.Redirect(Request.QueryString["url"]);
            }
            else
                Response.Redirect("Products.aspx");
        }
        else
        {
            Session["userID"] = null;
            Response.Write("<script language='javascript'> alert('该用户还没有注册或者密码错误！') </script>");
        }

        //147--------------------------
    }
}