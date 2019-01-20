using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class CongTy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            motaCty();
        }
    }
    private void motaCty()
    {
        dtMota.DataSource = XLDL.LayDuLieu("select macty,tencty,mota,hinhanh from CONGTY");
        dtMota.DataBind();
    }

    protected void dtMota_EditCommand(object source, DataListCommandEventArgs e)
    {
        int macty = int.Parse(dtMota.DataKeys[e.Item.ItemIndex].ToString());
        Response.Redirect("~/SuaCT.aspx?macty=" + macty);
    }

    protected void dtMota_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int macty = int.Parse(dtMota.DataKeys[e.Item.ItemIndex].ToString());
        try
        {
            string url = "";
            DataTable dt = XLDL.LayDuLieu("select tencty from congty where macty = " + macty);
            if (dt.Rows.Count > 0)
                url = "~/images/" + dt.Rows[0][0];
            if (Directory.Exists(Server.MapPath(url)))
                Directory.Delete(Server.MapPath(url));
            XLDL.Chaylenh("delete from congty where macty=" + macty);
            motaCty();
        }
        catch
        {
            Response.Write("<script>alert('Xóa không thành công')</script>");
        }
    }
}