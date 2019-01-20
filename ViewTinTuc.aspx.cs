using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewTinTuc : System.Web.UI.Page
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
        dlTinTuc.DataSource = XLDL.LayDuLieu("select * from tintuc order by id desc");
        dlTinTuc.DataBind();
    }

    protected void dlTinTuc_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlTinTuc.DataKeys[e.Item.ItemIndex].ToString());
        try
        {
            XLDL.Chaylenh("delete from tintuc where id=" + id);
            Response.Write("<script>alert('Xóa tin tức thành công')</script>");
            tintuc();
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Không thể xóa tin tức')</script>");
        }
    }
}