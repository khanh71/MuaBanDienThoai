using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["TenDN"] != null)
                Response.Redirect("~/index.aspx");
            if (Request.Cookies["Luu"] != null)
            {
                HttpCookie cookie = Request.Cookies.Get("TenDNandPass");
                txtTen.Text = XLDL.GiaiMa(cookie.Values["TenDN"].ToString());
                txtMatkhau.Text = XLDL.GiaiMa(cookie.Values["Pass"].ToString());
                cbLuu.Checked = true;
            }
            if(Request.UrlReferrer != null)
            {
                if (Request.UrlReferrer.ToString() == XLDL.urlDangKy)
                    Session["url"] = "index.aspx";
                else
                    Session["url"] = Request.UrlReferrer.ToString();
            }
            else
                Session["url"] = "index.aspx";
            if (Session["GHtoDN"] != null && Session["Giohang"] != null)
            {
                Label1.Visible = true;
                Session["GHtoDN"] = null;
            }
            else Label1.Visible = false;
        }
    }
    protected void LuuDN()
    {
        if (cbLuu.Checked)
        {
            HttpCookie cookie = new HttpCookie("Luu", "yes");
            Response.Cookies.Add(cookie);
            cookie = new HttpCookie("TenDNandPass");
            cookie.Values.Add("TenDN", XLDL.MaHoa(txtTen.Text.Trim().ToLower()));
            cookie.Values.Add("Pass", XLDL.MaHoa(txtMatkhau.Text.Trim()));
            Response.Cookies.Add(cookie);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = XLDL.LayDuLieu("select * from khachhang where TenDN='" + XLDL.MaHoa(txtTen.Text.ToLower()) + "' and MatKhau = '" + XLDL.MaHoa(txtMatkhau.Text) + "'");
            if (dt.Rows.Count > 0)
            {
                Session["TenDN"] = txtTen.Text.Trim().ToLower();
                LuuDN();
                Response.Redirect(Session["url"].ToString());
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