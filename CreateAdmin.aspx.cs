using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        try
        {
            XLDL.Chaylenh("insert into admin(HoTen,DiaChi,sdt,email,TenDN,MatKhau) values(N'" + txtHoTen.Text.Trim() + "',N'" + txtDiaChi.Text.Trim() + "','" + txtSDT.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + XLDL.MaHoa(txtTenDN.Text.ToLower().Trim()) + "','" + XLDL.MaHoa(txtMatKhau.Text.Trim()) + "')");
            Response.Redirect("~/quantrivien.aspx");
        }
        catch
        {
            lbThongbaoloi.Text = "Tên đăng nhập đã tồn tại, vui lòng thử lại với tên khác !";
        }
    }
}