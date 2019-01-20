using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThanhCong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["MHtoTC"] == null)
                Response.Redirect("~/index.aspx");
            load();
            Session["MHtoTC"] = null;
        }
    }
    private void load()
    {
        lbmadh.Text = "#" + XLDL.LayDuLieu("select max(sodh) from donhang where makh=" + XLDL.LayDuLieu("select makh from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'").Rows[0][0]).Rows[0][0].ToString();
    }
}