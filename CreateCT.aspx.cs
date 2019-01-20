using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateCT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        string thumuc = "~/images/" + txtTen.Text.Trim();
        if (!Directory.Exists(Server.MapPath(thumuc)))
            Directory.CreateDirectory(Server.MapPath(thumuc));
        if (FileUpload1.HasFile)
        {
            if (XLDL.CheckFileType(FileUpload1.FileName))
            {
                string tenhinh = "~/images/" + txtTen.Text.Trim() + "/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(tenhinh));
            }
        }
        string hinh = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
        XLDL.Chaylenh("insert into congty(tencty,quocgia,mota,hinhanh) values(N'" + txtTen.Text.Trim() + "',N'" + txtQuocGia.Text.Trim() + "',N'" + txtMota.Text.Trim() + "','" + hinh + "')");
        Response.Redirect("~/congty.aspx");
    }
}