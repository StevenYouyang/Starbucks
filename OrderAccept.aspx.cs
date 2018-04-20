using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderAccept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] day = new string[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        string week = day[Convert.ToInt32(DateTime.Now.DayOfWeek.ToString("d"))].ToString();
        lblday.Text = week;
    }
}