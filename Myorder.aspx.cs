using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Myorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //198___________________________________________
        string CurrentUrl = HttpContext.Current.Request.Url.PathAndQuery;
        if (Session["userID"] == null)
        {
            Response.Redirect("Login.aspx?url=" + CurrentUrl);
        }
        if (!IsPostBack)
        {
            Label1.Text = "欢迎再次购买`";
        }
        //198-------------------------------------------
        if (DataList2.Items.Count <= 0)
        {
            lblWWC.Text = "";
        }
        if (DataList1.Items.Count <= 0)
        {
            lblYWC.Text = "";
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198________________________________________________________________
        string orderID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems = (SqlDataSource)e.Item.FindControl("dsOrderItems");
        dsOrderItems.SelectParameters["orderID"].DefaultValue = orderID;
        //198---------------------------------------------------------------------
        
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select count(ifcomment) from orderItems where(orderID=@orderID and ifcomment='0')", cn);
        HyperLink a = e.Item.FindControl("HyperLink1") as HyperLink;
        cmd.Parameters.Add("@orderID", SqlDbType.NChar).Value = a.Text;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cn.Open();
        da.Fill(ds);
        cn.Close();
        string b = ds.Tables[0].Rows[0][0].ToString();
        string c = "0";
        if (b.Equals(c))
        {
            ((HyperLink)(e.Item.FindControl("HyperLink2"))).Visible = false;
            ((Label)(e.Item.FindControl("Label2"))).Text = "已完成评价";
        }
        else
        {
            ((Label)(e.Item.FindControl("Label2"))).Text = "未完成评价";
        }
        
        /*  Label accept = e.Item.FindControl("lblAccept") as Label;
          string a = accept.Text.ToString();

          if (a.Equals("已完成"))
          {
              //Button b = e.Item.FindControl("btnAccpet") as Button;
              //b.Visible = false;
              e.Item.FindControl("btnAccept").Visible = false;
          }
          else
          {
              //Button c = e.Item.FindControl("btnComment)") as Button;
               //c.Visible = false;
              e.Item.FindControl("btnComment").Visible = false;
          }*/
    }



    /*  protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
      {

              Label accept = e.Item.FindControl("lblAccept") as Label;
          string a = accept.Text.ToString();

              if (a == "已完成")
          {
              //Button b = e.Item.FindControl("btnAccpet") as Button;
              //b.Visible = false;
              e.Item.FindControl("btnAccept").Visible = false;
         }
          else
          {
              //Button c = e.Item.FindControl("btnComment)") as Button;
              // c.Visible = false;
              e.Item.FindControl("btnComment").Visible = false;
          }

      }*/

    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //198-----------------------------------------
        string orderID = DataList2.DataKeys[e.Item.ItemIndex].ToString();
        SqlDataSource dsOrderItems2 = (SqlDataSource)e.Item.FindControl("dsOrderItems2");
        dsOrderItems2.SelectParameters["orderID"].DefaultValue = orderID;
        //198--------------------------------------------
    }

    /* protected void btnAccept_Click(object sender, EventArgs e)
     {
         //137____________________________________________________________________________________
         if (this.IsValid)
         {
             SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
             SqlCommand cmd = new SqlCommand("update orders set accept='已完成' where orderID=@orderID", cn);
             HyperLink a = DataList2.FindControl("HyperLink1") as HyperLink;
             cmd.Parameters.Add("@orderID", SqlDbType.NChar).Value = a.Text;

             try
             {
                 cn.Open();
                 cmd.ExecuteNonQuery();
                 ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
             }
             catch
             {
                 ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认失败！');</script>");
             }
             finally
             {
                 cn.Close();
             }
         }
         //137--------------------------------------------------------------------------
     }*/

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "accept")
        {
            //137____________________________________________________________________________________
            if (this.IsValid)
            {
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("update orders set accept='已完成' where orderID=@orderID", cn);
                HyperLink a = e.Item.FindControl("HyperLink1") as HyperLink;
                cmd.Parameters.Add("@orderID", SqlDbType.NChar).Value = a.Text;

                try
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();
                   
                    //ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认收货成功！');</script>");
                    Response.Redirect(Request.Url.ToString());
                    
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('确认失败！');</script>");
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
