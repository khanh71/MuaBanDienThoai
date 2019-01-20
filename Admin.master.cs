using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["DNAdmin"] != null)
            {
                DataTable dt = XLDL.LayDuLieu("select hoten from admin where tendn='" + XLDL.MaHoa(Session["DNAdmin"].ToString()) + "'");
                if(dt.Rows.Count>0)
                    lbTenDN.Text = "Xin chào, " + dt.Rows[0][0].ToString();
            }
            else
                Response.Redirect("~/DangNhapAdMin.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["DNAdmin"] = null;
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
    }
}
