using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateTinTuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        try
        {
            string thumuc = "~/images/news";
            if (!Directory.Exists(thumuc))
                Directory.CreateDirectory(Server.MapPath(thumuc));
            if (FileUpload1.HasFile)
            {
                if (XLDL.CheckFileType(FileUpload1.FileName))
                {
                    string tenhinh = "~/images/news/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath(tenhinh));
                }
            }
            string hinh = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
            XLDL.Chaylenh("insert into tintuc(tieude,tomtat,hinh,url,ngaydang) values(N'" + txtTieuDe.Text.Trim() + "',N'" + txtTomTat.Text.Trim() + "','" + hinh + "','" + txtLink.Text.Trim() + "','" + DateTime.Today.ToShortDateString() + "')");
            Response.Redirect("~/viewtintuc.aspx");
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }
}