using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class SuaTinTuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tintuc();
        }
    }
    private void tintuc()
    {
        dlTinTuc.DataSource = XLDL.LayDuLieu("select * from tintuc where id=" + Request.QueryString["ID"]);
        dlTinTuc.DataBind();
    }
    protected void dlTinTuc_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        TextBox txtTieuDe = (TextBox)e.Item.FindControl("txtTieuDe");
        TextBox txtTomTat = (TextBox)e.Item.FindControl("txtTomTat");
        TextBox txtLink = (TextBox)e.Item.FindControl("txtLink");
        FileUpload FileUpload1 = (FileUpload)e.Item.FindControl("FileUpload1");
        int id = int.Parse(dlTinTuc.DataKeys[e.Item.ItemIndex].ToString());
        try
        {
            if (FileUpload1.HasFile)
            {
                if (XLDL.CheckFileType(FileUpload1.FileName))
                {
                    DataTable dt = XLDL.LayDuLieu("select hinh from tintuc where id=" + id);
                    if(dt.Rows.Count>0)
                    {
                        string urlhinh = "~/images/news/" + dt.Rows[0][0];
                        if (File.Exists(Server.MapPath(urlhinh)))
                            File.Delete(Server.MapPath(urlhinh));
                    }
                    string tenhinh = "~/images/news/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath(tenhinh));
                    string hinh = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
                    XLDL.Chaylenh("update tintuc set tieude=N'" + txtTieuDe.Text.Trim() + "',tomtat=N'" + txtTomTat.Text.Trim() + "',hinh='" + hinh + "',url='" + txtLink.Text.Trim() + "',ngaydang='" + DateTime.Today.ToShortDateString() + "' where id=" + Request.QueryString["id"]);
                }
            }
            else
                XLDL.Chaylenh("update tintuc set tieude=N'" + txtTieuDe.Text.Trim() + "',tomtat=N'" + txtTomTat.Text.Trim() + "',url='" + txtLink.Text.Trim() + "',ngaydang='" + DateTime.Today.ToShortDateString() + "' where id=" + Request.QueryString["id"]);
            Response.Redirect("~/viewtintuc.aspx");
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }
}