using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["TenDN"] != null)
                Response.Redirect("~/index.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(XLDL.strcon);
            SqlCommand cmd = new SqlCommand("insert into khachhang(HoTen,DiaChi,DienThoai,TenDN,MatKhau,email) values(N'" + txtHoTen.Text.Trim() + "',N'" + txtDiachi.Text.Trim() + "','" + txtSDT.Text.Trim() + "','" + XLDL.MaHoa(txten.Text.ToLower().Trim()) + "','" + XLDL.MaHoa(txtMatkhau.Text.Trim()) + "','" + txtEmail.Text.Trim() + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            XLDL.urlDangKy = HttpContext.Current.Request.Url.AbsoluteUri.ToString();
            Response.Redirect("~/Dangnhap.aspx");
        }
        catch
        {
            lbThongbaoloi.Text = "Lỗi, vui lòng thử lại !";
        }
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string chuoi = XLDL.MaHoa(txten.Text.Trim().ToLower());
        DataTable dt = XLDL.LayDuLieu("select TenDN from khachhang where TenDN='" + chuoi + "'");
        if(dt.Rows.Count>0)
        {
            string str1 = dt.Rows[0][0].ToString();
            if (chuoi == str1)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        
    }
}