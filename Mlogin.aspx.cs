using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Mlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["mID"] = null;
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["mID"];
            if (cookie != null && cookie["mID"].ToString() != "")
            {
                txtmID.Text = cookie["mID"].ToString();
            }
        }
    }

    protected void lbmLogin_Click(object sender, EventArgs e)
    {
        //147__________________________
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM manager WHERE mID=@mID AND mpwd=@mpwd", cn);
        cmd.Parameters.Add("@mID", SqlDbType.NChar).Value = txtmID.Text;
        cmd.Parameters.Add("@mpwd", SqlDbType.NChar).Value = txtmpwd.Text;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie cookie = Request.Cookies[" mID"];
            if (cookie == null)
            {
                cookie = new HttpCookie("mID");
            }
            cookie.Values.Set("mID", txtmID.Text);
            if (mcbMemory.Checked)
                cookie.Expires = System.DateTime.Now.AddDays(30);
            else
                cookie.Expires = System.DateTime.Now;
            Response.SetCookie(cookie);
            Session["mID"] = txtmID.Text;
            Session["mname"] = ds.Tables[0].Rows[0]["mname"];
            if (Request.QueryString["url"] != null)
            {
                Response.Redirect(Request.QueryString["url"]);
            }
            else
                Response.Redirect("Mproducts.aspx");
        }
        else
        {
            Session["mID"] = null;
            Response.Write("<script language='javascript'> alert('该管理员还没有注册或者密码错误！') </script>");
        }

        //147--------------------------
    }
}