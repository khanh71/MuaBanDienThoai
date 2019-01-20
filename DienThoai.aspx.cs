using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class DienThoai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dienthoai();
        }
    }
    private void dienthoai()
    {
        dlDienThoai.DataSource = XLDL.LayDuLieu("select masp,tensp,hinhanh from dienthoai");
        dlDienThoai.DataBind();
    }

    protected void dlDienThoai_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string masp = dlDienThoai.DataKeys[e.Item.ItemIndex].ToString();
        string url = "", urlfile = "";
        DataTable td = XLDL.LayDuLieu("select tencty,dienthoai.hinhanh from DIENTHOAI,CONGTY where DIENTHOAI.macty=CONGTY.macty and masp='" + masp + "'");
        if (td.Rows.Count > 0)
        {
            url = "~/images/" + td.Rows[0][0] + "/" + masp;
            urlfile = "~/images/home/" + td.Rows[0][1];
        }
        DataTable dt = XLDL.LayDuLieu("select masp from CTDONHANG where masp='" + masp + "'");
        if (dt.Rows.Count > 0)
        {
            Response.Write("<script>alert('Lỗi ! Không thể xóa sản phẩm')</script>");
        }
        else
        {
            //try
            {
                if(Directory.Exists(Server.MapPath(url)))
                    XLDL.DeleteFolder(Server.MapPath(url));
                if (File.Exists(Server.MapPath(urlfile)))
                    File.Delete(Server.MapPath(urlfile));
                XLDL.Chaylenh("delete from bannersp where masp='" + masp + "'");
                XLDL.Chaylenh("delete from kho where masp='" + masp + "'");
                XLDL.Chaylenh("delete from thongso where masp='" + masp + "'");
                XLDL.Chaylenh("delete from thongsochitiet where masp='" + masp + "'");
                XLDL.Chaylenh("delete from danhgia where masp='" + masp + "'");
                XLDL.Chaylenh("delete from dienthoai where masp='" + masp + "'");
                Response.Write("<script>alert('Sản phẩm được gỡ bỏ thành công')</script>");
                dienthoai();
            }
            /*catch
            {
                Response.Write("<script>alert('Lỗi ! Không thể xóa sản phẩm')</script>");
            }*/
        }
    }
}