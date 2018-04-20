using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Regist : System.Web.UI.Page
{
    //135___________________________
    public string pic = "";
    //135---------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        //___________________
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        //-------------------
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        //137____________________________________________________________________________________
        if(this.IsValid)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["StarbucksConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("INSERT users(userID,username,gender,pwd,tel,userImage)VALUES(@userID,@username,@gender,@pwd,@tel,@userImage)", cn);
            cmd.Parameters.Add("@userID", SqlDbType.NChar).Value = txtuserID.Text;
            cmd.Parameters.Add("@username", SqlDbType.NChar).Value = txtusername.Text;
            cmd.Parameters.Add("@gender", SqlDbType.NChar).Value = rblgender.SelectedValue;
            cmd.Parameters.Add("@pwd", SqlDbType.NChar).Value = txtpwd.Text;
            cmd.Parameters.Add("@tel", SqlDbType.NChar).Value = txttel.Text;
            if (fuuser.HasFile)
            {
                if (fuuser.PostedFile.ContentLength < 8192)
                {
                    lblUpFile.Text = "请上传小于8MB的文件";
                    cmd.Parameters.Add("@userImage", SqlDbType.NVarChar).Value = "";
                }
                else
                {
                    string newFileName = "userImage/" + txtuserID.Text + "" + DateTime.Now.ToString("yyyyMMddHHmmss") + System.IO.Path.GetFileName(fuuser.FileName);
                    fuuser.PostedFile.SaveAs(Server.MapPath(newFileName));
                    lblUpFile.Text = "文件上传成功";
                    cmd.Parameters.Add("@userImage", SqlDbType.NVarChar).Value = newFileName;
                }
            }
            else cmd.Parameters.Add("@userImage", SqlDbType.NVarChar).Value = "";
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('注册成功！');</script>");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('注册失败！');</script>");
            }
            finally
            {
                cn.Close();
            }
        }
        //137--------------------------------------------------------------------------
    }
}