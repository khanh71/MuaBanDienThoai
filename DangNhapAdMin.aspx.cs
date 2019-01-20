using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangNhapAdMin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = XLDL.LayDuLieu("select * from admin where TenDN='" + XLDL.MaHoa(txtTenDN.Value.Trim().ToLower()) + "' and MatKhau = '" + XLDL.MaHoa(txtMatKhau.Value) + "'");
            if (dt.Rows.Count > 0)
            {
                Session["DNAdmin"] = txtTenDN.Value.Trim().ToLower();
                Response.Redirect("~/home.aspx");
            }
            else
                lbThongbaoloi.Text = "Sai tên đăng nhập hoặc mật khẩu";
        }
        catch
        {
            lbThongbaoloi.Text = "Đăng nhập thất bại";
        }
    }
}