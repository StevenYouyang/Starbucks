﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class weekinfo : System.Web.UI.Page
{
    //158___________________
    DataTable dt;
    //158-------------------
    //158_____________________________
    public void CalcSum()
    {
        double sum = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sum += Convert.ToDouble(dt.Rows[i]["Je1"]);
        }
        lblSum.Text = "合计金额:" + string.Format("{0:N2}", sum);
    }
    //158-----------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //159__________________________________________________
        if (Session["week"] == null)
            Response.Redirect("products.aspx");
        else
        {
            dt = (DataTable)Session["week"];
            if (dt.Rows.Count == 0)
            {
                lbOK.Enabled = false;
            }
        }
        string CurrentUrl = HttpContext.Current.Request.Url.PathAndQuery;
        if (Session["userID"] == null)
        {
            Response.Redirect("Login.aspx?url=" + CurrentUrl);
        }
        if (!IsPostBack)
        {
            //160_____________________________________________________________
            if (Session["userID"] != null)
            {
                if (Session["address"] == null)
                {
                    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("SELECT TOP 1* FROM orders WHERE userID=@userID ORDER BY orderDate DESC", cn);
                    cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"].ToString();

                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);
                    cn.Close();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txttel.Text = ds.Tables[0].Rows[0]["dztel"].ToString();
                        txtaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                        txtLXR.Text = ds.Tables[0].Rows[0]["LXR"].ToString();


                    }
                }
                else
                {
                    txttel.Text = Session["tel"].ToString();
                    txtaddress.Text = Session["address"].ToString();
                    txtLXR.Text = Session["LXR"].ToString();
                }
            }
            //160-------------------------------------------------------------
            if (Session["week"] != null)
            {
                dt = (DataTable)Session["week"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                CalcSum();
            }
            else
            {
                lblSum.Text = "此项没有食品";
            }
        }
        //159--------------------------------------------------
    }

    protected void lbOK_Click(object sender, EventArgs e)
    {
        //161_______________________________________________________________________________________________________________
        string weekorderID = Guid.NewGuid().ToString();
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERT weekorders(weekorderID,userID,dztel,address,LXR,accept,weekdate,time) VALUES(@orderID,@userID,@dztel,@address,@LXR,'待接单',@weekdate,@time)", cn);
        cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = weekorderID;
        cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"].ToString();
        cmd.Parameters.Add("@dztel", SqlDbType.NChar).Value = txttel.Text.Trim();
        cmd.Parameters.Add("@address", SqlDbType.NVarChar).Value = txtaddress.Text.Trim();
        cmd.Parameters.Add("@LXR", SqlDbType.NChar).Value = txtLXR.Text.Trim();
        cmd.Parameters.Add("@time", SqlDbType.NChar).Value = ddlh.SelectedValue.ToString() + ":" + ddlm.SelectedValue.ToString();
        cmd.Parameters.Add("@weekdate", SqlDbType.NChar).Value = Session["day"].ToString();
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(ds);
        cn.Close();
        cmd = new SqlCommand("INSERT orderItems(orderID,productID,Amount,price,ifcomment) VALUES(@orderID,@productID,@Amount,@price,'0')", cn);
        dt = (DataTable)Session["week"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cmd.Parameters.Clear();
            cmd.Parameters.Add("@orderID", SqlDbType.NVarChar).Value = weekorderID;
            cmd.Parameters.Add("@productID", SqlDbType.NChar).Value = dt.Rows[i]["productID1"];
            cmd.Parameters.Add("@Amount", SqlDbType.NChar).Value = dt.Rows[i]["Amount1"];
            cmd.Parameters.Add("@price", SqlDbType.Money).Value = Convert.ToDecimal(dt.Rows[i]["price1"]);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        Session["week"] = null;
        Response.Redirect("week.aspx");
        //161----------------------------------------------------------------------------------------------------------------------------
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "usethis")
        {
            Label a = e.Item.FindControl("lbladdress") as Label;
            Label b = e.Item.FindControl("lblLXR") as Label;
            Label c = e.Item.FindControl("lblTel") as Label;
            /* DataTable dt;
             dt = new DataTable();
             DataColumn dc;
             dc = new DataColumn("address", typeof(String));
             dt.Columns.Add(dc);
             dc = new DataColumn("LXR", typeof(String));
             dt.Columns.Add(dc);
             dc = new DataColumn("tel", typeof(String));
             dt.Columns.Add(dc);
             Session["dz"] = dt;*/
            /*HttpCookie cookiedz = new HttpCookie("dz");
            cookiedz["address"] = a.Text.ToString();
            cookiedz["LXR"] = b.Text.ToString();
            cookiedz["tel"] = c.Text.ToString();
            Response.Cookies.Add(cookiedz);*/
            Session["address"] = a.Text.ToString();
            Session["LXR"] = b.Text.ToString();
            Session["tel"] = c.Text.ToString();
            Response.Redirect(Request.Url.ToString());


        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //137____________________________________________________________________________________
        if (this.IsValid)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert dz(userID,LXR,address,dztel) values(@userID,@newLXR,@newaddress,@newtel)", cn);
            cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = Session["userID"].ToString();
            cmd.Parameters.Add("@newLXR", SqlDbType.NChar).Value = txtnewLXR.Text;
            cmd.Parameters.Add("@newaddress", SqlDbType.NChar).Value = txtnewaddress.Text;
            cmd.Parameters.Add("@newtel", SqlDbType.NChar).Value = txtnewtel.Text;


            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('注册成功！');</script>");
                Response.Redirect(Request.Url.ToString());
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('新增地址失败！');</script>");
            }
            finally
            {
                cn.Close();
            }
        }
        //137--------------------------------------------------------------------------
    }
}